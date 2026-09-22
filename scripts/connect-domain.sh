#!/usr/bin/env bash
# Bascule bijoux-conseil du sous-chemin GitHub Pages vers son domaine propre.
#
#   ./scripts/connect-domain.sh bijoux-conseil.com
#
# A lancer UNE FOIS le domaine achete ET les DNS poses (voir CLAUDE.md).
# Le script est idempotent : on peut le relancer sans casser quoi que ce soit.
set -euo pipefail

DOMAIN="${1:-}"
REPO="analytics-ds/bijoux-conseil"

if [ -z "$DOMAIN" ]; then
  echo "Usage : $0 <domaine>   (ex: $0 bijoux-conseil.com)" >&2
  exit 1
fi

cd "$(dirname "$0")/.."

echo "==> 1. Controle des DNS"
if command -v dig >/dev/null 2>&1; then
  ips=$(dig +short "$DOMAIN" A | sort | tr '\n' ' ')
  echo "    A records vus : ${ips:-aucun}"
  case "$ips" in
    *185.199.*) echo "    OK, ca pointe bien sur GitHub Pages" ;;
    "")         echo "    ATTENTION : aucun enregistrement A. Les DNS ne sont pas poses ou pas encore propages." ;;
    *)          echo "    ATTENTION : les A records ne pointent pas sur GitHub Pages (185.199.108-111.153)." ;;
  esac
  read -r -p "    Continuer quand meme ? [o/N] " go
  [ "$go" = "o" ] || [ "$go" = "O" ] || { echo "Abandon."; exit 1; }
fi

echo "==> 2. baseURL et CNAME"
sed -i '' "s|^baseURL = .*|baseURL = \"https://$DOMAIN/\"|" hugo.toml
printf '%s' "$DOMAIN" > static/CNAME
grep '^baseURL' hugo.toml

echo "==> 3. Build de controle"
hugo --gc --minify >/dev/null
grep -q "https://$DOMAIN/sitemap.xml" public/robots.txt \
  && echo "    robots.txt et llms.txt suivent le nouveau domaine"

echo "==> 4. Commit et push"
git add hugo.toml static/CNAME
git commit -m "Bascule sur le domaine $DOMAIN

baseURL, CNAME, sitemap, robots.txt et llms.txt suivent automatiquement." || echo "    rien a commiter"
git push origin main

echo "==> 5. Domaine custom cote GitHub Pages"
gh api -X PUT "repos/$REPO/pages" -f cname="$DOMAIN" >/dev/null && echo "    domaine declare"

echo "==> 6. Attente du certificat HTTPS (peut prendre jusqu'a 1 h)"
for i in $(seq 1 40); do
  state=$(gh api "repos/$REPO/pages" --jq '.https_certificate.state // "en_attente"' 2>/dev/null || echo "en_attente")
  echo "    tentative $i : $state"
  [ "$state" = "approved" ] && break
  sleep 90
done

if [ "${state:-}" = "approved" ]; then
  gh api -X PUT "repos/$REPO/pages" -F https_enforced=true >/dev/null
  echo "==> HTTPS force. Le site est sur https://$DOMAIN/"
else
  echo "==> Certificat pas encore emis. Relancer plus tard :"
  echo "    gh api -X PUT repos/$REPO/pages -F https_enforced=true"
fi

echo
echo "Reste a faire a la main :"
echo "  - mettre a jour Site web/CONTEXTE.md et Site web/REFS.md (statut du domaine)"
echo "  - declarer le site dans la Search Console"

# Hugo Site Factory

Ce repo est un template pour creer des sites blogs statiques avec Hugo, optimises SEO/GEO, heberges gratuitement sur GitHub Pages.

## Comment ca marche

Ce repo ne contient pas de site. Il contient les **instructions et templates** pour que Claude Code genere un site complet automatiquement.

### Premier lancement

1. L'utilisateur connecte Claude Code a ce repo
2. L'utilisateur tape `/create-site`
3. Claude pose les questions necessaires (nom du site, couleurs, categories, etc.)
4. Claude genere tout le site Hugo, les fichiers SEO, et configure le deploiement
5. L'utilisateur push sur GitHub, active GitHub Pages, le site est en ligne

### Utilisation courante

- `/create-article` : creer un nouvel article de blog (choix parmi plusieurs types : article standard, comparatif). Push automatiquement sur GitHub si le repo est configure
- `/seo-setup` : generer ou mettre a jour les fichiers SEO techniques de base (robots.txt, llms.txt, sitemap, structured data)
- `/seo` : mode interactif pour modifier/ajouter des elements SEO (meta tags, JSON-LD, audit on-page, etc.)
- `/serve` : lancer le serveur Hugo en local (previsualisation sur `http://localhost:1313/`)
- `/share` : lancer Hugo + ngrok pour partager le site via un lien public (accessible par n'importe qui)
- `/github-setup` : creer un repo GitHub, push le code et activer GitHub Pages (mise en ligne du site)
- `/github-deploy` : push les modifications vers GitHub et declencher le deploiement

## Structure du repo

```
.claude/
├── scripts/
│   └── fetch-image.sh           ← Recuperation auto d'image libre de droit (Openverse API)
├── skills/
│   ├── create-site.md           ← Workflow creation de site complet
│   ├── create-article.md        ← Workflow creation d'article (multi-types)
│   ├── seo-setup.md             ← Workflow fichiers SEO techniques (baseline)
│   ├── seo.md                   ← Mode interactif SEO (modifications ponctuelles)
│   ├── serve.md                 ← Lancer le serveur Hugo en local
│   ├── share.md                 ← Lancer Hugo + ngrok (partage public)
│   ├── github-setup.md          ← Creer un repo GitHub + activer GitHub Pages
│   └── github-deploy.md         ← Push et deployer sur GitHub Pages
└── templates/
    ├── data/
    │   ├── authors.yaml          ← 6 auteurs partages avec bios FR/EN, expertise, topics
    │   └── avatar-prompts.md     ← Prompts de generation des 6 avatars (Midjourney/DALL-E)
    ├── hugo-workflow.yml         ← GitHub Actions CI/CD
    ├── main.css                  ← Design system CSS complet (variables, composants, responsive, a11y)
    ├── articles/                 ← Templates d'articles par type
    │   ├── article-standard.md   ← Article informatif SEO + GEO (type par defaut)
    │   └── geo-comparatif.md     ← Article comparatif avec mise en avant
    ├── seo/                      ← Fichiers SEO techniques (editables)
    │   ├── robots.txt            ← Modele robots.txt
    │   ├── llms.txt              ← Modele llms.txt
    │   └── structured-data/      ← Schemas JSON-LD
    │       ├── article.json      ← Article (avec image et @id croise)
    │       ├── organization.json ← Organization (avec @id, logo, expertise)
    │       ├── author.json       ← Person (auteur)
    │       ├── breadcrumb.json   ← BreadcrumbList
    │       ├── website.json      ← WebSite (avec publisher @id)
    │       └── faq.json          ← FAQPage (genere auto depuis frontmatter)
    ├── layouts/
    │   ├── baseof.html           ← Layout de base (skip-to-content, fonts non-bloquantes, favicon)
    │   ├── home.html             ← Page d'accueil
    │   ├── list.html             ← Pages de liste
    │   ├── single.html           ← Page article (breadcrumb, TOC sticky, image hero, auteur, articles similaires)
    │   ├── sitemap-html.html     ← Page plan du site (liste toutes les pages)
    │   └── 404.html              ← Page 404 custom
    └── partials/
        ├── header.html           ← Header sticky (backdrop-filter, aria-labels, mobile menu)
        ├── footer.html           ← Footer (aria-label, lien plan du site)
        └── seo-head.html         ← Meta tags SEO complets + JSON-LD auto (OG avec image, Twitter, canonical, hreflang, author, article:section, FAQPage auto, Organization @id)
```

## Contexte du site

> Cette section est remplie automatiquement par le skill `/create-site`.
> Elle permet a Claude de connaitre le contexte du site pour les futures actions.

- **Nom du site** : Bijoux Conseil
- **Type de site (reseau PBN GEO datashake)** : Type B, site datashake mutualise
- **Client principal** : Pohesia (e-commerce bijoux et piercings, https://pohesia.com, Shopify)
- **Consultante datashake** : Manon
- **Description (FR)** : Le guide des bijoux et des piercings : comment choisir, comparer et porter boucles d'oreilles, piercings, bagues et colliers.
- **Description (EN)** : The jewellery and piercing guide: how to choose, compare and wear earrings, piercings, rings and necklaces.
- **URL actuelle** : https://analytics-ds.github.io/bijoux-conseil/
- **Domaine prevu** : bijoux-conseil.com, **pas encore achete au 2026-09-22**. La
  bascule est scriptee, voir la section "Brancher le domaine" plus bas
- **Repo GitHub** : https://github.com/analytics-ds/bijoux-conseil (public, branche `main`)
- **Couleurs** : palette terracotta, vert et beige. Primary `#3F5D4A` (vert profond), Primary-light `#55755F`, Primary-dark `#2C4234`, Accent et CTA `#C8734F` (terracotta), CTA-hover `#A95B39`, Background `#FCF8F1` (beige clair), Background-alt `#F1E7D8` (beige soutenu), Text `#2F3A32`, Text-light `#6C7A6F`, Border `#E2D6C2`
- **Polices** : Cormorant Garamond (titres), Lora (corps), Jost (UI)
- **Langue principale** : fr (version EN en sous-dossier `/en/`, toujours active)
- **Categories (FR / EN)** :
  - Boucles d'oreilles / Earrings
  - Piercings / Piercings
  - Bagues / Rings
  - Colliers / Necklaces
  - Idees cadeaux / Gift Ideas
- **Concurrents Pohesia a citer ou comparer** : Solstice, Marc Orian, Obsidian
  Piercing, Nebuleuse Bijoux, Agatha Paris, Les Joyaux d'Aure, Huguette Paris,
  ZAG Bijoux, L'Atelier d'Amaya
- **Auteur principal du site** : `magalie-ergoz` (mode et beaute)
- **Pages statiques actives** : Accueil, Blog, A propos (`/a-propos/`), Contact (`/contact/`), Plan du site (`/plan-du-site/`), et leurs equivalents EN (`/en/about/`, `/en/contact/`, `/en/site-map/`)
- **Theme Hugo** : `bijoux-conseil`, CSS dans `themes/bijoux-conseil/assets/css/main.css`
- **Avatars auteurs** : dans `static/images/authors/`, au format `.jpg` (les 6 personas partages du reseau)
- **YMYL** : non, mais les articles piercings touchent a la sante. Ils decrivent des
  pratiques courantes et des ordres de grandeur, et renvoient systematiquement a un
  professionnel de sante ou a un perceur qualifie. Ne jamais formuler de conseil medical

## Brancher le domaine, le jour ou il est achete

Tout est pret pour la bascule. Elle prend deux minutes cote technique, le reste est
de l'attente de propagation DNS.

### 1. Chez le registrar (a faire a la main, je n'y ai pas acces)

Pour un domaine racine, GitHub Pages demande quatre enregistrements **A** :

```
@   A   185.199.108.153
@   A   185.199.109.153
@   A   185.199.110.153
@   A   185.199.111.153
```

Plus, pour que `www` marche aussi :

```
www CNAME   analytics-ds.github.io.
```

Compter de 10 minutes a quelques heures de propagation.

### 2. Lancer le script

```bash
cd "Site web/bijoux-conseil"
./scripts/connect-domain.sh bijoux-conseil.com
```

Il verifie les DNS, passe le `baseURL`, cree le `CNAME`, rebuild, commit, push,
declare le domaine cote GitHub Pages, attend le certificat puis force le HTTPS.
Il est idempotent, on peut le relancer.

`robots.txt`, `llms.txt`, le sitemap et les balises canoniques suivent
automatiquement, ils sont tous derives du `baseURL`.

### 3. Apres la bascule

- Mettre a jour `Site web/CONTEXTE.md` et `Site web/REFS.md`, colonne domaine
- Declarer le site dans la Search Console et pousser le sitemap
- Verifier que l'ancienne URL `analytics-ds.github.io/bijoux-conseil/` redirige bien

## Specificites techniques de ce site

Trois ecarts par rapport au template d'origine, tous deliberes. Ne pas les defaire.

### 1. Le contenu FR vit dans `content/fr/`, pas a la racine de `content/`

Le template livrait `contentDir = "content"` pour la langue principale et
`contentDir = "content/en"` pour l'anglais. **Ca ne marche pas** : `content/en`
etant un sous-dossier de `content`, le site FR avalait tout le contenu anglais et
generait des categories EN en double (`/categories/earrings/` sur le site FR).
Corrige le 2026-09-22 en isolant le FR dans `content/fr/`. Les URLs ne changent
pas, `defaultContentLanguageInSubdir = false` sert toujours le FR a la racine.

### 2. Un nom de categorie avec apostrophe impose un dossier avec apostrophe

Le dossier d'une page de terme doit reprendre **litteralement** la valeur de la
categorie, apostrophe comprise. D'ou `content/fr/categories/boucles d'oreilles/`,
avec un `slug: "boucles-doreilles"` dans le frontmatter pour garder une URL propre.
Un dossier `boucles-doreilles` ou `boucles-d-oreilles` n'est PAS rattache au terme :
Hugo genere alors une page de terme vide a cote, sans titre ni description.
Meme famille de piege que la regle sur le `&`.

### 3. Les textes d'interface passent par `i18n/`, pas en dur dans les layouts

Les layouts du template avaient les libelles en francais en dur, ce qui faisait
apparaitre du francais sur les pages `/en/`. Tous les libelles sont desormais dans
`i18n/fr.toml` et `i18n/en.toml`. **Ajouter une cle dans les deux fichiers** avant
de l'utiliser dans un layout.

### 5. La home porte un bloc "guides des tailles" en SVG

`themes/bijoux-conseil/layouts/partials/size-guides.html`, insere entre les
categories et les derniers articles. Trois mini-guides dessines **a l'echelle** en
SVG inline : longueurs de collier sur une silhouette, six tailles de bague de 48 a
58, trois diametres de creoles. Les valeurs sont celles des articles, donc **si un
article change, mettre le bloc a jour**. Tous les textes passent par `i18n/`.
Attention en editant les `.toml` : les nouvelles cles se mettent **avant** la table
`[articleCount]`, sinon TOML les range dedans et Hugo refuse de charger les
traductions.

### 6. Le logo : silhouette de femme au collier, plus le nom

Le logo associe une **silhouette pleine** de femme qui porte la main a son collier,
en terracotta, et le nom en Cormorant Garamond majuscules, interlettrage 0.22em,
souligne d'un filet terracotta. La marque fait 24 px de large dans le header.

Deux points a ne pas casser :

- **Le collier est decoupe au masque SVG**, pas peint en couleur de fond. C'est ce
  qui permet a la marque de rester correcte sur le beige du header comme sur le vert
  du favicon. Si un jour on la repeint en aplat, elle cassera sur fond colore.
- **La silhouette est pleine, pas au trait.** Cinq versions au trait ont ete testees
  le 2026-09-22 : aucune ne reste lisible a 24 px, le bras leve se lit comme une
  deuxieme epaule. Le passage en aplat regle le probleme. Ne pas repasser au trait.

Le meme dessin sert dans `static/favicon.svg` (sur carre vert) et
`static/logo.svg` (marque plus nom).

### 7. Categories en illustration, articles en photo

Arbitrage du 2026-09-22, apres avoir constate que le fonds libre de droit rend un
resultat date sur ce sujet.

- **Les 5 cartes de categorie sont des illustrations maison** : SVG au trait,
  terracotta `#C8734F` sur beige `#F4EBDC`, points verts `#3F5D4A`, stroke 3,
  viewBox 400x300, dans `static/images/categories/`. Pas de credit, elles sont a
  nous. Toute nouvelle categorie doit avoir son illustration dans ce style.
- **Les articles portent des photos**, sauf les deux articles piercing, pour
  lesquels le fonds libre n'offre rien d'exploitable : ils ont leur propre
  illustration, dans le meme style, avec une variante EN pour celle qui porte du
  texte (`ear-piercing-healing-time.svg`).
- **Les photos viennent d'Openverse restreint a la source `rawpixel`**
  (`&source=rawpixel` dans l'appel API), la seule qui donne des packshots modernes.
  Sans ce filtre, on recupere du Flickr des annees 2000 et des photos de musee.
- **Toujours regarder les images avant de les garder.** Le premier resultat est
  souvent hors sujet : sur ce site, une radio de crane est sortie pour "piercings",
  un oiseau pour "boucles d'oreilles en argent", un origami pour "idees cadeaux" et
  un collier avec filigrane commercial. Le plus rapide est de telecharger une
  dizaine de candidats et de les regarder en planche contact.

### 4. `robots.txt` et `llms.txt` sont generes par Hugo

Ils ne sont pas dans `static/`. `robots.txt` vient de
`themes/bijoux-conseil/layouts/robots.txt` et `llms.txt` d'un format de sortie
custom (`themes/bijoux-conseil/layouts/index.llms.txt`, declare dans `hugo.toml`).
Les deux suivent donc le `baseURL` automatiquement et se mettront a jour tout seuls
le jour ou le domaine sera connecte. Le `llms.txt` liste les categories et tous les
articles, en FR et en EN.

## Suivi des publications (MEMORY.md)

Le fichier `MEMORY.md` a la racine trace tous les articles publies, classes par semaine. Il est mis a jour automatiquement par `/create-article`.

**Limite de publication : 4 articles par semaine maximum.** Avant chaque creation d'article, le systeme verifie le quota. Si 4 articles sont deja publies dans la semaine en cours, l'utilisateur est averti.

Cette limite sert a eviter la publication en masse et a maintenir un rythme de publication regulier, ce qui est meilleur pour le SEO.

## Regles generales

- **Bilinguisme obligatoire (langue principale + EN)** : tous les blogs generes par ce template sont bilingues. La langue principale est servie a la racine (`/`), la version anglaise en sous-dossier `/en/`. Hugo gere le multilingue via la convention de dossiers `content/` (principale) et `content/en/` (anglais). Chaque article et page a une paire de fichiers avec un `translationKey` identique dans le frontmatter. Le header contient un language switcher automatique. Les balises hreflang sont generees automatiquement par le partial `seo-head.html`. **Ne JAMAIS generer un site ou un article dans une seule langue** — c'est systematiquement FR + EN (ou la langue principale + EN)
- Toujours utiliser `relURL` dans les templates Hugo pour les liens (compatibilite GitHub Pages)
- Les articles vont dans `content/blog/` (langue principale) et `content/en/blog/` (anglais)
- Les slugs sont en minuscules, sans accents, mots separes par des tirets
- Ne JAMAIS utiliser `&` dans les noms de categories ou de tags — toujours remplacer par "et" (Hugo genere un double tiret `--` dans le slug, ce qui casse les URLs)
- Le ton des articles est impersonnel (pas de je/tu/nous/vous) sauf instruction contraire
- Les specs d'article (mots minimum, H2, blocs obligatoires) dependent du type choisi — lire les `<!-- NOTES POUR CLAUDE -->` dans chaque template d'article
- Chaque article doit contenir au minimum 3 liens internes contextuels vers d'autres articles du blog. L'ancre de chaque lien doit contenir le mot-cle principal de l'article cible. **Maillage intra-langue uniquement** : un article FR ne mail que des articles FR, un article EN ne mail que des articles EN (le lien vers la traduction est gere par le language switcher du header)
- **Systeme d'auteurs partage** : 6 auteurs fictifs definis dans `data/authors.yaml` (copie depuis `.claude/templates/data/authors.yaml` a la creation du site). Chaque auteur a un id-slug, un nom, un type (person/organization), un avatar, des `jobTitle`/`role`/`bio` bilingues FR/EN, une liste d'`expertise` et une liste de `topics` (mots-cles pour la selection automatique). Les auteurs disponibles : `thomas-durand` (tech), `magalie-ergoz` (mode/beaute), `claire-beaumont` (maison/habitat), `laura-verdier` (sante/bien-etre), `kevin-moreau` (transport/mobilite), `sophie-martin` (finance/patrimoine)
- **Selection automatique de l'auteur** : dans le frontmatter d'un article, le champ `author` contient l'**ID slug** de l'auteur (ex: `author: thomas-durand`), pas son nom complet. La skill `/create-article` selectionne automatiquement l'auteur le plus pertinent selon les `topics` et `expertise` qui matchent avec le sujet de l'article. Si aucun match clair, l'auteur principal du site (defini dans la section "Contexte du site" de ce CLAUDE.md) est utilise
- **Avatars des auteurs** : fichiers WebP 512x512 dans `static/images/authors/[id].webp`. Style unifie "flat illustration portrait". Prompts de generation documentes dans `.claude/templates/data/avatar-prompts.md`. Si l'avatar est manquant, un placeholder coloree avec la 1ere lettre du nom s'affiche
- **JSON-LD Author** : le partial `seo-head.html` genere automatiquement un schema.org/Person (ou Organization) complet depuis les donnees de `data/authors.yaml` (name, jobTitle, description, knowsAbout, image, sameAs, worksFor)
- **Bloc auteur en bas d'article** : le layout `single.html` affiche automatiquement un encart avec avatar, nom, role, bio complete et expertise de l'auteur, traduit dans la langue de l'article (FR ou EN)
- Les templates SEO dans `.claude/templates/seo/` sont editables par l'utilisateur — toujours lire la version en place avant de generer
- Pour ajouter un nouveau type d'article, creer un `.md` dans `.claude/templates/articles/` — il sera automatiquement propose par `/create-article`
- Pour ajouter un schema JSON-LD, creer un `.json` dans `.claude/templates/seo/structured-data/` et utiliser `/seo` pour l'integrer
- Chaque article doit avoir un champ `lastmod` dans le frontmatter (= date de derniere modification). Il est utilise par le sitemap XML, le sitemap HTML et le schema JSON-LD
- Quand un article est modifie, toujours mettre a jour le champ `lastmod` avec la date du jour
- Le sitemap HTML (`/plan-du-site/`) se regenere automatiquement a chaque build Hugo
- Toujours build et verifier (`hugo`) avant de commit
- Chaque article doit avoir un champ `faq` dans le frontmatter (liste de questions/reponses) pour generer automatiquement le schema FAQPage JSON-LD. Minimum 3 questions
- Chaque article a une image hero OBLIGATOIRE, recuperee automatiquement par `.claude/scripts/fetch-image.sh` au moment de `/create-article`. L'image provient de l'API publique Openverse (federe Wikimedia, Flickr, etc.), filtree sur les licences autorisant l'usage commercial et la modification (CC BY, CC BY-SA, CC0, PDM). Convertie en WebP automatiquement si `cwebp` est installe. Stockee dans `static/images/blog/[slug].webp`
- Le frontmatter contient 3 champs lies a l'image : `image` (chemin Hugo), `imageAlt` (texte alternatif FR, max 125 car), `imageCredit` (attribution du photographe). Ces 3 champs sont remplis automatiquement par le script
- L'image est affichee : (1) dans les cards de la homepage et des pages de liste, (2) en bannière cote a cote avec le titre sur la page article, (3) dans og:image pour les partages sociaux, (4) dans le schema Article JSON-LD
- Le credit photo est affiche sous l'image de l'article (petite mention en italique alignee a droite). Obligatoire pour respecter les licences CC BY et CC BY-SA
- Les Google Fonts sont chargees en non-bloquant (media="print" + swap JS) pour de meilleures performances
- Le layout inclut un lien "Skip to content" pour l'accessibilite
- Les navigations ont des `aria-label` pour les lecteurs d'ecran
- Le CSS respecte `prefers-reduced-motion` pour desactiver les animations si l'utilisateur le demande
- Les articles affichent une table des matieres (TOC) sticky en sidebar, generee automatiquement par Hugo
- Les articles similaires sont affiches en bas de page, calcules par Hugo via la config `[related]` dans hugo.toml

## Comment repondre a l'utilisateur

- Tutoiement, ton decontracte
- Pas de jargon technique sans explication
- Reponses structurees avec listes a puces
- Pas d'emoji sauf demande explicite




## Regle IMPERATIVE : toute nouvelle URL doit apparaitre dans le sitemap + plan de site

**Chaque fois qu une URL est ajoutee au site (article, page, categorie, auteur...), elle DOIT etre presente dans :**

### 1. Le sitemap XML (robots + bots)

Hugo genere automatiquement les sitemaps via :
- `layouts/sitemapindex.xml` -> `/sitemap.xml` (l index qui reference les sitemaps par langue)
- `layouts/sitemap.xml` -> `/fr/sitemap.xml` + `/en/sitemap.xml` (urlsets par langue)

Verifier apres build :
```bash
hugo
grep "<nouveau-slug>" public/fr/sitemap.xml public/en/sitemap.xml
```

### 2. Le plan de site HTML (utilisateurs + bots)

Page `/plan-du-site/` (FR) et `/en/site-map/` (EN) rendues via `layouts/_default/sitemap-html.html`. Elles listent toutes les pages groupees par section (Pages principales, Blog, Categories, Auteurs, Pages legales). Mise a jour automatique au build Hugo.

**LE LIEN VERS `/plan-du-site/` DOIT ETRE PRESENT DANS LE FOOTER DE TOUTES LES PAGES** (via `layouts/partials/footer.html`).

### 3. La page auteur

Page `/authors/<slug-auteur>/` qui liste automatiquement tous les articles dont le frontmatter contient `author: <slug>`. Verifier que le slug de l auteur dans le frontmatter correspond a un auteur defini dans `data/authors.yaml`.

### 4. La liste du blog

Page `/blog/` qui liste les articles par date decroissante. Hugo l inclut automatiquement si le fichier est dans `content/blog/` (FR) ou `content/en/blog/` (EN).

### 5. Le JSON-LD Article (SEO / schema.org)

L article genere automatiquement son schema.org/Article via `seo-head.html` (date, auteur, headline, image).

### 6. Le fichier llms.txt (referencement IA)

Le fichier `static/llms.txt` a la racine du site liste toutes les URLs strategiques destinees aux LLMs (ChatGPT, Claude, Perplexity, etc.).

**A chaque publication ou modification de contenu, ajouter la nouvelle URL dans la section appropriee du fichier `static/llms.txt`.**

Structure attendue :

```markdown
# Nom du Site

> Description courte et factuelle du site

## A propos

Description editoriale (methodologie, independance, auteurs experts, etc.)

## Articles de reference (FR)

- Titre de l'article 1 : https://domaine.com/blog/slug-1/
- Titre de l'article 2 : https://domaine.com/blog/slug-2/
- [a completer a chaque nouvel article]

## Version anglaise (EN) — si multilingue

- Homepage EN : https://domaine.com/en/
- Blog EN : https://domaine.com/en/blog/
- Title of article 1 : https://domaine.com/en/blog/slug-1/

## Informations techniques

- Generateur : Hugo (site statique)
- Multilingue : francais (defaut) + anglais (si applicable)
- Sitemap : https://domaine.com/sitemap.xml
- RSS : https://domaine.com/index.xml
- Schema.org : Organization, Article, BreadcrumbList, FAQPage, WebSite, CollectionPage, Person

## Contact

- URL : https://domaine.com/
```

Apres chaque nouvel article :
1. Ouvrir `static/llms.txt`
2. Ajouter la ligne `- Titre complet : URL absolue` dans la bonne section (FR ou EN)
3. Commit + push

### Workflow post-publication

```bash
# 1. Build
hugo

# 2. Verifier sitemap
grep "<nouveau-slug>" public/fr/sitemap.xml
grep "<nouveau-slug>" public/en/sitemap.xml  # si multilingue

# 3. Verifier plan de site HTML
grep "<nouveau-slug>" public/plan-du-site/index.html

# 4. Verifier page auteur
grep "<titre>" public/authors/<slug>/index.html

# 5. Verifier le footer (plan-du-site doit etre present)
grep "plan-du-site" public/index.html

# 6. Verifier llms.txt (mise a jour manuelle)
grep "<titre>" static/llms.txt

# 7. Commit + push
git add -A && git commit -m "Article : <titre>" && git push origin main
```

**Si l une des 5 verifications echoue, NE PAS COMMIT et debugger.**


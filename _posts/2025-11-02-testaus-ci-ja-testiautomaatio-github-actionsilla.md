---
layout: post
title: 'Testaus: CI ja testiautomaatio Github Actionsilla'
date: 2025-11-02 16:41 +0200
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus-ci/
image: testaus-ci-cover.jpg
---
# Ohjelmiston testaus automatisoidusti: Git, Github ja Github Actions
Tällä ohjeella voit ottaa käyttöön Github Actions -ympäristön ja ajaa testejä automatisoidusti Githubin tarjoamassa palvelussa. Ohjeessa lähtöoletuksena on toimiva kehitysympäristö joka on pystytetty [tämän ohjeen](https://tiko.jamk.fi/~hsateila/posts/vitest-asennus/) mukaan, mutta voit toki käyttää mitä tahansa jo olemassa olevaa repositoriota, johon otat käyttöön automatisoidut testit.

Tämä ohje starttaa suoraan siitä mihin edellä linkitetty ohje päättyy, joten rakenne etenee seuraavasti:
- alustetaan Git-repositorio
- laitetaan .gitignore kuntoon
- luodaan uusi repositorio Githubiin komentoriviltä ja viedään koodi sinne
- otetaan Github Actions käyttöön ja konfiguroidaan se ajamaan testit jokaisen pushin ja pull requestin yhteydessä 

## Git-repositorion alustaminen koodipohjaan ja .gitignore
Mene kansioon jossa Node.js -projektisi juuri sijaitsee (esim. se kansio johon asensit ohjeen Vitest-ympäristön).

Aja seuraava komento, jolla alustetaan git-versionhallinta siihen hakemistoon jossa komennon ajat:

```bash
git init
```
Luo hakemistoon tiedosto nimeltä `.gitignore` (huomaa, nimenomaan tässä muodossa, aloita pisteellä). Gitignorella rajataan versionhallinnan ulkopuolelle Node.js -projektissa buildiartefaktit, väliaikaistiedostot ja erityisesti `node_modules` -kansio. Emme halua paikallisesti asennettuja moduuleja versionhallintaan, vaan ne asennetaan aina uuden ympäristön kohdalla konfiguraation mukaan erikseen. Monilla frameworkeilla ja työkaluilla voi tulla mukanaan `.gitignore` -tiedosto, mutta tässä tapauskessa teemme sen käsin koska harjoitusprojektimme ei sellaisia käytä.

Laita .gitignore -tiedostoon seuraavanlainen sisältö:

```sh
# Node.js
node_modules/

# Logs
logs
*.log
npm-debug.log*

# Dependency directories
pids
logs
*.pid
*.seed
*.pid.lock

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Optional REPL history
.node_repl_history

# Environment variables
.env*
```

Tee repositiorioon ensimmäinen commit, jolla lisäät kaikki tiedostot repositorioon (toki poislukien ne mitkä .gitignore-tiedostossa erikseen jätetään huomiotta). `git add -A` valmistelee kaikki tiedostot commitia varten ja `git commit -m "Initial commit"` tekee ensimmäisen commitin repositorioon commit-viestillä "Initial commit":

```bash
git add -A && git commit -m "Initial commit"
```

## Git-repositorio Githubiin
Voit tehdä tämän homman parhaaksi katsomallasi tavalla, mutta tässä ohjeessa perustetaan Githubiin uusi repositorio Github CLI -komentorivityökalun avulla. Githubin komentorivityökalun asennusohjeet löytyvät [täältä](https://cli.github.com/).

Kun komentorivityökalu on asennettu, kirjaudu sillä sisään seuraavasti:
```bash
gh auth login
```
Valitse haluamasi kirjautumistapa (helpommalla menee luultavasti https) ja kirjaudu vaikka selaimen välityksellä sisään.

Kirjauduttuasi voit luoda repositorion alla olevalla komennolla, jolloin repositoriosta tehdään julkinen. Korvaa komennossa `<repositorionnimi>` haluamallasi repositorion nimellä:

```bash
gh repo create <repositorionnimi> --source=. --remote=origin --push --public
```

Tämän jälkeen voit siirtyä selaimessa Githubiin ja tunnuksellasi pitäisi näkyä juuri luomasi repositorio viimeisine tiedostoineen, poislukien esim. `node_modules`-hakemisto joka `.gitignore` -tiedostossa jätettiin huomiotta. Valitse repositorio ja mene välilehdelle **Github Actions**.

**Get Started with Github Actions** -otsakkeen alta alas vierittelemällä löytyy otsikko **Continuous integration**, ja tämän alta klikkaa **Node.js** -laatikosta **Configure**. Tämä on valmis pohja Node.js -projektin testauksen pystytystä varten.

![Ohjekuva Github Actions -välilehdellä Node.js:n konfigurointiin.](github-actions.png)

Saat esiin pohjan konfiguraatiotiedostolle. Olennaiset kohdat muuttaa tässä ovet työkulun nimi ja node-versio. Voit myös vaikuttaa esimerkiksi millä toiminnalla ja missä branchissa testi ajetaan. Tutustu huolella pohjaan ja etenkin kommentteihin. Pohjatiedosto luo repositorioosi `.github/workflows/` -hakemiston ja sen alle node.js.yml -tiedoston (oletusarvoisesti tällä nimellä, mutta voit sen toki muuttaa esim. yksikkotestit.yml -nimelle).

Muuta nimi haluamaksesi kohdassa `name:`, ja lisää node-versioiden joukkoon versio, joka sinulla on paikallisesti asennettuna ja jolla testit todennetusti toimivat, jos se ei pohjassa jo mukana ole. Tämä löytyy kohdasta `node-version:`. Toimiva `yksikkotestit.yml` -workflowtiedosto näyttää osapuilleen esimerkiksi tällaiselta:

```yml
# This workflow will do a clean installation of node dependencies, cache/restore them, build the source code and run tests across different versions of node
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-nodejs

name: Testaus-opintojakson CI-harjoitus

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:

    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [18.x, 20.x, 22.x, 24.x]
        # See supported Node.js release schedule at https://nodejs.org/en/about/releases/

    steps:
    - uses: actions/checkout@v4
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'npm'
    - run: npm ci
    - run: npm run build --if-present
    - run: npm test
```

Kun teet näillä commitin, voit seurata Githubin repositorion sivulla Actions testien etenemistä. Jos olet noudattant tätä ohjetta (ohjelmistossa oli täsmälleen se laskimen testausympäristö mihin Vitest-ympäristön ohje päättyi) ja testeissä oli lähtökohtaisesti yksi virhe ja yksi onnistunut, tämä aiheuttaa sen, että kaikkien node-ympäristöjen testit epäonnistuvat. Yksi niistä ajetaan ja loput jätetään ajamatta koska yksi epäonnistui.

Korjaa seuraavaksi koodissa mahdollisesti olevat virheet jotka aiheuttavat testien epäonnistumisen. Tämän jälkeen kun teet commitin, testit ajetaan automaattisesti ja sinulle pitäisi tulla vihreä lätkä kun kaikki testit menevät läpi.

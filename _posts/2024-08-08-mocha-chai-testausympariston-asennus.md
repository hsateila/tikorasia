---
layout: post
title: Mocha & Chai -testausympäristön asennus
date: 2024-08-08 13:09 +0300
categories: [Opintojaksot, Testaus]
toc: false
---
## Kehitysympäristön asennusohje

Tarkempi ohje kehitysympäristön asennukseen (tarkista jos on ongelmia tai jos et ole Web-kehitysympäristöt -kurssilla ollut): [Jarkko Immosen kehitysympäristön rakennusohje](https://tiko.jamk.fi/~imjar/ohj1/ymparistoteht.html)

### 1. Luo itsellesi hakemisto, mihin tulet tekemään testauksen tehtävät

Aja terminaalilla tässä hakemistossa komento

```bash
npm init -y
```

Hakemistoon pitäisi ilmestyä tiedosto "package.json". Jos näin ei käy tai saat jonkun virheen, sinulla ei todennäköisesti ole asennettu Nodea. Asenna se haluamallasi tavalla, esim. osoitteesta <https://nodejs.org>

### 2. Aja terminaalilla luomassasi hakemistossa komento

```bash
npm i -D eslint eslint-config-google eslint-config-prettier prettier
```

Nyt hakemistossa pitäisi olla myös tiedosto "package-lock.json" sekä uusi hakemisto, "node_modules".

### 3. Luo hakemistoon tiedosto ".eslintrc" (huom! ei tiedostopäätettä) ja kopioi siihen seuraava koodi

```json
{
  "extends": ["google", "prettier"],
  "parserOptions": {
    "ecmaVersion": 2020
  },

  "env": {
    "es6": true,
    "node": true
  },

  "rules": {
    "require-jsdoc": "off",
    "max-len": "off",
    "padded-blocks": "off",
    "no-console": "off",
    "space-unary-ops": "off",
    "eol-last": "off",
    "func-names": "off",
    "no-param-reassign": "off",
    "linebreak-style": "off",
    "one-var": "off",
    "no-inline-comments": "off",
    "one-var-declaration-per-line": "off",
    "strict": "off",
    "spaced-comment": "off"
  }
}
```

Nyt sinulla tulisi olla konffit samoin, kuin muilla ohjelmoinnin kursseilla.

### 4. Asenna mocha & chai ajamalla terminaalissa komento

```bash
npm install mocha chai --save-dev
```

luomassasi hakemistossa.

Nyt package.json-tiedostossasi tulisi olla jotakin tämän näköistä:

```json
"devDependencies": {
    "chai": "^4.3.7",
    "eslint": "^8.35.0",
    "eslint-config-google": "^0.14.0",
    "eslint-config-prettier": "^8.6.0",
    "mocha": "^10.2.0",
    "prettier": "^2.8.4"
}
```

>**Tällä homma ei vielä toimi**, sillä edellinen komento asensi luultavasti uudemman 5.x.x Chai-version joka tukee ainoastaan ESM-moduuleja, ja harjoituksissa käytetään CommonJS-moduuleita. Tulevaisuudessa tämä tullaan korjaamaan "oikein" eli harjoitukset muokataan tukemaan ESM-moduuleja, mutta tällä kertaa riittää että muokkaat pacakage.json -tiedostossa Chai-versioksi yllä olevan 4.3.7 -version.
{: .prompt-warning}

### 5. package.json tiedostossa on kohta "scripts"

jossa lukee

```json
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
},
```

Päivitä se alla näkyvään muotoon:
```json
"scripts": {
    "test": "npx mocha"
},
```

### 6. Luo ympäristömme testausta varten uusi hakemisto päähakemiston alle, ja anna sille nimeksi vaikkapa "laskin"

Lataa [laskin_koodit.zip](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/laskin_koodit.zip) -tiedosto, jossa on tiedostot "laskin.js" ja "laskinTest.js". Siirry laskin-hakemistoosi (tai miksikä sen nimesit), ja siirrä "laskin.js" sinne. Luo uusi hakemisto nimeltä "test", ja siirrä "laskinTest.js" -tiedosto sinne.

### 7. Aja terminaalissa komento

```npx mocha``` siinä hakemistossa, jossa "laskin.js" on.

### 8. Terminaaliin tulisi tulla tuloste, joka kertoo yhden testin onnistuneen, ja yhden epäonnistuneen

Tulosteen tulisi näyttää enemmän tai vähemmän tältä:

```text
Laskimen testaus
1 + 1 = 2
    √ Tarkistetaan, että plusLasku-funktio palauttaa oikean summan yhteenlaskulla 1 + 1
    1) Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2


  1 passing (8ms)
  1 failing

  1) Laskimen testaus
       Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2:
     ReferenceError: tulos is not defined
      at Laskin.miinusLasku (Laskin.js:27:39)
      at Context.<anonymous> (test\laskinTest.js:13:31)
      at process.processImmediate (node:internal/timers:471:21)
```

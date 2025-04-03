---
layout: post
title: 'Testaus: Kehitysympäristön pystytys Vitestillä'
date: 2025-04-03 22:46 +0300
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus/
---
# Kehitysympäristö kuntoon

Tsekkaa että kehitysympäristö on viritetty kuten muillakin opintojaksoilla. Tarkempi ohje kehitysympäristön asennukseen: [Jarkko Immosen kehitysympäristön rakennusohje](https://tiko.jamk.fi/~imjar/ohj1/ymparistoteht.html). Tämä pitää olla kunnossa ennen kuin jatkat kohtaan Testausympäristön valmistelu.

# Testausympäristön valmistelu

Luo itsellesi hakemisto, johon tulet tekemään testauksen tehtävät.

Aja terminaalissa tässä hakemistossa komento

```shell
npm init -y
```

Hakemistoon pitäisi ilmestyä tiedosto "package.json". Jos näin ei käy tai saat jonkin virheilmoituksen, sinulla ei todennäköisesti ole Node asennettuna. Tarkista että hommat on tehty [Jarkon ohjeen](https://tiko.jamk.fi/~imjar/ohj1/ymparistoteht.html) mukaan.

Aja luomassasi hakemistossa terminaalissa seuraava komento:

```shell
npm i -D eslint eslint-config-google eslint-config-prettier prettier
```

Tällä asennetaan tarvittavat moduulit jotta meillä on käytössä sama sovelluspohja kuin muillakin opintojaksoilla.

Luo tämän jälkeen hakemistoon tiedosto nimellä ".eslintrc" (ei tiedostopäätettä, tiedoston nimi täsmälleen kuten heittomerkkien välissä on kerrottu), ja kopioi siihen sisällöksi alla oleva koodi:

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

Nyt sinulla pitäisi olla sovelluksen pohja samanlainen kuin muillakin opintojaksoilla. Tähän lähdetään nyt rakentamaan testausympäristöä ja testejä [Vitest-testausframeworkilla](https://vitest.dev/).

# Yksikkötestaus - Vitestin asennus

Asenna Vitest-framework projektiisi ajamalla projektisi hakemistossa seuraava komento:

```shell
npm install -D vitest
```

Argumentti `-D` kertoo Node Package Managerille (`npm`) että vitest tulee asentaa riippuvuudeksi vain kehitysympäristöön. Sama temppu onnistuu argumentilla `--save-dev` josta `-D` on lyhenne.

## Testauksen konfigurointi package.jsoniin

package.json -tiedostossa on kohta, jossa lukee

```json
"scripts": {
  "test": ""echo \"Error: no test specified\" && exit 1""
},
```

Tämä konfiguraatio kertoo npm:lle miten testit ajetaan. Oletusarvoisesti komennolla `npm run test `tulostetaan yllä olevan mukainen viesti ja lopetetaan suoritus. Muokkaa tuota kohtaa siten että komennolla `npm run test` ajetaan vitest ja sen sisältämät testit (ks. alla)

```json
"scripts": {
  "test": "vitest"
},
```

Muokkauksen jälkeen `package.json` -tiedoston sisällön tulisi näyttää osapuilleen tältä:

```json
{
  "name": "harkat",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
      "test": "vitest run"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": "",
  "devDependencies": {
    "eslint": "^9.22.0",
    "eslint-config-google": "^0.14.0",
    "eslint-config-prettier": "^10.1.1",
    "prettier": "^3.5.3",
    "vitest": "^3.0.8"
  }
}
```

Testaa nyt ajamalla komento `npm run test`. Jos kaikki on oikein, saat ilmoituksen siitä että testitiedostoja ei löytynyt (esimerkki alla). Lopeta testiajo painamalla `ctrl+c`.

```shell
No test files found. You can change the file name pattern by pressing "p"

include: **/*.{test,spec}.?(c|m)[jt]s?(x)
exclude:  **/node_modules/**, **/dist/**, **/cypress/**, **/.{idea,git,cache,output,temp}/**, **/{karma,rollup,webpack,vite,vitest,jest,ava,babel,nyc,cypress,tsup,build,eslint,prettier}.config.*
```

# Ensimmäinen testi

Luo päähakemiston alle ymäristön testausta varten nimellä `laskin`.

Lataa ja pura [laskin_koodit.zip](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/laskin_koodit.zip) -tiedosto, jossa on tiedostot `laskin.js` ja `laskin.test.js`. Siirry `laskin`-hakemistoosi (tai miksikä sen nimesit), ja siirrä molemmat tiedostot sinne.

Purettuasi tiedostot, aja samassa hakemistossa komento `npm run test`. Tulosteen pitäisi näyttää enemmän tai vähemmän tältä:

```shell
stdout | laskin/laskin.test.js > Laskimen testaus > Tarkistetaan, että plusLasku-funktio palauttaa oikean summan yhteenlaskulla 1 + 1
1 + 1 = 2

 ❯ laskin/laskin.test.js (2 tests | 1 failed) 3ms
   ✓ Laskimen testaus > Tarkistetaan, että plusLasku-funktio palauttaa oikean summan yhteenlaskulla 1 + 1
   × Laskimen testaus > Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2 2ms
     → tulos is not defined

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯ Failed Tests 1 ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

 FAIL  laskin/laskin.test.js > Laskimen testaus > Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2
ReferenceError: tulos is not defined
 ❯ Laskin.miinusLasku laskin/laskin.js:27:39
     25|  */
     26| Laskin.prototype.miinusLasku = function (a, b) {
     27|   console.log(a + ' - ' + b + ' = ' + tulos);
       |                                       ^
     28|   return tulos;
     29| };
 ❯ laskin/laskin.test.js:10:19

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯[1/1]⎯


 Test Files  1 failed (1)
      Tests  1 failed | 1 passed (2)
   Start at  16:56:03
   Duration  199ms (transform 12ms, setup 0ms, collect 10ms, tests 3ms, environment 0ms, prepare 30ms)
```

Yksi testi onnistui, yksi epäonnistui. Korjaa laskin.js:n koodia niin että myös toinen testi menee läpi, ja aja `npm run test` uudelleen.

# End-to-end -testaus: Cypress-ympäristön asennus

[Cypressin asennus](https://tiko.jamk.fi/~hsateila/posts/cypressin-asennus/)

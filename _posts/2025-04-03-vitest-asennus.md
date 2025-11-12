---
layout: post
title: 'Testaus: Kehitysympäristön pystytys Vitestillä'
date: 2025-04-03 22:46 +0300
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus/
image: testaus-vitest-cover.jpg
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
npm init @eslint/config@latest
```

Tällä asennetaan ESLint-moduuli ja konfiguroidaan se projektia varten. Konfiguraatio esittää muutaman kysymyksen, ja voit vastata seuraavasti:

```shell
? What do you want to lint? -> Valitse Javascript

? How would you like to use ESLint? -> To check syntax and find problems

? What type of modules does your project use? -> JavaScript modules (import/export)

? Which framework does your project use? -> None of these

? Does your project use TypeScript? -> No

? Where does your code run? -> Node (ota valinta pois kohdasta Browser)

The config that you've selected requires the following dependencies:

eslint, @eslint/js, globals
? Would you like to install them now? › Yes

? Which package manager do you want to use? -> npm
```

Nyt sinulla pitäisi olla sovelluksen pohja valmiina testaushommiin. Tähän lähdetään nyt rakentamaan testausympäristöä ja testejä [Vitest-testausframeworkilla](https://vitest.dev/).

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

Tämä konfiguraatio kertoo npm:lle miten testit ajetaan. Oletusarvoisesti komennolla `npm test` tulostetaan yllä olevan mukainen viesti ja lopetetaan suoritus. Muokkaa tuota kohtaa siten että komennolla `npm test` ajetaan vitest ja sen sisältämät testit (ks. alla)

```json
"scripts": {
  "test": "vitest run"
},
```

Muokkauksen jälkeen `package.json` -tiedoston sisällön tulisi näyttää osapuilleen tältä:

```json
{
  "name": "testaus-laskin",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "vitest run"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "module",
  "devDependencies": {
    "@eslint/js": "^9.39.1",
    "eslint": "^9.39.1",
    "globals": "^16.5.0",
    "vitest": "^4.0.8"
  }
}
```

> **Protip!**
Voit käyttää package.json -tiedostossa `"test"` -skriptin ajettavana arvona joko arvoa `"vitest run"` tai `"vitest"`. Erona näiden välillä on, että `"vitest run"` ajaa testit vain kerran ja palaa komentoriville, siinä missä `"vitest"` jättää testiprosessin päälle ja kuuntelemaan muutoksia ja tällöin prosessi on katkaistava painamalla `q`tai CTRL+c -tervehdyksellä.
{: .prompt-info}

Testaa nyt ajamalla komento `npm test`. Jos kaikki on oikein, saat ilmoituksen siitä että testitiedostoja ei löytynyt (esimerkki alla). Lopeta testiajo painamalla `q` jos package.jsonissasi oli testien ajamiseen komento `"vitest"`. Muutoin ajo päättyy automaattisesti ja palaa komentoriville.

```shell
No test files found. You can change the file name pattern by pressing "p"

include: **/*.{test,spec}.?(c|m)[jt]s?(x)
exclude:  **/node_modules/**, **/dist/**, **/cypress/**, **/.{idea,git,cache,output,temp}/**, **/{karma,rollup,webpack,vite,vitest,jest,ava,babel,nyc,cypress,tsup,build,eslint,prettier}.config.*
```

# Ensimmäinen testi

Luo päähakemiston alle ymäristön testausta varten hakemistot nimellä `laskin` ja `test`.

Lataa ja pura [laskin_koodit.zip](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/laskin_koodit.zip) -tiedosto, jossa on tiedostot `laskin.js` ja `laskin.test.js`. Siirrä `laskin.js` kansioon `laskin` ja `laskin.test.js` kansioon `tests`

Purettuasi ja siirrettyäsi tiedostot paikoilleen, projektin juurihakemistoon ja aja komento `npm test`. Tulosteen pitäisi näyttää enemmän tai vähemmän tältä:

```shell
> testaus-laskin@1.0.0 test
> vitest run


 RUN  v4.0.8 /Users/hsateila/Documents/Jamk/Opintojaksot/Testaus-2025/testaus-laskin

stdout | tests/laskin.test.js > Laskimen testaus > should add two numbers correctly and return the sum of 1 + 1
1 + 1 = 2

 ❯ tests/laskin.test.js (2 tests | 1 failed) 3ms
   ❯ Laskimen testaus (2)
     ✓ should add two numbers correctly and return the sum of 1 + 1 1ms
     × Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2 2ms

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯ Failed Tests 1 ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

 FAIL  tests/laskin.test.js > Laskimen testaus > Tarkistetaan, että miinusLasku-funktio palauttaa oikean erotuksen vähennyslaskulla 5 - 2
ReferenceError: tulos is not defined
 ❯ Laskin.miinusLasku laskin/laskin.js:27:39
     25|  */
     26| Laskin.prototype.miinusLasku = function (a, b) {
     27|   console.log(a + ' - ' + b + ' = ' + tulos);
       |                                       ^
     28|   return tulos;
     29| };
 ❯ tests/laskin.test.js:11:31

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯[1/1]⎯


 Test Files  1 failed (1)
      Tests  1 failed | 1 passed (2)
   Start at  18:39:42
   Duration  109ms (transform 12ms, setup 0ms, collect 20ms, tests 3ms, environment 0ms, prepare 2ms)
```

Yksi testi onnistui, yksi epäonnistui. Korjaa laskin.js:n koodia niin että myös toinen testi menee läpi, ja aja `npm test` uudelleen.

# End-to-end -testaus: Cypress-ympäristön asennus

[Cypressin asennus](https://tiko.jamk.fi/~hsateila/posts/cypressin-asennus/)

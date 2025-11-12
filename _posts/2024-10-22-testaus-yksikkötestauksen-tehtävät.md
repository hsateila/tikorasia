---
layout: post
title: 'Testaus: Yksikkötestauksen tehtävät'
date: 2024-10-22 16:46 +0300
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus/
image: testaus-unit-test-cover.jpg
---

## Opastusta alkuun

- Vinkkiä testien tekemiseen voi katsella vaikka [Vitestin dokumentaatiosta](https://vitest.dev/api/expect.html). Yleisesti ottaen, käy läpi erilaisia tarkistusfunktioita (assertion: väittämä, varmistus) ja valitse niistä tapaukseen sopivin. 

- Pidä testit mahdollisimman yksinkertaisina mutta kuitenkin niin, että testi on mielestäsi riittävän kattava jotta yleisimmät virheet jäävät kiinni. 

- Voit tehdä esimerkiksi describellä test suiten kustakin tehtävästä ja palastella testauksen sopiviksi katsomiisi yksikkötesteihin. 

Alla yleinen pohjaratkaisu yksittäiseen yksikkötestiin:

```javascript
  it('should do something', () => {
    // Arrange: Set up test data
    const input = ...;
    
    // Act: Execute the function
    const result = functionToTest(input);
    
    // Assert: Verify the result
    expect(result).toBe(expected);
  });
```

## Yksikkötestaus, tehtävä 1

Lataa alla oleva ravintola.js ohjelmakooditiedosto. Luo tehtävähakemistoosi uusi alahakemisto tätä tehtävää varten, ja siirrä ravintola.js-tiedosto sinne.

[ravintola.js](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/ravintola.js)

Luo vielä `tests` -hakemisto testikoodeja varten jos sitä ei projektissa jo ole, ja luo uusi `ravintola.test.js` -tiedosto sinne.
Sen jälkeen toteuta seuraavat testit.

### Tehtävä 1.1
Testaa, että `laskeLasku` -funktio palauttaa oikein summan.

### Tehtävä 1.2
Testaa, että `palautaTaulukonSatunnainenArvo` funktio palauttaa arvon, joka löytyy joistakin Ravintolan taulukoista (alkuroat, paaruoat, jalkiruoat tai juomat). Tarkista siis, että palautusarvo löytyy valitsemastasi taulukosta.

### Tehtävä 1.3
Testaa, että `syoRavintolassa` funktio palauttaa oikean tyyppisen arvon.

## Yksikkötestaus, tehtävä 2

**Ravintolan ohjelmakoodi on päivittynyt**, joten päivitä itse koodisi seuraavasta tiedostosta: [ravintola_updated.js](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/ravintola_updated.js)

Päivitettyäsi koodin toteuta seuraavat kohdat itse ohjelmakoodiin:

### Ohjelmakoodiin tehtävät muutokset

1. Viimeistele `generoiPaikat`-funktio JSDocin mukaisesti. Tarkastele viimeistään nyt [JSDocin dokumentaatiota](https://jsdoc.app/).

2. `varaaPaikat`-funktio on jäänyt pahasti kesken. Kirjoita funktion koodi seuraavien ohjeiden mukaisesti:

- Tarkistaa, että `paikat`-muuttujassa on taulukko. Jos ei ole, luo sen generoiPaikat funktiolla
- Jos `varaukseMaara`:lle ei ole annettu arvoa, asettaa arvoksi 1
- Laskee vapaiden paikkojen määrän `paikat` -muuttujan taulukosta. Vapaissa paikoissa on arvona false.
- Jos vapaiden paikkojen määrä on pienempi kuin `varauksenMaara`, palauttaa falsen
- Jos läpäistään kohta 4, eli vapaita paikkoja on enemmän kuin `varauksenMaara`, käydään läpi `paikat` -taulukkoa ja muutetaan vapaiden paikkojen määrän mukaisesti false-arvoja trueksi.
- Kohdan 5 jälkeen palautetaan true

Kirjoita myös **JSDoc** funktiolle tekemäsi koodin mukaisesti.

1. Ota `varaaPaikat` -funktio käyttöön sille sopivassa kohdassa, kun syoRavintolassa-funktiota kutsutaan.

2. Muokkaa ruoka-taulukoita niin, että jokaisella ruoalla on oma hintansa geneerisen hinnan sijaan. Taulukoissa tulisi siis olla oliota, joilla on 2 arvoa - ruoka & hinta.

Esimerkki:

5. Muokkaa `laskeLasku` -funktio toimimaan muuttuneella ohjelmakoodilla. Funktion ei tarvitse enää parametrikseen boolean-arvoja, vaan tieto löytyy olemassa olevasta taulukosta.

6. Vapaaehtoinen extra: Mitä muuta ohjelmakoodissa tulisi muokata?

### Testikoodin toteutus

Varmista, että ohjelmakoodisi toimii oikein tekemällä seuraavat testitatapaukset:

**Testitapaus 1:** Kutsu syoRavintolassa funktiota argumentilla, joka on pienempi tai yhtäsuuri kuin paikkojen määrä.

**Testitapaus 2:** Kutsu syoRavintolassa funktiota ensiksi argumentilla 10, ja sen jälkeen argumentilla 6. Riippuen Testitapaus 1:n argumentista, joko 1. tai 2. syoRavintolassa-funktiokutsun ei tulisi mennä enää läpi. Tässä voi hyödyntää [Vitestin Expect().toThrowError():ia](https://vitest.dev/api/expect.html#tothrowerror)

**Testitapaus 3:** Tarkista, että `laskeLasku`-funktio toimii oikein uudella ohjelmakoodilla.

Jos parametrit ja argumentit meinaavat mennä sekaisin, [MDN:n dokumentaatiosta](https://developer.mozilla.org/en-US/docs/Glossary/Parameter) löytyy selkeä esimerkki.

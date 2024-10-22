---
layout: post
title: 'Testaus: Yksikkötestauksen tehtävät'
date: 2024-10-22 16:46 +0300
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus/
---

## Yksikkötestaus, tehtävä 1

Lataa alla oleva ravintola.js ohjelmakooditiedosto. Luo tehtävähakemistoosi uusi alahakemisto tätä tehtävää varten, ja siirrä ravintola.js-tiedosto sinne.

[ravintola.js](https://tiko.jamk.fi/~hsateila/materiaalit/testaus/ravintola.js)

Luo vielä ```test``` -hakemisto testikoodeja varten, ja luo uusi ```ravintolaTest.js``` -tiedosto sinne.
Sen jälkeen toteuta seuraavat testit.

### Tehtävä 1.1
Testaa, että ```laskeLasku``` -funktio palauttaa oikein summan.

### Tehtävä 1.2
Testaa, että ```palautaTaulukonSatunnainenArvo``` funktio palauttaa arvon, joka löytyy joistakin Ravintolan taulukoista (alkuroat, paaruoat, jalkiruoat tai juomat). Tarkista siis, että palautusarvo löytyy valitsemastasi taulukosta.

### Tehtävä 1.3
Testaa, että ```syoRavintolassa``` funktio palauttaa oikean tyyppisen arvon.

Vinkkiä testien tekemiseen voi katsella vaikka [Chain dokumentaatiosta](https://www.chaijs.com/api/assert/).

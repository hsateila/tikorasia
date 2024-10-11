---
layout: post
title: Cypressin asennus
date: 2024-08-08 13:42 +0300
categories: [Opintojaksot, Testaus]
toc: false
media_subpath: /assets/media/cypressin-asennus
---
## 1. Luo itsellesi hakemisto, johon tulet tekemään end-to-end -testauksen tehtävät

Kansion nimi voi olla vaikkapa testausharkat-end-to-end. Aja terminaalilla tässä hakemistossa komento

```bash
npm init y
```

Vaihtoehtoisesti, jos työskentelet samassa hakemistossa kuin mihin teit aiemmin yksikkötestauksen tehtävät, sinun ei tarvitse alustaa uutta node-projektia npm:n avulla. Tällöin luot uuden hakemiston Cypressiä varten ja ajat komentorivillä komennon

```bash
npm install cypress --save-dev
```

## 2. Kun Cypress on asentunut, aja komento

```bash
npx cypress open
```

Tässä voi kestää hetki, odota kärsivällisesti. Jos onnistui, Cypressin graafinen käyttöliittymä avautuu.

>HUOM! ```npx cypress open``` -komento tulee ajaa sen hakemiston **juuressa** johon node-projekti on alustettu ja cypress asennettu, **ei** cypress-hakemiston sisällä!
{: .prompt-warning }

## 3. Valitse valikosta E2E Testing

Jos graafinen käyttöliittymä näyttää sinulla erilaiselta, tarkista Cypressin versio ja tarvittaessa päivitä se uudempaan. Node package manager todennäköisesti tarjoilee oletusarvoisesti sopivaa 13. -alkuista versiota joka sopii harjoituksiin hyvin.

![Welcome to Cypress](welcome-to-cypress-1.jpg "welcome-to-cypress-1")

## 4. Seuraavaksi pitäisi tulla dialogi jossa lukee "Configuration files"

Voit jatkaa vain painamalla alareunasta "Continue".

## 5. Tämän jälkeen valitse haluamasi selain

Cypress tarjoaa oletusarvoisesti Chromea tai Electronia sekä mahdollisesti muita selaimia joita on asennettuna. Kummankin pitäisi toimia, mutta Electron on selaimen sijasta sovelluskehys (framework), jolla voidaan rakentaa itsenäisiä työpöytäsovelluksia käyttäen samoja web-teknologioita millä selainpohjaisia sovelluksiakin rakennetaan.

## 6. Jos kaikki meni oikein, Cypress avautuu valitsemallasi selaimella

Saat todennäköisesti ikkunan, jossa lukee "Create your first spec", koska sinulla ei vielä ole yhtään testiä.

## 7. Paina kohtaa "Create new spec" ja luo uusi spec

Polkua ei tarvitse vaihtaa jollet välttämättä halua. Tämä luo sinulle automaattisen testin: aja tämä testi ja katso mitä tapahtuu.

## 8. Etsi luomasi testitiedosto

Oletusarvoisesti polku on luomasi testiharjoituskansion alla `/cypress/e2e/spec.cy.js`. Korvaa tässä tiedostossa oleva koodi alla olevalla koodilla:

![Testikoodi](test-code.jpg "test-code")

## 9. Cypressin tulisi ajaa päivitetty testikoodi uudelleen selaimessasi

Katso mitä tapahtuu! Tarvittaessa voit sulkea Cypressin avaaman selainikkunan, ja jos prosessi jäi terminaaliin pyörimään, voit pysäyttää sen painamalla ctrl + c ja tämän jälkeen käynnistää Cypressin uudelleen komennolla `npx cypress open`

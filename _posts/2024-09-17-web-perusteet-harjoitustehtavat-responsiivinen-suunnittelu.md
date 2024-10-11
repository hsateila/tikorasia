---
layout: post
title: 'Web-perusteet: Harjoitustehtävät, Responsiivinen suunnittelu'
date: 2024-09-17 11:12 +0300
categories: [Opintojaksot, Web-perusteet]
media_subpath: /assets/media/web-perusteet-responsiivinen-suunnittelu/
---
_Mahtavat kiitokset Teemu Pölkille ja Jarkko Immoselle tämän materiaalin pohjana toimineesta englanninkielisestä opetusmateriaalista._

## Responsiivisten verkkosivujen suunnittelu

Responsiivinen suunnittelu verkkosivujen yhteydessä tarkoittaa sellaista ulkoasusuunnittelua, jossa sivupohja sopeutuu laitteeseen ja ruutukokoon jolla sivustoa tarkastellaan. Muutamia esimerkkejä responsiivisesta suunnittelusta ovat [Fazer](https://www.fazer.fi/), [The Boston Globe](https://www.bostonglobe.com/) ja [Helsingin Sanomat](https://www.hs.fi/). Selaa sivuja ja muuta selainikkunan kokoa jolloin näet miten sivu käyttäytyy pienemmässä ikkunakoossa. Tarkastele sivuja myös puhelimellasi.

Selaimen kehittäjätyökaluilla voi myös tarkastella sivuja simuloiden näkymää erilaisilla laitteilla:

![Kehittäjätyökalut ja responsiivisuus](webtools-responsive.png){: width="400" }

Kun saat hieman käsitystä siitä mikä responsiivisen suunnittelun ajatus on, tutustu seuraavaan materiaaliin:

- [Beginner's guide to media queries (MDN)](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Media_queries)
- [Historiaa: Responsive Web Design - ensimmäisiä artikkeleita responsiivisuudesta](https://alistapart.com/article/responsive-web-design/)
- [MDN:n dokumentaatio responsiivisesta suunnittelusta](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)

[Media queryt](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries/Using_media_queries) mahdollistavat erilaisen laiteriippuvaisen ulkoasun ja tyylien luomisen samalle sivulle. Laitteiden ja ruutujen tyyppi, leveys, suunta ja tarkkuus (resoluutio) vaihtelee, joten erilaisia laitteita on huomioitava sivuston suunnittelussa. Lähtökohtana on nykyisin käytännössä aina niin sanottu **_Mobile First_** -suunnittelufilosofia, joka perustuu siihen faktaan että suurinta osaa sivustoista käytetään nykyisin voittopuolisesti erilaisilla mobiililaitteilla (puhelimet, tabletit) ja niissäkin sekä pysty- että vaakatasossa.

Media queryillä voidaan sovittaa ulkoasu erilaisille laitteille, mutta jotta päästään todelliseen responsiiviseen suunnitteluun, elementtien tulee skaalautua suhteessa näyttöruudun (viewport) kokoon. Tämä saavutetaan niin sanotun **_Fluid layout_** -suunnittelutavan avulla.

> Perusajatuksena puhdas HTML-rakenne ilman tyylittelyjä on lähtökohtaisesti **Fluid layout**: se muotoutuu ruutukoon muuttuessa automaattisesti. Voit testata tätä kommentoimalla kaikki tyylitiedostot pois HTML-tiedostostasi väliaikaisesti.
{: .prompt-info }

### Box-sizing property

> Alla oleva on syytä sisäistää hyvin, sillä se vaikuttaa kaikkeen siihen mitä jatkossa teemme!
{: .prompt-warning}

**```box-sizing``` -CSS-propertylla määritellään se, miten elementin kokonaisleveys ja korkeus lasketaan.**

Oletusarvo propertylla on CSS:n normaali laatikkomalli, jossa antamasi leveys- ja korkeusarvot renderöidään elementin **sisältölaatikolle**. Tässä tapauksessa, jos elementillä on minkäänlaista reunaviivaa (border) tai täytettä (padding), ne _lisätään_ kokonaisleveyteen antamiesi arvojen päälle. Lopullinen, näytettävä leveys on siis suurempi kuin antamasi arvot. Tästä johtuen joudut säätämään antamiasi leveys- ja korkeusarvoja kun haluat huomioida reunaviivan ja padding-arvon koko laatikon leveydessä.

**Esimerkki:** jos asetat leveydeksi 25%, itse sisältölaatikko on kyllä tuon levyinen, mutta tähän päälle lisätään borderin ja paddingin leveys. Jos sinulla siis on neljä laatikkoa joiden leveys on 25%, ne eivät mahdu näyttöruutuun koskaan vierekkäin koska mukaan lasketaan päälle aina border ja padding.

```box-sizing: content-box``` asettaa oletusarvoisen CSS box-sizing-toiminnallisuuden. Jos asetat elementin leveydeksi 100 pikseliä, elementin sisältölaatikon leveys on tällöin 100 pikseliä leveä, ja tähän lisätään päälle border ja padding jos sellaisia on elementille annettu. Tästä muodostuu laatikon lopullinen, näytettävä leveys, jolloin lopullinen laatikko on leveämpi kuin 100px. Esimerkiksi

```css
.box {
  width: 350px;
  border: 10px solid black;
}
```
renderöi laatikon jonka leveys on 370 pikseliä.

```box-sizing: border-box``` kertoo selaimelle että leveyteen täytyy laskea mukaan border ja padding -leveydet, mikäli sellaisia on elementille annettu. Jos asetat elementin leveydeksi tässä tapauksessa 100px, 100px sisältää tällöin sekä reunan että täytteen leveyden. Sisältölaatikko sen sijaan kutistuu vastaavasti näiden leveyden verran. Esimerkiksi sama yllä oleva koodi tällä propertyn ```box-sizing:```arvolla ```border-box```

```css
.box {
  width: 350px;
  border: 10px solid black;
}
```

näyttäisi laatikon jonka leveys on 350 pikseliä, mutta itse sisältölaatikon koko olisi tällöin 330px.

#### 45. Valmistautuminen responsiivisen suunnittelun harjoituksiin

Lataa [rwdex.zip](https://tiko.jamk.fi/~hsateila/files/rwdex.zip) ja pura se. Voit purkaa tämän vaikkapa omaan kansioonsa harjoitustyökansiosi alle. Paketti sisältää yksinkertaisen verkkosivun johon on rakennettu **_mobile first_** -tyyppinen asettelu. Tehtäväsi on luoda responsiivinen verkkosivu määrittelyjen mukaisesti ja niiden asetteluiden mukaan mitkä on annettu alla olevissa kuvissa. Saat neljä media querya joihin sinun on tehtävä tarvittavat muutokset.

Muuta kaikki marginaalit ja täytteet (margins and paddings) käyttämään rem tai em -yksiköitä.

Oletusasetteluillaan sivu näyttää tältä:

![RWD-esimerkki ja malli](rwd-example-1.png){: width="200" }

#### 46. 564px

Alta näet esimerkkikuvat mihin tulisi pyrkiä. Viewportin eli näkymän leveys on asetettu 650px.

![RWD-esimerkki, 650px, yläosa.](resp-650px-top.png){: width="200" }

![RWD-esimerkki, 650px, alaosa.](resp-650px-bottom.png){: width="200" }

- Luo media query joka astuu voimaan kun sivun leveys on suurempi kuin 564 pikseliä.
- Otsikot ovat hieman turhan lähellä #container -divin reunaa. Lisää sääntö joka asettaa marginaalin vasempaan reunaan ja on yhden juurielementin fontin levyinen (vihje: rem-yksikkö!).
- Piilota (älä siis poista!) "Jump to navigation" -teksti.
- Siirrä navigaatioelementti sivun alaosasta sivun yläosaan. **Älä muokkaa HTML-koodia** vaan sijoittele navigaatio uudelleen CSS:n avulla. Poista harmaa tausta. Asettele navigaation listaelementit yhdelle riville (inline).
- Aseta 0.5rem marginaali oikeaan reunaan ja 1rem marginaali vasempaan reunaan.
- Listaelementeille jotka sijaitsevat nav-elementin sisällä: lisää 0.5rem padding ylä- ja alaosaan ja 0 padding vasempaan ja oikeaan reunaan. Käytä :hover -pseudoluokkaa muuttaaksesi listaelementin taustavärin vaaleammaksi kun hiiri on ao. listaelementin päällä.
- Keskitä kaikki kuvat omien elementtiensä sisällä.

#### 47. 700px

Esimerkkikuvat jälleen alla sen suhteen mihin pyritään. Viewportin leveys asetetaan 750px.

![RWD-esimerkki, 650px, yläosa.](resp-750px-top.png){: width="200" }

![RWD-esimerkki, 650px, alaosa.](resp-750px-bottom.png){: width="200" }

Kuvat ovat liian suuria näyttöön, on syytä skaalata niitä pienemmiksi ja kelluttaa ne float-propertylla vasemmalle ja oikealle.

- Luo media query joka astuu voimaan kun sivu on leveämpi kuin 700 pikseliä.
- Käytä ```float: left;``` ja ```float: right;``` -propertyja niitä vastaaville luokille ja aseta kuvien leveys 45%.

#### 48. 850px

Ja esimerkkikuvat taas alla. Viewportin leveys 1200px.

![RWD-esimerkki, 650px, yläosa.](resp-1200px-top.png){: width="200" }

![RWD-esimerkki, 650px, alaosa.](resp-1200px-bottom.png){: width="200" }

Lisäleveys antaa mahdollisuuden siirtää ```aside```-elementin ruudun oikeaan reunaan ja navigaation voi siirtää sivun oikeaan yläkulmaan.

- Luo media query joka astuu voimaan kun sivu on leveämpi kuin 850px.
- Siirrä navigaation linkit sivun oikeaan yläkulmaan.
- Skaalaa content-div ja aside-elementti pienemmiksi prosenttiyksiköitä käyttäen. Lisää prosenttiyksiköillä marginaalia aside-elementille. Prosenttien tulisi yhteenlaskettuna olla 100%.
- Kelluta float-propertylla elementit oikealle ja vasemmalle parhaaksi katsomallasi tavalla.
- Aseta containerin maksimileveys. Noin 1000px on riittävä. Aseta containerille sellaiset tyylit että se keskitetään oman containerinsa sisällä.
- Aseta footer-elementille padding 1rem. Aseta myös taustan väri. Tässä kohtaa saattaa ilmetä hankaluuksia float-propertyjen ja taustavärin kanssa. Korjaa ongelma [tämän artikkelin](https://www.w3schools.com/cssref/pr_class_clear.php) vinkkien avulla.

### Grid ja Flex

Käy läpi tutoriaalit [Flexbox](https://scrimba.com/g/gflexbox):lle ja [CSS Grid](https://scrimba.com/g/gR8PTE):lle. Voit aloittaa muokkaamalla annettua koodia, kokeilla asioita ja missä tahansa tutoriaalin vaiheessa jatkaessasi muutoksesi tallentuvat muistilehtiövälilehteen oikealla.

> **Flexbox** on erittäin hyödyllinen työkalu asetteluiden suunnitteluun. [CSS Flexbox Layout Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) on erittäin mainio lunttilappu CSS-kikoista ja asetteluista joita aiheeseen liittyy, laita se talteen kirjanmerkkeihin!
{: .prompt-info}
> **CSS Grid** on toinen erittäin käyttökelpoinen ja varmasti vastaan tuleva asia, ja tästä on olemassa samantyyppinen hieno lunttilappu: [CSS Grid Layout Guide](https://css-tricks.com/snippets/css/complete-guide-grid/). Lisää kirjanmerkkeihin tämäkin!
{: .prompt-info}

#### 49. Flexboxin ja CSS Gridin konseptien esittelyä pelien avulla

Pelaa ja läpäise seuraavat pelit:

- [Flexbox Froggy](https://flexboxfroggy.com/)
- [Flexbox Defence](http://www.flexboxdefense.com/)
- [CSS Grid Garden](https://cssgridgarden.com/)

#### 50. Uusi projekti ja uusi HTML5-tehtävä

Aloita uusi projekti ja kopioi esimerkkinä toimiva XHTML-koodi [tältä sivulta](https://tiko.jamk.fi/~hsateila/materiaalit/recipesite/recipes.html) ja lisää se recipes.html -nimiseen tiedostoon projektiisi. XHTML on vanhempi HTML-standardi ajalta ennen HTML5:ta ja nyt modernisoidaan tämä dokumentti.

- Kopioi talteen myös kaikki liittyvät kuvat (citrus, logo, mainokset ja reseptikuvat) ja luo projektiin "pics"-niminen alikansio johon tallennat kuvat.
- Korjaa linkkiviittaukset jotta saat kuvat toimimaan.
- Muuta recipes.html HTML5:ksi (katso [täältä](https://www.w3schools.com/tags/tag_doctype.asp) vinkit).
- Vaihda divit, jotka toimivat nyt sectioneina, HTML5-elementeiksi ([tässä hieman muistin virkistystä semantiikasta](https://html5forwebdesigners.com/semantics/index.html))
- Validoi koodi ja korjaa validointivirheet tarvittaessa.

#### 51. "A weird flex, but ok"

Käytä Flexboxia ja lisää hieman responsiivisuutta sivun mainoksiin! Kuvien tulisi pysyä samalla rivillä kunnes tilaa ei enää ole. Tämän jälkeen niiden tulisi "wrappaytyä". Lisää marginaalia mainoksille flex-containerin sisään. Käytä jälkeläisselectoreita!

Esimerkkikuvat alla:

##### Esimerkki 1

![Esimerkki 1](weird-flex-1.png)

##### Esimerkki 2

![Esimerkki 2](weird-flex-2.png)

##### Esimerkki 3

![Esimerkki 3](weird-flex-3.png)

#### 52. Kuvat ruudukossa (eli gridissä!)

##### Osa 1

Luo kopio alkuperäisestä recipes.html -tiedostosta ja anna sille nimeksi ```food_gallery.html```. Linkitä sivut: tee uusi linkki kummankin sivun nav-osastoon ja linkitä ne toisiinsa sellaisenaan. Alkuperäisen sivun navigaatioon linkki tiedostoon ```food_gallery.html``` ja uuteen linkki sivuun ```recipes.html```.

Poista uudelta sivulta pääsisältö. Jätä paikalleen header, navigation, footer, aside ja ads.

##### Osa 2

Etsi ruokakuvia Creative Commons -haulla tai [tämän paketin](https://tiko.jamk.fi/~hsateila/files/gridpic.zip) kuvia. Tallenna ne projektiisi kansioon josta löydät ne.

Luo uusi CSS grid -elementti johon luot kuvagallerian. Katso esimerkki [tästä](../../assets/media/web-perusteet-responsiivinen-suunnittelu/css-grid-1.png), ja jätä siniset "rajat" huomiotta, siinä meille vain Firefox kertoo missä gridin rajat ovat! Gridissä tulisi olla kolme saraketta ja kolme riviä.

Lisää pieni väli rivien ja sarakkeiden väliin ja keskitä kuvat vertikaalisesti "lokeroihinsa".

##### Osa 3

Luo media query joka laskee sarakkeiden määrää kahteen kun kuvat muuttuvat liian pieniksi. Katso [esimerkkikuva](../../assets/media/web-perusteet-responsiivinen-suunnittelu/css-grid-2.png).

##### Osa 4

Luo media query joka muuttaa CSS gridin flexbox-sarakkeeksi! Lopputuloksesta [esimerkki tässä](../../assets/media/web-perusteet-responsiivinen-suunnittelu/css-grid-3.png).

---
layout: post
title: 'Web-perusteet: Harjoitustehtävät, CSS'
date: 2024-09-09 15:01 +0300
categories: [Opintojaksot, Web-perusteet]
---
_Mahtavat kiitokset Teemu Pölkille ja Jarkko Immoselle tämän materiaalin pohjana toimineesta englanninkielisestä opetusmateriaalista._

## CSS: käyttö

Cascading Style Sheets eli CSS-tyylit tarjoavat verkkodokumentin julkaisijalle mahdollisuuden hallita julkaisun ulkoasua hyvin tarkasti. Näitä tyylimäärittelyitä voidaan käyttää myös muualal kuin verkkosivuilla. Tyylien käyttämiseksi tarvitaan kuitenkin toimiva HTML-syntaksi ja rakenne kun sitä käytetään verkkosivuston ulkoasun rakentamiseen.

Lue [CSS:n esittely](https://tiko.jamk.fi/~polkte/webui/css.html) ensin jotta pääset jyvälle CSS:n syntaksista eli kieliopista. Seuraavaksi lisäämme tyylimäärityksiä tekemäämme HTML-dokumenttiin ulkoasun muokkaamiseksi.

### 17. Span-elementti

Seuraavan kahden harjoituksen tarkoitus on luoda [suuria alkukirjaimia (drop cap)](https://en.wiktionary.org/wiki/drop_cap). Merkkaa ensin ensimmäisen kappaleen ensimmäinen kirjain ```<span>```-elementillä. Virkistä sivu. Kuten näet, span-elementti itsessään ei vielä vaikuta ulkoasuun millään lailla. Tarvitaan tyylimäärittely jotta span-elementti vaikuttaa sisältöön jollakin tavalla. Tässä mielessä span on samankaltainen div-elementin ja semanttisten elementtien, kuten footer ja section, kanssa. Lisäämme tyylit seuraavaksi.

### 18. Suuret alkukirjaimet

Lisää style-tagin sisään tyylimäärittely span-elementille jotta saat suuren alkukirjaimen käyttöön. Lopputuloksen tulisi sivulla näyttää suurien alkukirjainten osalta [suurin piirtein tältä](../../assets/media/web-perusteet-css/ex_17_dropcaps.png). Alla listattuna tarvittavat tyylimäärittelyt. Voit lisätä tyylit kolmella tavalla, jotka on kerrottu aiemmin linkitetyssä CSS:n esittely -ohjeessa.

```css
float: left;
padding-right: 4px;
font-size: 44px;
line-height: 40px;
```

- Tapa 1: Lisää tyyli-atribuutti erikseen joka ikiseen span-elementtiin.
- Tapa 2: Lisää tyylimäärittelyt head-elementin sisässä sijaitsevaan style-elementtiin. Jos lisäsit attribuutit span-elementteihin, muista poistaa ne.
- Tapa 3: Luo tyhjä CSS-tiedosto ja linkitä se HTML-dokumenttiin. Siirrä kaikki tyylimäärittelyt erilliseen CSS-tiedostoon. Poista style-tagi head-osiosxta.

Mikä on mielestäsi paras tapa lisät tyylit HTML-dokumenttiin? Mitkä ovat kunkin menetelmän hyödyt ja haitat? Kirjoita vastaus kommenttina HTML-tiedostoosi.

### MHOO 4. CSS:n debuggaus

Tämä harjoitus jatkaa MHOO3:n pohjalta. Lue [tutoriaali MDN:stä](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Debugging_CSS).

## Marginaalit, värit ja taustakuvat

Koko dokumentille (eli verkkosivulle) marginaalit määritellään body-elementtiin. Kuten muissakin tyyleissä, asetetut marginaalit ajavat ohi niistä mitä selain renderöi oletusarvoisesti jos marginaaleja ei ole määritelty.

Muiden elementtien marginaalit määritellään samaan tapaan aina kyseessä olevalle elementille. Listaelementeille ```<ul>``` tai ```<ol>``` marginaalit tulee määritellä näihin listaelementteihin suoraan, ei yksittäisille listan jäsenille (```<li>``` -elementti).

Mittayksiköistä: CSS-määrittelyissä voi käyttää useita erilaisia mittayksiköitä. Osa näistä on koon suhteen absoluuttisia (esimerkiksi in eli tuuma, cm eli senttimetri, pixel eli pikselikoko). Osa yksiköistä on suhteellisia (esimerkiksi em, joka on suhteellinen sen elementin fonttikokoon jossa yksikköä käytetään, tai prosentti). Lisätietoa [CSS:n mittayksiköistä](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units).

[Värit](https://www.w3schools.com/cssref/css_colors.php) voidaan myös määritellä usealla eri tavalla CSS:ssä. Usein käytetään värin heksadesimaaliarvoa (esim. vaaleansininen #ADD8E6). Nyt, kun CSS3:ssa on esitelty myös läpinäkyvyys väriarvolle, voi olla järkevää tilanteesta riippuen käyttää myös värin RGB-arvoa joka sisältää tiedon läpinäkyvyydestä. Värin voi määritellä myös suoraan värin nimellä (esim. suoraan ```color: blue;```), mutta tätä tulisi käyttää vain aivan perusvärien tapauksessa. Usen värit määritellään yrityksen tai verkkosivun graafisessa ohjeistossa sekä RGB- että heksadesimaaliarvoilla.

### 19. CSS:n lisääminen ulkoiseen tiedostoon

Lisää uusia tyylimäärityksiä ulkoiseen tyylitiedostoon. Määritä koko dokumentin leveydensi 50% ja määritä 16 pikselin marginaali dokumentin ylä- sekä alalaitaan ja 30 pikselin marginaali sekä vasempaan että oikeaan laitaan. Määrittele myös _kahden tyhjän rivin korkuinen marginaali_ ennen jokaista otsikkoa. Vinkki: rivin korkeuden tulisi olla riippuvainen fontin koosta, katso suhteelliset fontit (relative fonts).

### 20. Heksadesimaalit, RGP:t ja alpha-kanava

Aseta taustan väri haluamaksesi käyttäen värin heksadesimaalimerkintää ja pääotsikolle haluamasi väri käyttäen RGB-merkintätapaa. Lopuksi määritä h2-elementtien taustaväri RGBA-arvoilla. RGBA:n avulla voit määritellä värille myös läpinäkyvyysarvon.

### 21. Pystysuorat taustat

Etsi jokin sopiva taustakuva, tallenna se img-kansioon ja aseta se taustakuvaksi koko dokumentille. Aseta taustakuva toistumaan vain vertikaalisesti (pystytasossa), ei horisontaalisesti (vaakatasossa).

Luo myös pystysuora liukuväritausta tekstikappaleille. Voit tehdä liukuväritaustakuvan vaikkapa [Gradient Image Makerilla](https://angrytools.com/gradient/image/). Määritä taustakuva toistumaan vaakatasossa ja määritä taustan väri niin että se on sama kuin taustakuvan liukuvärin alin väri. Esimerkkilopputuloksen näet [tästä](../../assets/media/web-perusteet-css/gradient_example.png).

CSS3:n avulla voi tehdä liukuvärin suoraankin. Voit etsiä tähän ohjeet nyt, mutta tähän palataan myöhemminkin.

Lisätietoa taustan ominaisuuksista löydät täältä: [Background properties](http://www.tizag.com/cssT/background.php).

### 22. Värien määrittely

Määritä fonttien värit kappaleille ja otsikoille.

## ID't, luokat ja kontekstisidonnaiset valitsimet

Jotta homma helpottuu, yllä olevat termit englanniksi ovat _id_, _class_ ja _contextual selector_.

**```id```-attribuuttia** käytetään _yksilöllisesti_ tunnistamaan mikä tahansa elementti html-dokumentissa. Elementin yksilöllinen tunnistaminen tarkoittaa sitä että sivulla voi olla _vain ja ainoastaan_ yksi id sille annetulla nimellä. Tunniste on ns. _case sensitive_, eli isoilla ja pienillä kirjaimilla on ero. _tunniste_ ja _Tunniste_ ovat siis kaksi erilaista yksilöivää tunnistetta. Tunnisteen nimen voi valita vapaasti mutta se ei voi sisältää välimerkkejä eikä erikoismerkkejä (eikä oikeastaan ääkkösiäkään...).

Yksilöllinen tunniste mahdollistaa tyylimäärityksen tekemisen nimenomaan tähän valikoituun elementtiin eikä tämä tyylimääritys vaikuta muualle. Id merkitään CSS-koodissa risuaidalla (hash) #. Esimerkkinä seuraavassa on määritelty tunniste HTML-koodissa, ja sen jälkeen tunnistetta käytetään CSS-koodissa:

```html
<div id="hero"></div>
<img id="big-logo">
```
```css
#hero {
    color: black;
}
#big-logo {
    width: 100%;
}
```

**```class```-attribuuttia** (luokka) käytetään määrittelemään tyylejä elementtiluokalle. Yhdessä luokassa voi olla useampia elementtejä joille tyylit määritellään. Tämä tarkoittaa siis sitä että HTML-dokumentissa voi esiintyä useampi kuin yksi elementti samannimisellä class-attribuutilla. Elementti voi myös kuulua useampaan kuin yhteen luokkaan, eli sillä voi olla useampia class-attribuutteja. CSS-koodissa luokan merkitsevä merkki on piste ```.```. Esimerkkinä jälleen ensin HTML-koodi jossa luokkia käytetään, ja tämän jälkeen CSS jossa elementeille määritellään tyyli sen luokka-attribuutin perusteella:

```html
<h1 class="red">Otsikkoteksti</h1>
<p class="red">Kappaleteksti.</p>
```
```css
.red {
    color: red;
}
```

Yksilöllisen tunnisteen (id) ja luokkatunnisteen (class) lisäksi voidaan käyttää niin sanottua **kontekstisidonnaista valitsinta (contextual selector)** CSS-koodissa löytämään oikea elementti HTML-dokumentista. Nämä valitsimet voivat olla monimutkaisiakin, ja on tarpeen ymmärtää jotakin [HTML-dokumentin rakennemallista (Document Object Model, DOM)](https://www.w3schools.com/js/js_htmldom.asp) jotta käyttö onnistuu oikein. Kontekstisidonnaisuus tarkoittaa siis sitä että elementti löydetään sen perusteella mitä sen lähistöllä sijaitsee.

Sisäkkäiset elementtirakenteet (nested elements): Ulompaa elementtia kutsutaan sisemmän elementin enlanniksi termillä _parent_. Suomeksi tämä voisi kääntyä _vanhempi_ tai _isäntäobjekti_. Sisempi elementti taas on vastaavasti _child_ eli lapsi. Saman _vanhemman_ _lapset_ ovat luonnollisesti _sisaruksia_ (_siblings_) keskenään ja lapset ovat vanhempansa _jälkeläisiä_ (_descendants_). Kaksi vierekkäistä sisarusta ovat keskenään _adjacent siblings_.

CSS-valitsimilla voidaan rakentaa varsin monimutkaisia kombinaatioita sen mukaan mihin tyylejä halutaan lisätä. Lisää CSS-selectoreista voi lukea [täältä](https://www.sitepoint.com/css-selectors/).

**Valitsin ```a b c```** valitsee elementit ```c```jotka ovat elementin ```b```jälkeläisiä, jotka taas ovat elementin ```a```jälkeläisiä. Seuraavassa jälleen esimerkki HTML-koodista, jonka jälkeen CSS tällä valitsimella johon tyyli kohdistetaan. Ensin etsitään div-elementti jonka luokka on "copy", ja sen sisältä elementti h1 jossa on sisällä jälkeläisenä elementti em. Jos tällaisia löytyy useampia, tyyli vaikuttaa kaikkiin.

```html
<div class="copy">
    <h1>Otsikko <em>jossa</em> on tekstiä</h1>
</div>
```
```css
div.copy h1 em {
    color: red;
}
```

**Valitsin ```*```** on niin sanottu villi kortti. Valitsin ```a * b```osuu kaikkiin ```b```-elementteihin jotka ovat elementin ```a```jälkeläisiä riippumatta siitä mikä elementti on elementin ```b```vanhempi.

```css
div.copy * em {
    color: red;
}
```

**Valitsin ```>```** valitsee kaikki elementin suorat jälkeläiset. ```a > b``` valitsee kaikki ```b```-elementit jotka ovat ```a```:n välittömiä jälkeläisiä.

```css
div.copy > p > em {
    color: red;
}
```

**Valitsin ```+```** valitsee viereisen sisaruksen. Esimerkissä ```a + b```valitaan b jos se on sisaruksena heti a:n jälkeen dokumentissa.

```css
p + p em {
    color: red;
}
```

**Valitsin ```~```valitsee yleisesti ```b```:n jos se vain ylipäätänsä sijaitsee ```a```:n jälkeen: ```a ~ b````

```css
p + p em {
    color: red;
}
```

Esimerkkejä miltä sivuston pitäisi suurin piirtein näyttää harjoituksen 35 jälkeen: [Kuva 1](../../assets/media/web-perusteet-css/ex35_1.png), [Kuva 2](../../assets/media/web-perusteet-css/ex35_2.png), [Kuva 3](../../assets/media/web-perusteet-css/ex35_3.png).

### 24. Lisää semantiikkaa

Jos ei jo ole, niin nyt käytä elementtejä nav, header ja footer erottamaan sivuston nämä osiot. ```<header>```-elementin tulisi sisältää banneri ja pääotsikko, ```<nav>```sisältää linkkilistan ja ```<footer>```copyright-tiedot. Käytä div-elementtiä id:llä _content_ erottamaan toisen tason otsikot ja kappaleet muusta sisällöstä.

### 25. Tausta navigaatiolle

Etsi jälleen sopiva taustakuva ja aseta se taustaksi ```<nav>```-osiolle. Asettele tämä taustakuva nav-elementin oikeaan yläkulmaan.

### 26. Lisää spannia

Oletettakoon että haluat vahvistaa joitakin sanoja tai lauseita (esimerkiksi varoituksia) dokumentissasi, mutta **boldauksen** tai _italicin_ sijaan haluat tehdä niistä punaisia.

Valitse dokumentistasi muutamia sanoja ja merkitse ne ```<span>```-elementillä. Virkistä sivu ja huomaat mahdollisesti että sinulla on ongelma. Voit ratkaista sen esimerkiksi luomalla luokat _dropcap_ ja _warning_ ja määritellä span-elementeille nämä luokat niille kuuluviin paikkoihin ja muokkaamalla tyylimäärityksiä siten että nämä kohdistuvat vain niihin span-elementteihin joilla on kyseinen luokka.

### 27. Container-elementit

#### Osa 1

Laita koko sisältö (heti alun body-tagin jälkeen ja juuri ennen sulkevaa body-tagia) uusi div-elementti. Kääritään siis koko sisältö uuden div-elementin sisään. Tällaista container-elementtiä yleensä käytetään käärimään koko sisältö sisäänsä body-elementin sisässä. Mutta miksi?

#### Osa 2

Aseta CSS-tyylissä luomallesi containerille kiinteä leveys (poista tämä määritys body-elementiltä) ja sijoita se vaakatasossa selainikkunan keskelle (poista myös marginaalit body-elementiltä). Huomaa että sisällön pitäisi pysyä selaimen keskiosassa riippumatta siitä minkä levyinen itse selainikkuna on.

#### Osa 3

Kommentoi CSS:ssä (CSS-kommentit merkitään ```/*``` ja ```*/``` sisään) ```background-repeat: repeat-y;```määritys body-elementiltä ja aseta taustaväri sen sijaan container diville.

### MHOO 5. BEM (Block, Element Modifier)

Tutustu BEM:n [tällä videolla](https://www.youtube.com/watch?v=er1JEDuPbZQ) ja lukemalla [tämä dokumentaatio](https://en.bem.info/methodology/quick-start/).

## Reunaviivat (borders) ja täytteet (paddings)

Reunaviivan tyyli, leveys ja väri voidaan määritellä tyylissä joko samalla kertaa tai erillisinä parametreina. On olemassa valmiita reunaviivatyyppejä, kuten solid, dotted jne. Jos halutaan erilaisia värejä tai leveyksiä, tarvitaan niitä varten oma tyylimäärityksensä.

Kun elementti tarvitsee tilaa ympärilleen sekä ulko- että sisäpuolelle, käytetään määrittelyparametreja margin (marginaali) ja padding (täyte). Oletusarvot marginaalille ja täytteelle vaihtelevat selainkohtaisesti, ja ovat erilaisia kullekin elementille. Tästä johtuen on suositeltavaa asettaa nämä parametrit joka tapauskessa, jotta ulkoasu pysyy yhtenäisenä kaikissa selaimissa.

Ymmärtääksesi margin- ja padding-parametrit hyvin, sinun täytyy tuntea [CSS:n laatikkomalli eli CSS Box Model](https://www.w3schools.com/Css/css_boxmodel.asp).

### 28. Reunaviivat ja täytteet

Aseta 1px kiiteä reunaviiva container-diville. Lisää myös padding samaan containeriin jotta saat sivulle hieman lisää ilmavuutta.

Mikä on nyt container divin todellinen leveys? Hyödynnä selaintyökaluja tämän selvittämiseksi!

### 29. Taulukot 2

Muokkaa dokumentissasi olevia taulukoita seuraavasti:

- Lisää [```<caption>```-elementti](http://www.w3schools.com/tags/tag_caption.asp) jokaiselle taulukolle.
- Aseta jokaiselle taulukolle oma taustakuva
- Aseta taulukon taustaväri erikseen sekä parittomille että parillisille riveille
- Pienennä caption-tekstin kokoa (käytä prosenttia yksikkönä, esimerkiksi 75%)
- Tyylittele caption-teksti haluamallasi tavalla
- Siirrä caption-teksti taulukon alaosaan
- aseta marginaalit siten että captionin ylä- ja alapuolella on yhden rivin verran tilaa.

### 30. Lisää reunaviivoja

Ympäröi tekstikappaleet kiinteällä 4 pikselin reunaviivalla (```solid 4px border```). "Sisennä" kappaleet siten että asetat vaaleamman värin yläreunaan ja vajostava värisivuille sekä tummempi alareunaan.

Aseta padding sellaiseksi että se on kaksi kertaa fontin koko vasemmassa ja oikeassa reunassa, ja 1x juurielementin fonttikokoa vastaava padding kappaleiden ylä- ja alaosaan. Käytä [lyhennettyjä parametreja](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties) marginille ja paddingille.

### 31. Linkkejä pisterajauksella

Anna kaikille niille kuville, jotka ovat linkkejä, pistereunaviiva (dotted border). Jos olet edennyt harjoituksen mukaan, näitä kuvia on vain yksi. Käytä kuitenkin yleistä parametria valitsemalla jälkeläinen. Jätä kuvan ja reunaviivan hieman tilaa sekä sisä- että ulkopuolelle (margin, ja padding).

## Pseudoluokat

Monilla HTML-elementeillä on niihin liittyviä erikoistiloja. Esimerkiksi linkki voi olla neljässä tilassa jotka kaikki voi tyylitellä yksilöllisesti. [Pseudoluokka](https://www.w3schools.com/css/css_pseudo_classes.asp) on valmiiksi määritelty tila tai elementin käyttötapaus joka voidaan tyylitellä erikseen.

**Linkit:** pseudoluokkia käytetään tyylittelemään linkin normaali tila, se miltä linkki näyttää kun siellä on jo vierailtu (visited), miltä linkki näyttää silloin kun sen päälle viedään hiiren kursori (hover) ja miltä linkki näyttää silloin kun käyttäjä klikkaa linkkiä

**Dynaamiset pseudoluokat:** Pseudoluokan voi lisätä mihin tahansa elementtiin kun määritellään esimerkiksi sitä miltä elementti näyttää kun sen päälle viedään hiiri, sitä klikataan tai se on valittu.

**Rakenteelliset pseudoluokat:** pseudoluokat muistuttavat rakenteeltaan yhdistelmävalitsimia kun valitaan elementtien sisaruksia, mutta sallivat elementtien tyylittelyn joka perustuu joko täsmällisesti annettuun tai laskettuun sijaintiin. [Rakenteellisen pseudoluokan](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes#tree-structural_pseudo-classes) avulla voi muodostaa selectorin jolla päästään käsiksi HTML-elementteihin rakenteessa käyttämällä vaikkapa pseudoluokkaa ```:last-child```, joka valitsee elementin viimeisen jälkeläisen.

### 32. Linkit pseudoluokilla

Lisää tyylimääritykset dokumentin linkeille. Varmista että määrittelet seuraavat pseudoluokat:

- link
- active
- hover
- focus
- visited

### 33. Pseudoluokka kuviin

Aiemmin lisäsit pisteviivan niihin kuviin jotka toimivat myös linkkinä. Lisää nyt hover -pseudoluokka joka muuttaa pistereunaviivat kiinteiksi reunaviivoiksi ja näyttää reunaviivan pelkästään ylä- ja alareunassa kun käyttäjä vie hiiren kuvan päälle.

### 34. Rakenteelliset pseudoluokat

Lisää [rakenteellinen pseudoluokka](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes#tree-structural_pseudo-classes) niin, että oikeanpuoleisimmat taulukon solut jokaisessa taulukossa on varustettu punaisella taustavärillä. Pyri tekemään tämä niin ettet tee muutoksia HTML-koodiin, vaan tee toteutus puhtaasti CSS-selectoreilla ja tyyleillä.

Katso [esimerkki](../../assets/media/web-perusteet-css/tablecolors.png).

Aiemmin asetit erilaisen taustavärin parittomille ja parillisille riveille käyttäen luokkia. Muuta nyt fontin väri joka toisella rivillä käyttäen pseudo-luokkia (jälleen, tee tämä CSS-koodilla koskematta HTML-rakenteeseen).

### MHOO 6. Pseudoelentit

Lue seuraavat tutoriaalit:

- [Pseudo-classes and pseudo-elements (MDN)](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements)
- [CSS Pseudo-elements (Javapoint)](https://www.javatpoint.com/css-pseudo-elements)
- [Pseudo-elements (Web.dev)](https://web.dev/learn/css/pseudo-elements/)

1. Luo uusi järjestelemätön lista (ul) ja lisää siihen neljä listaelementtiä. Käytä oikeaa pseudoelementtiä löytääksesi CSS:llä oikean kohdan ja muuta oletustyyliä.
2. Käytä ```::before``` -pseudoelementtiä muuttaaksesi tyylin emojiksi.
3. Käytä oikeaa pseudoelementtiä muuttaaksesi valitun tekstin tyyliä. Muuta taustaväri esimerkiksi vihreäksi.

## Asettelun luonti ja sijainti (positioning)

>**Elementtien ryhmittely on ensisijaisen tärkeää kun luodaan CSS-pohjaisia verkkosivuasetteluita!** Joten: viimeistään tässä vaiheessa, käy läpi dokumenttisi rakenne, tarkista erityisesti ryhmittely ja validoi HTML-rakenne validaattorilla ja korjaa virheet. Asettelun luonti ei onnistu jos elementit on ryhmitelty väärin tai HTML-merkkauksessa on virheitä, kuten puuttuvia sulkevia tageja, &gt;-merkkejä tms.
{: .prompt-warning}

Normaalin DOM:n (eli HTML-dokumentin) renderöintijärjestyksen voi CSS:n avulla muuttaa. On erilaisia tapoja muuttaa elementtien ja blokkien sijaintia, esimerkiksi [float](https://www.w3schools.com/css/css_float.asp) ja [position](https://www.w3schools.com/Css/css_positioning.asp) -propertyt. CSS3 tarjoaa myös gridin ja flexboxin tähän tarkoitukseen, ja ne ovatkin varsin olennaisia, mutta palaamme niihin myöhemmin.

Tsekkaa [CSS-positioning 101](http://www.alistapart.com/articles/css-positioning-101/) ja [CSS positioning in 10 steps](http://www.barelyfitz.com/screencast/html-training/css/positioning/).

### 35. Disclaimer näkysälle

Lisää seuraavanlainen HTML-snippet verkkosivullesi ```header```- ja ```<nav>```-osioiden väliin. Lisää myös alempaa löytyvä tyylimäärittely CSS-tiedostoosi.

```html
<div id="disclaimer">
<img src="http://www.1clipart.com/clipart/signs/exclamation/74-415115695.gif" alt="Note" />
This is an example document for Web Page Development course.  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Curabitur a nisi venenatis velit tempus adipiscing quis ac tellus. Suspendisse egestas luctus hendrerit. Nam pulvinar
sagittis sem a vehicula. Morbi dapibus euismod est ut blandit. Sed vel mauris sapien, vel porttitor magna. Nullam luctus,
lorem eu mattis fringilla, justo lectus malesuada risus, vel viverra ligula eros ac ipsum. Curabitur in felis odio, ut imperdiet
augue. Duis auctor interdum magna, ac porttitor felis porttitor et. Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur ridiculus mus. Donec orci erat, consectetur id dignissim quis, sodales id magna. Sed aliquam accumsan nibh, nec
aliquam nulla aliquam sit amet. Quisque risus tortor, sodales a vulputate vitae, aliquet vitae dui. Integer et magna metus.
Nulla tristique lobortis sapien eu condimentum.
</div>
```

```css
#disclaimer {
    border: 1px dotted red;
    background-color: #ddd;
    color: #000;
    margin-left: 2em;
    margin-right: 2em;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    padding: 1em;
}
```

### 36. Kelluvat kuvat

Seuraavaksi kääri teksti huutomerkkikuvan kanssa [esimerkin](../../assets/media/web-perusteet-css/disclaimer_wrap.png) mukaisesti. Homman pitäisi luonnistua suhteellisen helposti ```float```-propertyn avulla. Lisää myös hieman täytettä (padding) oikealle puolelle kuvaa.

### 37. Kelluvat kuvat, osa 2

Laita teksti kääriytymään linkin sisältävän kuvan ympärille, samaan tapaan kuin edellisessä harjoituksessa paitsi että sijoita kuva tällä kertaa oikealle. Lisähaasteena muokkaa koodia seuraavasti:

```html
<p><a href="http://www.jamk.fi">
<img src="http://tiko.jamk.fi/~polkte/webui/images/tikoblue.png" alt="JAMK/TIKO" />
</a>JAMK
</p>
```
Tämä tarkoittaa että sinun täytyy siirtää linkki, jossa kuva on, yhden yksittäisen ```p```-elementin sisään. **Jos sinulla ei ole kuvaa jossa on linkki, käytä yllä olevaa koodia sellaisenaan.**

### 38. Absoluuttinen sijoitus (absolute positioning)

Siirrä nav-blokki lähelle vasenta yläkulmaa. Käytä _absoluuttista sijoittamista (absolute positioning)_. Poista sisällöstä vasen ja oikea margianali. Esimerkki [tässä](../../assets/media/web-perusteet-css/abs_nav.png). Pohdi missä tilanteissa absoluuttinen sijoittaminen selainikkunan suhteen voisi olla hyvä käytäntö?

### 39. Palataan kiinteään sijoitukseen (fixed positioning)

Muuta position-propertyn arvoksi ```fixed```. Miten tilanne muuttui? Milloin tulisi käyttää kiinteää (fixed) sijoitusta?

### 40. Display -propertyt ja arvot

Muuta CSS näyttämään listaelementit nav-blokissa yhdellä viivalla (vinkki: tutki miten display-property toimii) ja pienennä fontin kokoa.

### 41. Pseudoluokat ja sisältö CSS:n kautta

Luo CSS-määrittelyt (käytä pseudoluokkia) jotka automaattisesti lisäävät " *** " ennen jokaista listaelementtiä ja saman merkkijonon viimeisen elementin jälkeen (navigaatioblokki näyttäisi jotakuinkin tältä: ```*** First Chapter *** Second Chapter *** Third Chapter ***```). Vihje: Selvitä miten ```content```-property toimii.

Aseta leveys siten että navigaatio asettuu koko sivun leveydelle samalle riville. Siirrä navigaatio sivun alaosaan ja käytä fixed -sijoitusta samoin kuten edellisessä harjoituksessa.

Katso [esimerkki](../../assets/media/web-perusteet-css/nav_bottom_fixed.png)

### 42. Piilota asioita tulostusta varten

Kirjoita CSS-määrittely joka piilottaa disclaimer-osion kun sivua tulostetaan. Tämä ominaisuus on hyödyllinen jos sinun tarvitsee muotoilla sivua varten tulostinystävällinen tyyli: voit helposti piilottaa mainoksia, navigaatiot ja muut vastaavat tulostusversiosta. Voit tarkistaa lopputuloksen käyttämällä selaimen sivun tulostuksen esikatselua.

### 43. Suomen ja Jyväskylän kartta

Sisällytä sivulle Suomen kartta (saat tiedoston [tästä](../../assets/media/web-perusteet-css/finland.jpg).) ja sijoita teksti Jyväskylä dokumentille. Siirrä "Jyväskylä" -teksti kartan päälle suurin piirtein sinne minne se kuuluu. Tutki hieman miten suhteellinen sijoitus (relative positioning) toimii jotta saat tekstin oikealle paikalle kuvan päälle.

### 44. Under construction, tulossa pian

Aseta [min-width](http://css-tricks.com/almanac/properties/m/min-width/)-property container-diville. Lisää [rakennustyömaakuva](../../assets/media/web-perusteet-css/construction.gif) juuri container-divin alle ja anna tälle elementille uniikki id. Rakennustyömaakuvan tulisi pysyä container-divin oikeassa yläkulmassa myös silloin kun selainikkunan kokoa muutetaan. Tämä vaatii absoluuttisen sijoituksen (absolute positioning) käyttöä suhteellisen sijoituksen (relative positioning) sisällä.

Esimerkit: [Kuva 1](../../assets/media/web-perusteet-css/construction_1.png) ja [Kuva 2](../../assets/media/web-perusteet-css/construction_2.png)

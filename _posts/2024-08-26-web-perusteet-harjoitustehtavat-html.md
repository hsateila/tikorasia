---
layout: post
title: 'Web-perusteet: Harjoitustehtävät, HTML'
date: 2024-08-26 16:08 +0300
categories: [Opintojaksot, Web-perusteet]
math: true
media_subpath: /assets/media/web-perusteet-html/
---
## Johdanto

HTML on kirjainyhdistelmä sanoista _**H**yper**T**ext **M**arkup **L**anguage_. Se on niin sanottu merkintäkieli, ja sen käyttötarkoitus on määritellä **verkkosivudokumentin** _rakenne_. HTML-dokumentteja voidaan kirjoittaa millä tahansa tekstieditorilla, mutta parasta on tässäkin käyttää editoria joka tukee koodin kirjoittamista. Tällä opintojaksolla käytössä on Visual Studio Code, ja lopputulosta tarkastellaan vapaavalintaisella järjestelmän selaimella.

Lue HTML-materiaali ennen kuin jatkat harjoituksiin.

Mahtavat kiitokset Teemu Pölkille ja Jarkko Immoselle tämän materiaalin pohjana toimineesta englanninkielisestä opetusmateriaalista.

## Yleiset HTML-elementit

Aivan perusmuotoinen HTML-sivu tarvitsee vähintään kolme pääelementtiä. ```<html>```-elementti pitää sisällään (nesting) kaksi muuta, ```<head>```ja ```<body>```-elementit. Pakollinen ```<title>```-elementti sijoitetaan ```<head>```-elementin sisään, ja kaikki käyttäjälle näkyvä sisältö sijoitetaan ```<body>```-elementin sisään. Oikeasta syntaksista on muistettava pitää huoli jotta sivu toimii oikein kaikilla alustoilla ja erilaisissa ympäristöissä. Dokumentin tyyppimääritelmässä kerrotaan dokumentin kieli ja versio. Dokumentin määritelmän tulee olla ensimmäinen rivi koko dokumentissa.

Elementit on muistettava myös sulkea! Elementti suljetaan lähtökohtaisesti aina sulkevalla tagilla, esimerkiksi ```</head>```. Poikkeuksia kuitenkin on.

Otsikkoelementtejä (esimerkiksi ```<h1>``` on yhteensä kuusi tasoa. Numero elementissä kertoo otsikon tason (ei siis otsikoiden järjestystä!). Tämä tarkoittaa sitä, että dokumentissa voi olla useampia samantasoisia otsikoita.

Linkit luodaan ```href``` _attribuutilla_. Voit linkittää paikallisia tiedostoja käyttämällä _suhteellista_ linkitystä haluttuun tiedostoon, kuten vaikkapa kuvatiedostoon. Suhteellinen linkitys tarkoittaa sitä, että linkki viittaa tiedostoon suhteessa sen tiedoston sijaintiin, missä linkki on. Absoluuttista linkitystä tulee käyttää vain ja ainoastaan linkitettäessä toisille verkkosivuille tai domaineille. Absoluuttisen linkin tulee aina alkaa protokollalla, kaksoispisteellä ja tuplatakakenolla, kuten **http://**, **ftp://** tai ***https://** jota seuraa itse osoite. Esimerkiksi: **<https://www.example.com/>**

Jos tiedostonimeä linkissä ei anneta, selain yrittää hakea sijainnista oletusarvoisesti tiedostoa jonka nimi on ```index.html```.

### Harjoituksiin valmistautuminen

Jos et vielä ole tehnyt, luo nyt kansio esimerkiksi nimellä "webPerusteet" johonkin sopivaan kansioon. Tässä vaiheessa sijainnilla ei ole suurta merkitystä. Käytä tätä kansiota kaikille harjoituksille sekä lopputyölle. Suosittelen tekemään harjoituksille ja lopputyölle kullekin omat alikansiot "webPerusteet" -kansion alle. Voit esimerkiksi tehdä kansion "helloworld" ensimmäistä harjoitustehtävää varten "webPerusteet" -kansion alle.

### 1. Hello World

“Hello World” eli Hei maailma! on tyypillisesti ensimmäinen harjoitus, opetellaanpa sitten mitä tahansa uutta ATK-asiaa, eikä tässä tehdä poikkeusta. Avaa edellä tekemäsi "helloworld" -kansio Visual Studio Codessa ja luo sinne tavallinen tekstitiedosto jossa on seuraava sisältö:

```html
Tervetuloa [oma nimesi]n verkkosivulle.

Hello world!
```

Avaa verkkosivu käyttäen Live Server -lisäosaa ja haluamaasi selainta. Verkkosivu ei näytä samanlaiselta selaimessa. Miksei?

- Tämä johtuu siitä että verkkoselain tulkitsee HTML-merkintäkieltä. Rivinvaihdot ja kaikki muu rakenne tulee ilmaista selaimelle eksplisiittisesti merkintäkielellä jotta selain osaa näyttää tiedoston sisällön verkkosivuna toivotulla tavalla.

- Jos tiedosto ei näy selaimessa lainkaan tai Visual Studio Code ei korosta koodiasi värein, varmista että olet tallentanut tiedoston oikealla tiedostopäätteellä ```.htm``` tai ```.html```. Visual Studio Codessa on paljon erilaisia työkalusettejä sekä korostuksia (highlighting) tiedostolle joka sinulla nyt on auki.

Jatketaan seuraavaksi lisäämällä joitakin HTML-elementtejä: Käytä ```<h1>``` -elementtiä rivillä joka alkaa "Tervetuloa..." ja ```<p>```elementtiä "Hello world!" -tekstille ja tallenna tiedosto.

Live Server -lisäosan pitäisi nyt päivittää muutoksesi selaimeen saman tien kun tallennat muutokset, ja näyttää nykyisen version sivusta. Sivu näyttää nyt paremmalta, mutta ei vieläkään ole aivan kunnossa koska emme seuraa HTML-merkintäkielen määrittelyä. Validoi luomasi dokumentti [W3 Consortiumin validaattorilla](https://validator.w3.org/#validate_by_input) ja katso lopputulos. Voit leikata ja liimata koodin editorista suoraan sivulle ja ajaa validoinnin "Check" -nappia painamalla. Korjaa koodiasi validaattorin ohjeiden mukaisesti kunnes koodi menee validoinnista läpi.

>**CSS** on lyhenne sanoista Cascading Style Sheets. CSS-tiedostossa määritellään verkkosivun tyylit ja asettelu. Tyylit määrittelevät miten sivu _renderöidään_ eli näytetään selaimessa. Tyylit toimivat yhdessä HTML-elementtien kanssa. CSS-määritykset (declarations) luodaan myös tekstieditorissa, mutta syntaksi eli kirjoitusmuoto eroaa HTML:stä.
{: .prompt-info}

Lue [CSS-esittely](https://www.w3schools.com/css/css_intro.asp) ja [CSS:n syntaksi](https://www.w3schools.com/css/css_syntax.asp).

Seuraavaksi lisäämme tyylimäärityksiä Hello world! -sivulle.

Lisää tyylielementti ```<style>``` HTML-dokumenttisi ```<header>```-osioon tagin sisälle. **Muista sulkevat tagit.** Kopioi alla oleva CSS-koodi alta ja liitä se tyylielementin sisään. Päivitä sivusi selaimessa ja tarkista tapahtuiko mitään. Jos ei, ja Visual Code Studio näyttää virheitä, tarkista VS Coden näyttämät virheet ja tee korjaukset sen antamien ohjeiden mukaisesti. Tämän jälkeen voit validoida sivun koodin, myös CSS-koodin, validaattorilla.

```css
h1 {
  font-family: arial, verdana, sans-serif;
  font-size: 20pt;
  colour: #ccbbcc;
}
```

Muuta samaan tapaan kappaleen (paragraph, ```<p>```) tekstin väriä (käytä vaikkapa väriä ```#ccbbcc```) käyttämällä tyylimääritystä ```<p>```-elementille. Lopuksi aseta sivun taustaväriksi musta koko dokumentille asettamalla property background-color ```<body>```-elementille. VS Code helpottaa työskentelyä värien kanssa merkittävästi koska käytettävissä on sisäänrakennettu värityökalu.

### 2. Harjoittelua lukemalla ja kommentoimalla

Kuvaile kaikki eri osat joita on mukana alla olevassa HTML–koodinpätkässä (snippet). Kuvaile jokainen elementin osa. Vastaus voi olla kaavio tai piirros tai lista elementeistä kuvauksineen.

```html
<h1 id="heading1">This <strong>is</strong> header 1</h1>
```
Lue seuraavat dokumentaatiot. Pyri ymmärtämään niiden sisältö ja tee muistiinpanoja lukemastasi.

- [Ensimmäinen dokumentaatio](https://developer.mozilla.org/en-US/docs/Glossary/HTML)
- [Toinen dokumentaatio](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Getting_started)

Nämä dokumentaatiot toimivat pohjana seuraavalle luennolle.

### Jatketaan tehtävien parissa

Nouda zip-tiedosto tehtäviä varten [täältä](https://tiko.jamk.fi/~hsateila/files/exc1.zip). Tiedostoista muodostuvan nettisivun voi nähdä myös nettisivuna [täällä](https://tiko.jamk.fi/~polkte/webui/assets/samples/exc1/index.html). **Selvitä ja hae [MDN-dokumentaatiosta](https://developer.mozilla.org/en-US/) miten HTML-koodiin tehdään _kommentteja_.**

Pura zip-tiedosto sopivaan paikkaan, esimerkiksi aiemmin tekemääsi opintojaksokansioon. Tehtäväsi on avata tiedosto ja selvittää mitä eri elementit, tagit ja CSS-säännöt tekevät ja kommentoida selvityksen tulos lyhyesti suoraan tiedostoon. Mukana on jo esimerkin omaisesti muutama kommentti. Itse sivun sisällön _EI_ tulisi muuttua. Kirjoita ```<head>```-osioon kommentti jossa kerrot mitä kommentit ovat ja miksi niitä käytetään.

### MHOO 1. (Minä Haluan Oppia ja Osata): Selaimet

Selvitä useimmin käytetyt selaimet ja erityisesti selainmoottorit (engine) joita nämä selaimet käyttävät. Mitä moottoreita selaimet käyttävät milläkin eri alustoilla (mobiili, tablet, konsolit, Windows, macOS, Linux)?

Voiko selaimen moottori vaikuttaa sivun ulkoasuun?

Tee muistiinpanot itsellesi!

### 3. Verkkosivun luominen tyhjästä

Aloitetaan alusta luomalla perusmuotoinen HTML5 -verkkosivu tyhjästä. Tähän sinulla pitäisi jo edellisten perusteella ollakin mallipohja, mutta jos ei, tarkista perusteet [MDN:stä](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics). Harjoitusten 2-8 jälkeen sivun tulisi näyttää [tältä](https://tiko.jamk.fi/~hsateila/files/2-8.png) Ensimmäiseksi, lisää tyhjään dokumenttiin doctype ja kaikki tarvittavat rakenteelliset elementit (html, head, jne). Seuraavaksi lisää sivun pääotsikko (h1, ja sisällöksi "Basic Web Page") ja pari tekstikappaletta (elementti p). Voit generoida niin sanotuksi placeholder-tekstiksi munkkilatinaa helposti joko [lorem ipsum -generaattorilla](https://loremgenerator.io/) tai [Emmet-lisäosalla](https://docs.emmet.io/abbreviations/lorem-ipsum/).

Validoi verkkosivukoodisi W3C-validaattorilla johon löydät linkin ylempää. Jos saat virheitä, korjaa ne yksi kerrallaan ja validoi sivu uudelleen kunnes validointi menee läpi.

### 4. Otsikoiden lisääminen

Lisää kolme alemman tason otsikkoa (h2, sisältö "First Chapter", "Second Chapter" ja "Third Chapter") ja lisää pari tekstikappaletta kunkin otsikon jälkeen. Lisää vapaavalintainen linkki jollekin sivulle jonkin kappaleen tekstin sisään. Validoi sivu.

### 5. Linkkien opettelua

Selvitä kuinka luot linkin _paikalliseen_ sivuun, eli sivuun joka sijaitsee samalla tietokoneella ja samalla nimialueella (domain). Selvitä kuinka tällainen sivun sisäinen linkki eroaa ulkoisesta linkistä.

Luo sivun alaosaan linkki, joka linkittää _sivuun itseensä_ eli juuri siihen sivuun jota parhaillaan muokkaat. Laita linkin tekstiksi "To the top \>\>\>". Suurempi kuin -merkit sisällössä tulisi tuottaa _entiteettien_ avulla jotta ne varmasti renderöityvät oikein.

### 6. Kommentit

Lisää sivutiedostoon sivun puoliväliin _useammalle riville jakautuva kommentti_ jota ei näytetä selaimessa.

### 7. Ylätunniste (superscript), alatunniste (subscript) ja tekstin painottaminen

Muokkaa h2-otsikoita siten että "First Chapter" on muokkauksen jälkeen "1$$^\text{st}$$ Chapter". Tee myös seuraavat muutokset:

Lisää alatunniste-esimerkki jonnekin dokumenttiin (katso esimerkkikuvan kappale kolme).

Lue elementtien ```<i>```, ```<b>``` ja ```<strong>```_semantiikasta_. Käytä sopivia elementtejä painottamaan joitakin sanoja.

### 8. Kuvia sivulle

Etsi sopivia, sopivan kokoisia (pieniä) kuvia sivulle. Pyri etsimään materiaalia jota saat luvallisesti käyttää: [kuvat jotka on lisensoitu Creative Commons -lisenssillä](https://search.creativecommons.org/) ovat oikein hyviä tähän. Tallenna kuvatiedosto samaan kansioon jossa muokattavana oleva verkkosivutiedosto on, ja lisää kuva sivulle img-tagin avulla. Tarkista dokumentaatiosta (MDN) miten img-tagia tulee käyttää.

[Lorem Picsum](https://picsum.photos/) on hyvä sivusto joka tarjoaa "placeholder" -kuvia sivuston kehittämisen tueksi. Näiden avulla voit käyttää kuvalinkkejä, eikä näitä kuvia tarvitse tallentaa paikalliseen kansioon ellei välttämättä halua. Lisää sivulle seuraava kuva <https://picsum.photos/400/200/> jota klikkaamalla pääsee Jamk:n kotisivulle. Validoi koodi.

### 9. Kuvat ja kansiorakenne

Luo kansio nimeltä ```img``` samaan kansioon jossa muokkaamasi html-tiedosto sijaitsee. Siirrä kuvatiedostot tähän uuteen kansioon ja korjaa kuvaviitteet HTML-koodissasi. Muista käyttää _suhteellista_ eikä absoluuttista linkitystapaa jotta kuvat edelleen toimivat muuallakin kuin omalla koneellasi!

### MHOO 2. Emmet-lisäosan opettelua

Emmet on työkalu Visual Studio Codessa, ja se voi nopeuttaa kehitystyötä merkittävästi. Erityisesti jos (ja kun) käytät paljon toistuvia koodirakenteita, Emmet auttaa hommissa merkittävästi. Lue Emmetin käytöstä [Emmetin dokumentaatiossa](https://docs.emmet.io/) ja [VSCoden dokumentaatiossa.](https://code.visualstudio.com/docs/editor/emmet). Emmetin käytön opettelu helpottaa työtäsi jatkossa merkittävästi joten se on erittäin suotavaa!

Luo uusi tiedosto nimeltä ```emmet_experiment.html```ja testaa siinä työkalua. Käytä Emmetiä kaikissa seuraavissa tehtävissä. [Tältä sivulta](https://tiko.jamk.fi/~hsateila/emmet_exc.html) voit tarkistaa miltä alla olevan kolmen tehtävän lopputuloksen tulisi näyttää.

1. Luo HTML-sivun perusrakenne VSCode-editorissa käyttäen vain yhtä merkkiä
2. HTML body -tagin sisällä: luo ```<div>``` jossa on yksi ```<h1>```sisällä. ```<h1>```pitäisi olla "Hello Emmet!" -teksti sisältönä.
3. Luomasi ```<div>``` -elementin sisällä, ```<h2>``` -elementin alle, luo kolme ```<section>```-elementtiä, joissa kaikissa on sisällä ```<h2>```-elementti sisällä ja näiden kaikkien sisällä kaksi ```<p>```-elementtiä. Yhdessä ```<p>``` -elementeistä tulisi olla luokka (class) nimeltä "outbound". Lisähaasteena, käytä sisäänrakennettua "lorem" -komentoa tuottaaksesi sisältöä ```<p>```-elementtien sisään luodessasi niitä.

## Listat, taulukot, ankkurit ja metaelementit

Näihin palaamme seuraavilla luennoilla!

Listoilla voidaan luoda automaattisesti järjestelemättömiä listoja (bulleted, unordered lists) tai numeroituja listoja (numbered, ordered lists). Listat ovat hyödyllisiä siinä mielessä että numerointia tai listausta ei tarvitse muokata käsin jos lista muuttuu. Listaelementtejä voidaan käyttää myös valikkorakenteiden muodostamiseen.

**Numeroimattomat listat** luodaan ```<ul>```-elementin sisään (ul: unordered list). Jokainen listan yksittäinen elementti tunnistetaan ```<li>```-elementin avulla. Listaelementin sisältö tulee avaavan ja sulkevan tagin sisään kuten muissakin elementeissä joissa on sisältöä. Oletusarvoinen listaelementin edessä oleva merkki on ympyrä (disc). Näitä merkkejä voi vaihtaa CSS-tyylien avulla. Järjestetty, numeroitu lista sijoitetaan ```<ol>```-tagin sisään. Esimerkkejä voit katsastaa [täältä](https://www.w3schools.com/html/html_lists.asp).  

**Taulukot** merkitään alkavaksi tagilla ```<table>```. Tämä määritteleee taulukon ulkoreunat. Jokainen taulukon **rivi** avataan tagilla ```<tr>``` (table row) ja suljetaan tagilla ```</tr>```. Taulukon varsinaiset solut, joihin sisältö sijoitetaan, määritetään rivitagien _sisään_ elementeillä ```<th>```ja ```<td>```. Jos soluja tarvitsee yhdistää, tämä voidaan toteuttaa attribuuteilla _rowspan_ tai _colspan_. Tarkemman kuvauksen taulukoista löydät [täältä](https://developer.mozilla.org/en-US/docs/Learn/HTML/Tables/Basics).

>**Taulukot ovat haastava HTML-elementti käytettäväksi.** Vaikka kovasti houkuttelisi tehdä esimerkiksi sarakkeiden tai muun sijoittelun toteutus taulukoilla, tätä ei useimmiten kannata tehdä sillä taulukot eivät käyttäydy kovin responsiivisesti, eli ne eivät mukaudu näyttölaitteen ruudun kokoon hyvin. Tästä johtuen taulukot ovat hieman ongelmallisia myös sisällöissä, mutta niillä kuitenkin toisinaan on paikkansa.
{: .prompt-warning}

Harjoitustyön pitäisi näyttää tehtävän 15. jälkeen [osapuilleen tältä](https://tiko.jamk.fi/~hsateila/files/e2-14.pdf).

### 10. Listat 1: Bulletit ja numerot

Lisää sivulle järjestelemätön lista ja järjestetty numeroitu lista. Lisää myös listan kuvaus (käytä oikeita elementtejä, vinkkinä _kolmas_ listatyyppi, Description List, ei ul tai ol) joissa määrittelet termit HTML, CSS ja Javascript.

### 11. Listat 2: Sisäkkäiset (nested) listat

Lisää muutama alilista järjestelemättömään listaan. Esimerkiksi:

```text
* this is the first main item
  * first sub item
  * second sub item
* this is the second main item
  * first sub item
      * a sub item of a sub item
  * second sub item
```

### 12. Taulukot

[Lue HTML-taulukoista](https://developer.mozilla.org/en-US/docs/Learn/HTML/Tables/Basics) ja lisää seuraavanlaiset taulukot sivuillesi:

![Taulukkomallit](tables1.png)

### 13. Yksittäisten elementtien tunnistaminen

Luo uniikit ID:t jokaiselle otsikolle käyttämällä id-attribuuttia.

Lisää järjestelemätön lista juuri h1-elementin (muista että h1-elementtejä tulee olla sivulla vain yksi) jälkeen. Lisää listaan sisällöksi jokaiseen listaelementtiin linkki saman sivun johonkin tunnistettuun h2-elementtiin. Vinkki: käytä h2:n id:tä tässä! Muokkaa aiemmin luomaasi "To the top" -linkkiä siten että se osoittaa sivun yläosan h1-otsikkoon.

### 14. Hello World taas?

Lisää haluamasi Hello World -koodipätkä (snippet) verkkosivullesi. Koodipätkien eli snippettien tulisi näkyä ilman mitään muotoilua - esimerkiksi tabulaattorien ja rivinvaihtojen tulee säilyä. Etsi internetista sopiva elementti tällaiseen käyttöön.

### 15. Metadata

Lisää dokumenttiisi ainakin seuraavat metaelementit: _charset_, _author_, _description_ ja _keywords_. Määritä dokumentin merkistökoodaukseksi (charset, character encoding) utf-8 ja määritä sama myös tiedoston merkistökoodaukseksi VSCodessa. Lisää dokumenttiin joitakin ei-englanninkielisiä merkkejä kuten kyrillisiä, kreikkalaisia ja yksinkertaistetun kiinan kirjoitusmerkkejä. Tarkista selaimessa että se huomioi uuden merkistökoodauksen ja näyttää kaikki merkit oikein.

## Elementtien ryhmittely, ID:t ja luokat

```<div>```-ja ```<span>```-elementtejä käytetään ryhmittelemään elementtejä keskenään. Niillä luodaan sivulle "osioita" tai "aliosoita". Sellaisenaan nämä elementit eivät vaikuta ulkoasuun millään lailla, mutta CSS:n kanssa näillä elementeillä on erittäin tärkeä rooli sivun ulkoasun rakennuksessa. ```<div>```-elementti ryhmittelee block-muotoisia elementtejä, ja ```<span>```-elementtiä käytetään puhtaasti ryhmittelemään rivillä olevia elmenttejä (inline). Span-elementillä myös liitetään erilaisia korostustyylejä haluttuihin sisällön osiin.

## HTML 5 ja semanttiset elementit

HTML5 on web-kehityksen nykytila ja käytännön standardi. Ensimmäinen versio HTML5:sta julkaistiin lokakuussa 2014. HTML5:ssa esiteltiin paljon uusia elementtejä ja attrbuutteja, joiden avulla tuetaan paremmin merkintäkielten semanttista filosofiaa. Uusien elementtien avulla voidaan antaa monille "merkityksettömille" div-elementeille merkitys myös sivuston rakenteessa kun div-elementin sijasta käytetään semanttista elementtiä, joka teknisesti ulkoasun ja koodin suhteen käyttäytyy kuitenkin samalla tavoin kuin div-elementti. Uusia HTML5-elementtejä ovat mm.

- header - sivuston yläosaa, osion (section) yläosa, artikkeleiden otsikko-osiot jne.
- nav - sivuston (pää)navigaatioita varten
- section - sivuston osioiden erotteluun (yleensä omalla otsikolla)
- article - artikkeleille joka on järkevä kokonaisuus yksinään
- figure - kuville, videoille, taulukoille jne. joita tarvitaan sisällön tukemiseksi, mutta voidaan siirtää kauemmas varsinaisesta asiayhteydestä jossa niihin viitataan.
- aside - tukisisällölle joka yleensä esitetään sivun laidassa, kuten liittyvät linkit, artikkelit tai mainokset
- footer - sivun alaosa, "jalkalista".

### Lue seuraavat artikkelit

- Mike Robinson on kirjoittanut mainion ["Let's Talk about Semantics" -artikkelin](https://html5doctor.com/lets-talk-about-semantics/) semantiikan tarkoituksesta ja kuinka elementtejä tulisi käyttää.
- [Avoiding common HTML5 mistakes](https://html5doctor.com/avoiding-common-html5-mistakes/)
- [HTML Element Flowchart](https://html5doctor.com/downloads/h5d-sectioning-flowchart.png) on hyvä lunttilappu semanttisten elementtien käyttöön.

#### Seuraavat artikkelit syventävät HTML5-tietämystä

Ei välttämätöntä paneutua näihin nyt, mutta ota kirjanmerkit talteen.

- [Dive Into HTML5](https://diveinto.html5doctor.com/)
- [HTML5 for Web Designers](https://html5forwebdesigners.com/)

### 16. Merkityksen lisääminen tageihin

Lisää sivun yläosaan leveä, bannerimainen (leveä ja matala) kuva. Tätä varten ei tarvitse opetella PhotoShopia tai GIMPiä tai mitään muutakaan grafiikan luontiin tarkoitettua työkalua tässä kohdin, sillä voit generoida sopivan bannerin online-työkaluilla. Tästä esimerkkinä vaikkapa [Canva](https://canva.com/). Ryhmittele bannerikuva ja pääotsikko semanttisesti oikein sopivilla elementeillä dokumentissasi.

Lisää semanttisesti oikea HTML-elementti, jonka sisällä on linkkilista, ja ryhmittele loput elementit yhteen. Luo uusi, semanttisesti oikea HTML-elementti sivun loppuun, johon sijoitat Copyright-tiedot, kuten "©Copyright by XXX"

Nyt sinulla pitäisi olla dokumentti missä _juurielementti_ (html) koostuu neljästä semanttisesta elementistä (katso [esimerkki](https://tiko.jamk.fi/~hsateila/files/ex15_divs.pdf)).

Päivitä selain. Mitään ei näyttäisi tapahtuvan? Tarkista sivun osiot (sections) selaimen kehittäjätyökaluilla (Web developer tools, aukenee joko valikoiden kautta tai näppäinyhdistelmällä ctrl+shift+I Windowsissa tai Command+Option+I macOS:ssa). Jotta nämä lisäämäsi osiot näkyvät selaimessa normaalistikin, niihin on lisättävä tyylejä CSS:n avulla, ja siihen menemme seuraavaksi.

### MHOO 3. Selaimen kehittäjätyökalut ja HTML:n vianselvitys (debuggaus)
>
Vaikka tämä osio onkin vapaaehtoinen, **on erittäin suositeltavaa tutustua** alla olevien artikkeleiden avulla kehitystyökaluihin. Ne ovat web-kehittäjän tärkeimpiä työkaluja.
{: .prompt-warning}

Lue muutama tutoriaali ja artikkeli kehitystyökaluista, jotka on sisäänrakennettu jokaiseen selaimeen ja joita tulemme jatkossa tarvitsemaan paljon.

- [What are devtools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Tools_and_setup/What_are_browser_developer_tools) (voit lopettaa JavaScript-osioon tässä yhteydessä)
- [Nira: Chrome Developer Tools](https://nira.com/chrome-developer-tools/)
- [Inspecting HTML and CSS](https://developer.chrome.com/docs/devtools/dom/)
- Tee seuraavat [tutoriaalit MDN:stä](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Debugging_HTML).

Tästä linkistä näet miltä sivun pitäisi suurin piirtein näyttää. Tarkista luomuksesi sen kanssa ennen kuin jatkat CSS-hommien pariin: [Valmis sivu tehtävän 16 jälkeen](https://tiko.jamk.fi/~hsateila/exc16.html).
>
Loppuvinkki: **Ctrl+Shift+u** (Chrome, Windows) tai **Command+Option+u** (Chrome, macOS) näyttää selaimessa sivun lähdekoodin.
{: .prompt-info}

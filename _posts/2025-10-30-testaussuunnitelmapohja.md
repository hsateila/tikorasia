---
layout: post
title: Testaussuunnitelmapohja
date: 2025-10-30 18:14 +0200
categories: [Opintojaksot, Testaus]
image: /assets/media/testaussuunnitelmapohja/software-testing-cover.jpg
---

# Testaussuunnitelman yksinkertainen esimerkkipohja

## Projekti: Yksinkertainen TODO-sovellus
- Testisuunnitelman esimerkkiohjelmisto on tyypillinen CRUD-sovellus (Create, Read, Update, Delete) jossa hallinnoidaan tehtäviä. 
- Tähän osastoon kuvataan lyhyesti sovelluksen tarkoitus ja toiminta: Tässä sovelluksessa käyttäjä voi luoda, listata ja lukea, päivittää ja poistaa tehtäviä. Käyttäjällä on käyttäjätili, jotta käyttäjän tekemät tehtävät näkyvät ainoastaan hänelle. Käyttäjä pystyy luomaan tilin, kirjautumaan sisään, kirjautumaan ulos, vaihtamaan salasanan ja poistamaan tilinsä.

### Testauksen tavoitteet
*Mitä testauksella tavoitellaan?*
- Varmistaa sovelluksen oikeellisuus, luotettavuus, turvallisuus ja käytettävyys siten, että käyttäjät voivat luoda, lukea, päivittää ja poistaa tehtäviä luotettavasti.

### Kattavuus (Scope)
*Testauksen laajuus ja sisältö: Mitä testataan?*

#### Ydinominaisuudet (Core features):
- Tehtävän (taskin) luonti, näyttäminen/listaus, päivitys ja poisto
- Tehtävän tiedot: Otsikko, kuvaus, määräpäivä, prioriteetti, tila
- Yksinkertainen haku, listanäkymän järjestely ja suodatus
- Pysyvä tallennus ja synkronointi backendiin (create/read/update/delete, CRUD-operaatiot tallentuvat)
- Käyttäjän autentikointi ja session hallinta
- Virheiden käsittely
- Käyttöliittymä, API/backend -käsittely, datan validointi, autentikoinnin ja pääsynhallinnan toiminta (vain omat taskit käyttäjälle)

#### Testattavat ominaisuudet
*Vaatimusmäärittelyä noudattava lista toiminnallisuuksista, jotka tullaan tavalla tai toisella testaamaan*
- Luo tehtävä
  - Pakolliset/valinnaiset kentät, kenttien sisällön validointi, oletusarvot
  - Tehtävän luonti minimi- ja maksimisyötteillä
- Näytä tehtävä/listaa tehtävät
  - Sivutus, virtuaalinen vieritys, järjestys, reaaliaikainen listan päivitys
  - Yksittäisen tehtävän näyttö näyttää oikeat kentät ja tiedot
- Päivitä tehtävä
  - Muokkaa kenttiä, vaihda tila (valmis/kesken)
- Poista tehtävä
  - Soft delete vs. hard delete -käyttäytyminen, vahvistusdialogit
- Haku, suodatus, järjestäminen
  - Avainsanahaku, suodatus tilan/prioriteetin/määräpäivän perusteella, järjestäminen määräpäivän/prioriteetin/luontipäivän perusteella
- Autentikointi ja luvittaminen
  - Sisään/uloskirjautuminen, istunnon voimassaolo ja katkeaminen, näkyvyys vain käyttäjän omiin tehtäviin
- Datan synkronointi ja säilyvyys
  - Offline -toiminta mikäli ei verkkoyhteyttä, synkronointivirheet ja uudelleenyritykset
- Validointi ja rajoitukset
  - Maksimipituus, päivämäärän validointi, pakolliset kentät, ei-sallitut merkit
- Virheenkäsittely ja ilmoitukset
  - Käyttäjälle näkyvät virheilmoitukset, uudelleenyritysten kulku, palvelinvirheiden käsittely
- Suorityskyvyn perusasiat
  - Vasteajat listaukselle ja tehtävän avaamiselle normaalin kuormituksen aikana
- Tietoturvan perusasiat
  - Syötteen siivous (estä XSS), rajapintojen suojaus (ei luvatonta pääsyä), tietoturvallinen käyttäjätietojen ja -tunnusten säilytys

#### Ei sisälly testaukseen
*Mitä jätetään testauksen ulkopuolelle?*
- Yhteistyöominaisuudet (muiden käyttäjien kanssa jaettavat tehtävät tai julkiset tehtävät)
- Liitetiedostot, ladattavat tiedostot
- Toistuvat tehtävät, monimutkainen aikataulutus
- Integraatiot (kalenterit, kalenteripalvelut, ulkoiset palvelut)
- Edistynyt analytiikka
- Tehtävien tuonti/vienti

### Testausstrategia
*Millaista testausta tullaan tekemään?*
- Toiminnallinen testaus
  - Positiiviset ja negatiiviset (onnistunut, oikea syöte/epäonnistunut, väärä syöte) testitapaukset kaikille CRUD-operaatioille ja validoinneille
  - End-to-end käyttäjätoiminnot (luo → päivitä → merkitse valmiiksi → poista)
- Käytettävyystestaus/Käyttäjäkokemustestaus
  - Toimintojen nimet ja nimekkeet, virheviestit, saavutettavuuden perusasiat (näppäimistönavigaatio, värikontrasti)
- Tietoturvatestaus (perusasiat)
  - Autentikoinnin toimintapolku, istuntojen hallinta, pääsyn hallinta, syötteiden puhdistus (injektiot, XSS)
- Suorituskyvin savutestaus
  - Hakuajat tehtävien listaukselle ja tehtävän luonnin ja tallennuksen kesto, käyttöliittymän reagointi/vaste yleisillä laitteilla
- Yhteensopivuustestaus
  - Määritellyt selaimet ja mobiiliruutukoot
  - Sosiaalisen median selainten toimivuus jos katsotaan tarpeelliseksi
- Regressiotestaus
  - Automatisoi kriittiset käyttäjän työnkulut ja aja aina muutosten jälkeen
- Yksikkötestit
  - Luo testit koodiin toiminnallisuuksille vaatimusten mukaan ja automatisoidaan ne.
- UAT
  - Pieni ryhmä loppukäyttäjiä testaa työnkulut ja tekstiasun sekä sisällön

### Testaajaresurssit
*Miten paljon ihmisiä tarvitaan, mitä työkaluja käytetään, mitä ympäristöjä on käytettävissä? Keitä osapuolia (stakeholders) testauksessa on mukana (testaajat, kehittäjät, asiakas, auditoijat tms.)*
- Tiimi:
  - 2 QA -vastuullista (testien suunnittelu, toteutus ja automatisointi)
  - 1 tietoturva-asiantuntija (tietoturvatestaus)
- Työkalut ja testausympäristö
  - Tuotannon kaltaiset testi/staging-ympäristöt jossa vastaava ajoympäristö kuin tuotannossa. Generoitu testidata (tehtävät ja käyttäjät)
  - Työpöytäselaimet (Chrome, Firefox, Edge, Safari), mobiililaitteet tai emulaattorit
  - API-työkalut, pääsy sovelluslokeihin
  - Testien hallinnointityökalu ja bug tracker
  - Automatisointiohjelmistokehys ja automaatiot (Vitest, Cypress, Selenium, Playwright tms.)

### Riskienhallinta ja riskit
*Mitä riskejä testaukseen sisältyy?*
- Testiympäristö eroaa tuotantoympäristöstä siten, että se tuottaa vääriä hyväksymisiä tai epäonnistumisia (false pass/fail)
- Epävakaa backend-rajapinta testausten aikana
- Autentikointi ei toimi (kolmannen osapuolen tarjoama palvelu ei vastaa)
- Testit eivät siedä verkko-ongelmia
- Riittämättömät vaatimukset reuna-alueen käyttötapauksille (offline-toiminnallisuus, yhtäaikainen käyttö tai muokkaus)

### Aikajana
*Miten testauksen suunnittelu, testiympäristöjen rakennus ja itse testaus etenee?*
- Viikot 1-2: Testiympäristöjen rakennus ja testitapausten kehitys
  - Pystytetään staging, generoidaan testidata, kirjoitetaan testitapaukset ja runko testausautomaatiolle.
- Viikot 3-4: Toiminnallinen testaus
  - Toteutetaan manuaalinen ja automatisoitu toiminnallisuuksen testaus. Kirjataan viat testeissä ja sovelluksessa.
- Viikko 5: Tietoturva- ja suorituskykytestaus
  - Toteutetaan perustason tietoturvatestit ja suorituskyvyn savutestit. Korjataan puutteet.
- Week 6: UAT and regression testing
  - UAT with representative users; run full regression suite
- Weeks 7–8: Final fixes and sign-off
  - Verify fixes, final regression, prepare sign-off deliverables

### Testaussuunnittelun ja prosessin aikana tuotettavat dokumentit
- Testaussuunnitelma (tämä dokumentti) ja jäljitettävyysmatriisi ([traceability matrix](https://en.wikipedia.org/wiki/Traceability_matrix): taulukko, jossa vaatimuset yhdistetään testeihin ja varmistetaan että vaatimukset vastaavat testejä)
- Yksityiskohtaiset testitapaukset (manuaaliset ja automatisoidut)
- Testien ajo/toteutusraportti ja hyväksytty/hylätty -matriisi
- Epäonnistuneiden testien vikaraportti vakavuusasteineen ja toistamisohjeineen (miten saan virheen toistettua)
- Lista turvallisuuspuutteista ja korjausehdotuksista niihin
- Käyttäjätestauksen (UAT, User Acceptance Testing) palautteen yhteenveto
- Koko testauksen lopullinen yhteenveto ja toimenpide-ehdotukset

### Testauksen onnistumiskriteerit
- 100% hyväksytyt korkean prioriteetin testitapaukset
- Nolla kriittistä/etenemisen estävää (blocker) vikaa avoinna testauksen päättämisen yhteydessä
- Käyttäjätestauksen tekijän (esim. asiakas) hyväksyntä
- Kaikki tunnistetut tietoturvakriittiset ongelmat on korjattu tai hyväksytty kompensoituna jollakin tavalla (eivät muodosta tietoturvauhkaa hyväksyntähetkellä)

### Testausympäristö
- Tuotantoympäristön kaltainen staging-ympäristö samoilla rajapintaversioilla ja testidatalla
- Riittävästi erityyppisiä laitteita ja selaimia yhteensopivuustesteihin
- Verkkosimulaation mahdollisuus (rajallinen nopeus, offline-tilanne jos tarpeen)
- Loki- ja rajapintapääsyt virheiden jäljittämistä varten
  
### Dokumentaatio
- Käyttäjätarinat (User story) ja hyväksyntäkriteerit kaikille testattaville ominaisuuksille ja toiminnallisuuksille
- API-dokumentaatiot (endpointit ja request/response -mallit eli skeemat siitä miltä rajapintapyynnöt ja vastaukset näyttävät)
- Tietomalli ja tietovaraston toiminnan kuvaus (soft delete, aikaleimat jne.)
- Versiotiedot (release notes, testattava versio) ja tunnetut toiminnan rajoitukset listattuna, jos niitä on.

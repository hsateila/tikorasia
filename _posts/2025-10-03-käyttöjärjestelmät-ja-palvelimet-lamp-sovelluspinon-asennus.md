---
layout: post
title: Käyttöjärjestelmät ja palvelimet - LAMP-sovelluspinon asennus
date: 2025-10-03 00:57 +0300
---

LAMP-sovelluspinon lyhenne tulee sanoista Linux, Apache, MySQL/MariaDB ja PHP. Tämä on usein web-hotelleissa tarjolla oleva palvelinratkaisu, ja soveltuu kaikenlaisten PHP-pohjaisten verkkosovellusten rakentamiseen ja ajamiseen, mutta ennen kaikkea useamman sisällönhallintajärjestelmän kuten Joomla tai erityisesti Wordpress, ajamiseen.

Meillä on valmiina Ubuntu-pohjainen virtuaalikone, johon asennamme tämän sovelluspinon ja lopuksi testaamme siinä WordPress -sisällönhallintajärjestelmää.

Ensimmäisenä päivitämme paketinhallinnan listaukset komentamalla terminaalissa

```bash
sudo apt update
```

Voit päivittää kaikki paketit komennolla `sudo apt upgrade` , mutta olettakaamme että olemme tuotantopalvelimella, jolloin palvelinasennuksen ja testauksen suhteen on oltava tarkempi: kaikkia paketteja ei kannata tuosta noin vain sokeasti päivittää, sillä on mahdollista että jokin asia rikkoutuu.

# Apache2 - HTTP-palvelimen asennus

Ensin asennetaan HTTP-palvelinohjelmisto Apache, ja tästä uudempi versio 2. Palvelinohjelmisto mahdollistaa verkkosivujen palvelemisen selaimelle kun selain sitä oikeasta IP-osoitteesta palvelimelta pyytää. Asennus seuraavalla komennolla:

```bash
sudo apt install apache2
```

Apt asentaa Apachen riippuvuuksineen ja asennuksen aikana varmistaa että haluatko varmasti asentaa. Vastaa Y.

Tämän jälkeen konfiguroidaan hieman Ubuntun palomuuria. Ubuntussa on oletusarvoisesti käytössä Uncomplicated Firewall (UFW). Tarkistetaan ensin mitä sovelluksia UFW:n on tällä hetkellä konfiguroitu komentamalla

```bash
sudo ufw app list
```

Apachen asennuksen jälkeen listaus näyttää todennäköisesti jotakuinkin tältä:

```bash
$ sudo ufw app list
Available applications:
  Apache
  Apache Full
  Apache Secure
  CUPS
```

Nämä ovat palomuuriin konfiguroituja **profiileja** liikenteen ohjausta varten. Ne eivät ole automaattisesti käytössä, vaan on valittava sopivin käyttöön.

> **Apache:** sallii liikenteen vain porttiin 80 (normaali, salaamaton verkkosivuliikenne)

> **Apache Full:** sallii liikenteen portteihin 80 (salaamaton liikenne) ja 443 (TLS/SSL -salattu liikenne)

> **Apache Secure:** sallii liikenteen vain porttiin 443 (TLS/SSL -salattu liikenne).

Palomuurin status voidaan ensin tarkistaa komentamalla

```bash
sudo ufw status
```

Tämän pitäisi tulostaa seuraavanlainen tilanne:

```bash
$ sudo ufw status
Status: inactive
```

Tämä tarkoittaa, että palomuuri on pois päältä. Palomuurin saat käyntiin ja enabloitua käynnistymään koneen käynnistyksen yhteydessä komentamalla

```bash
sudo ufw enable
```

Pois päältä palomuurin saa komennolla `sudo ufw disable`.

Nyt otetaan käyttöön salaamaton liikenne jotta saadaan ensin hommat toimimaan. Tämä tehdään komentamalla

```bash
sudo ufw allow in "Apache"
```

Komennon palaute kertoo onnistuessaan että palomuurisääntöjä on päivitetty (Rules updated).

Tämän jälkeen tsekkaa jälleen palomuurin tila komentamalla `sudo ufw status`. Nyt lopputuloksena pitäisi olla jotakin seuraavanlaista:

```bash
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
Apache                     ALLOW       Anywhere                  
Apache (v6)                ALLOW       Anywhere (v6)
```

Liikenne on nyt sallittu palomuurin läpi porttiin 80 sekä IPv4 että IPv6 -osoitteilla.

Apache2 on käynnistetty asennuksen jälkeen automaattisesti, joten voit virtuaalikoneen selaimella nyt testata paikallista osoitetta http://127.0.0.1/. Näkyviin pitäisi tulla sivu Ubuntun logolla ja tekstillä Apache2 Default Page ja teksti **It works!**

Mikäli VMWare Workstation/Fusion on konfiguroitu käyttämään siltaavaa verkkoyhteytta (bridged), virtuaalikone saa oman IP-osoitteen reitittimeltä täsmälleen samaan tapaan kuin host-kone. Voit siis päästä virtuaalikoneen web-palvelimen etusivulle host-koneeltasi selvittämällä ensin virtuaalikoneen julkisen IP-osoitteen komentamalla (Ubuntussa):

```bash
ip addr
```

Listauksesta pitäisi löytyä IP-osoite, jonka antamalla host-koneen selaimen osoitekenttään pitäisi avautua sama sivu kuin virtuaalikoneen selaimella osoitteessa http://127.0.0.1.

Ubuntu tekee Apachen kanssa asiat helpoksi: HTTP-palvelin on suoraan enabloitu prosessi, joka käynnistyy aina tietokoneen käynnistyksen yhteydessä. Jos virtuaalikone uudelleenkäynnistetään, palvelin käynnistyy koneen mukana aina automaattisesti.

Jos (ja kun) palvelinta on tarpeen käynnistää uudelleen tai sammuttaa, tähän on seuraavat komennot:

Apachen käynnistys

```bash
sudo systemctl start apache2
```

Apachen sammutus

```bash
sudo systemctl stop apache2
```

Apachen uudelleenkäynnistys

```bash
sudo systemctl restart apache2
```

Apachen uudelleenlataus (konfiguraatiomuutokset voimaan ilman uudelleenkäynnistystä)

```bash
sudo systemctl reload apache2
```

Apachen tilan voi tarkistaa seuraavasti

```bash
sudo systemctl status apache2
```

Apachen konfiguraatiotiedoston syntaksin oikeellisuus tulee tarkistaa muutosten jälkeen. Se tehdään seuraavasti

```bash
sudo apachectl -t
```

# MySQL/MariaDB - Tietokannan asennus

Kun HTTP-palvelin on asennettu ja todettu toimivaksi, asennetaan tietokantapalvelinohjelmistop. Seuraavalla komennolla:

```bash
sudo apt install mysql-server
```

Asennuksen jälkeen tulee ajaa MySQL-tietokantapalvelimen konfigurointiskripti, mutta ennen kuin tämä onnistutaan Ubuntussa tekemään, on muokattava **tietokantapalvelimen** root-käyttäjän kirjautumismetodi sellaiseksi, että sillä voidaan kirjautua salasanan kanssa.

> Tämä tehdään siksi, että oletusarvoisesti MySQL-konfigurointiskripti käyttää käyttöjärjestelmän root-käyttäjää ja Ubuntussa tämä on poistettu käytöstä. Siksi teemme ennen konfigurointiskriptin ajamista tämän tempun jotta konfigurointi onnistuu.
{: .prompt-info}

Temppu on seuraava: käynnistetään MySQL-palvelimen oma komentokehote eli CLI root-käyttäjänä seuraavalla komennolla:

```bash
sudo mysql
```

Huomaa, että komentokehote on tämän jälkeen seuraavanlainen:

```bash
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.43-0ubuntu0.24.04.2 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. bash names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

Aja tässä komentokehotteessa seuraava komento, **mutta korvaa komennossa sana password haluamallasi salasanalla** (juurikäyttäjälle annettava salasana) j**a tallenna se itsellesi:**

```bash
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

Jos onnistui, saat tulosteen `Query OK, 0 rows affected (0.00 sec)`

Tämän jälkeen poistu MySQL-komentokenotteesta komentamalla:

```bash
mysql> exit
```

Nyt olet palannut Ubuntun normaaliin terminaalin komentokehotteeseen. Seuraavaksi ajetaan MySQL-konfigurointiskripti, joka kyselee muutamia kysymyksiä ajon aikana. L**ue kysymykset tarkasti ja vastaa kysymyksiin.** Konfigurointi käynnistyy komennolla

```bash
sudo mysql_secure_installation
```

Ensimmäiseksi kysytään edellisessä vaiheessa antamaasi juurikäyttäjän salasanaa. Huomaa että tässäkään ei mitään tapahdu eikä näy kun kirjoitat salasanaa, mutta kirjoitusta kyllä tapahtuu. Salasanan antamisen jälkeen paina enter ja saat ensimmäisen kysymyksen:

```bash
VALIDATE PASSWORD COMPONENT can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD component?

Press y|Y for Yes, any bash key for No:
```

Ota käyttöön salasanojen validointi vastaamalla Y ja konfiguraatio etenee. Seuraavaksi valitaan millaisia salasanoja voidaan antaa. Tuotantopalvelimella valitaan STRONG eli numero 2, meille riittää tässä tapauksessa LOW eli valinta on numero 0 ja sen jälkeen enter.

Seuraavaksi kysytään, haluatko vaihtaa juurikäyttäjän salasanan. Voit joko vaihtaa tai olla vaihtamatta, jolloin säilyy se salasana jonka ennen skriptin ajamista komennossa määräsit. Tuotantopalvelimen ollessa kyseessä salasana tulee tässä vaiheessa vaihtaa, jotta edellinen, komentohistoriaan jäänyt salasana ei jää kummittelemaan.

**LUE SEURAAVAT KYSYMYKSET TARKASTI ja pohdi mitä kysytään.** Loppuihin kysymyksiin vastataan joka tapauksessa aina Y. All done! -viestin jälkeen MySQL on asennettu ja suojattu.

Tämän jälkeen voit testata palvelimen toiminnan kirjautumalla root-käyttäjänä tietokantapalvelimeen komentamalla

```bash
sudo mysql -u root -p
```

\-u -vipu kertoo että palvelimelle halutaan kirjautua juurikäyttäjällä, ja -p -vipu kertoo että kirjautuminen tehdään salasanaa käyttäen. Kirjautuessa kysytään **tietokannan root-käyttäjälle** edellisissä vaiheissa antamaasi salasanaa.

# PHP-sovellusten ajoympäristön asennus

PHP-ohjelmointikielellä kirjoitetut ohjelmat, kuten juuri WordPress, tarvitsevat oman ajoympäristön samaan tapaan kuin JavaScript/TypeScript -ohjelmointikielellä kirjoitetut omansa. Seuraavalla komennolla asennamme yhdellä komennolla kolme eri pakettia, jotka komennossa ovat seuraavasa järjestyksessä: Itse PHP-ajoympäristö, PHP-kirjastomoduuli Apache2-http-palvelinta varten ja PHP-kirjasto MySQL-tietokantapalvelinta varten. Tämä onnistuu komennolla

```bash
sudo apt install php libapache2-mod-php php-mysql
```

Asennuksen jälkeen voit todeta asennuksen onnistumisen ja asennetun PHP-version seuraavalla komennolla:

```bash
php -v
```

Asennus onnistui, jos lopputulemana sait edeltävältä komennolta jotakin tämäntapaista

```bash
PHP 8.3.6 (cli) (built: Jul 14 2025 18:30:55) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.3.6, Copyright (c) Zend Technologies
    with Zend OPcache v8.3.6, Copyright (c), by Zend Technologies
```

# Apachen konfigurointi suosimaan PHP-tiedostoja

Oletusarvoisesti Apache -http-palvelin etsii oletussisältökansiostaan aina ensisijaisesti tiedostoa nimeltä index.html. Kun PHP on asennettu, on usein hyödyllistä konfiguroida Apache niin, että tämän sijaan etsitäänkin ensisijaisesti tiedostoa nimeltä index.php.

> php-päätteiset tiedostot ovat tiedostoja, jotka PHP-ajoympäristön tulee ajaa ja jotka sisältävät PHP-koodia.
{: .prompt-info}

Tällä harjoituksella selviää myös mistä Apachen konfiguraatiotiedostot löytyvät, miltä yksi niistä näyttää ja miten siihen tehdyt muutokset otetaan käyttöön.

Avaa valitsemallasi tekstieditorilla tiedosto dir.conf komennossa mainitusta sijainnista. Komennossa tähän käytetään Nano-tekstieditoria.

```bash
sudo nano /etc/apache2/mods-enabled/dir.conf
```

Tiedostossa on seuraavanlainen sisältö:

```bash
DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
```

Tässä rivillä näkyy prioriteettijärjestys, jolla hakemiston tiedostoja etsitään ja käytetään. Siirrä index.php ensimmäiseksi, jonka jälkeen sisällön tulisi näyttää tältä:

```bash
DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
```

Tallenna tiedosto (Nanossa näppäinyhdistelmä Ctrl+O) ja sulje Nano (näppäinyhdistelmä Ctrl+X).

Jotta konfiguraatio tulee voimaan, on Apache -http-palvelin uudelleenkäynnistettävä. Tee se komennolla

```bash
sudo systemctl restart apache2
```

Lopuksi voit tarkistaa että Apache pyörii nätisti:

```bash
sudo systemctl status apache2
```

Tuloste on jotakuinkin tämän kaltainen, ja siitä pääsee poistumaan painamalla Q:

```bash
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/apache2.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-10-03 00:04:03 EEST; 7s ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 14956 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
   Main PID: 14960 (apache2)
      Tasks: 6 (limit: 4548)
     Memory: 10.7M (peak: 11.2M)
        CPU: 26ms
     CGroup: /system.slice/apache2.service
             ├─14960 /usr/sbin/apache2 -k start
             ├─14962 /usr/sbin/apache2 -k start
             ├─14963 /usr/sbin/apache2 -k start
             ├─14964 /usr/sbin/apache2 -k start
             ├─14965 /usr/sbin/apache2 -k start
             └─14966 /usr/sbin/apache2 -k start

Oct 03 00:04:03 hsateila-VMware20-1 systemd[1]: Starting apache2.service - The Apache HTTP Server...
Oct 03 00:04:03 hsateila-VMware20-1 apachectl[14959]: AH00558: apache2: Could not reliably determine the server's fully>
Oct 03 00:04:03 hsateila-VMware20-1 systemd[1]: Started apache2.service - The Apache HTTP Server.
```

# Testataan että PHP ja Apache toimivat kauniisti keskenään

PHP:n testausta vaten meidän täytyy tietää mistä Apache kaivelee tiedostot, joita se selaimelle palvelee kun käyttäjä selaimellaan tälle juuri pystyttämällemme palvelimelle saapuu. Oletusarvoinen sijainti löytyy Apachen oletusarvoiselta sivulta, jota jo tarkastelimmekin selaimessa osoitteessa http://127.0.0.1 virtuaalikoneen sisällä tai isäntäkoneen selaimella virtuaalikoneen IP-osoitteen kautta. Tsekkaa tämä sivu nyt, ja tutustu sivuun. Etsi sivulta kohta jossa kerrotaan palvelimen julkinen kansio josta sivut palvellaan selaimelle.

Siirry komentorivillä tähän kansioon:

```bash
cd /var/www/html/
```

Listaa kansion sisältö. Kansiosta löytyy tasan yksi tiedosto, index.html. Nyt luomme tänne Nanolla toisen, index.php:

```bash
sudo nano /var/www/html/index.php
```

Lisää Nanolla tähän tiedostoon täsmälleen seuraava sisältö, tallenna tiedosto ja sulje Nano:

```php
<?php
phpinfo();
?>
```

Kun tiedosto on tallennettu. tarkista uudelleen http://127.0.0.1/ virtuaalikoneen selaimella (tai isäntäkoneella virtuaalikoneen osoitteen kautta. Näkymässä pitäisi olla nyt PHP:n konfiguraatiosivu, jonka vasemmassa ylänurkassa alkaa teksti PHP Version...

> **HUOM!** Ei ole millään muotoa tietoturvallista jättää Apachen oletussivua tai PHP:n konfiguraatiosivua mihinkään näkyviin, joten tuotantopalvelimilla nämä on syytä poistaa ja korvata varsinaisella palvelimen etusivulla. Kehityspalvelimella tässä meidän tapauksessamme ne voivat siellä olla.
{: .prompt-warninge}

# Asennetaan joitakin yleisiä PHP-moduuleja sovelluksia varten

WordPress ja graafinen tietokantaliittymä vaativat lisäkirjastoja PHP:lle toimiakseen. Asennetaan nämä seuraavalla komennolla:

```bash
sudo apt install php-cli php-curl php-mbstring php-xml php-zip
```

**Mitäs nämä ovat?**

**php-cli:** PHP:n komentorivikäyttöliittymä. Voidaan ajaa PHP-skriptejä suoraan komentoriviltä.

**php-curl:** Tarvitaan HTTP-pyyntöjä varten. Ohjelmointirajapinnat (API:t), maksuvälittäjät ja OAuth-integraatiot käyttävät tätä.

**php-mbstring:** Lisää tuen laajemmalle joukolle merkistökoodauksia (character encodings), kuten UTF-8. Tarvitaan esim. ääkkösten ja muiden kansainvälisten merkkien toimnnan varmistamiseksi.

**php-xml:** Lisää tuen XML-dokumenttien parseroinnille. Monet sisällönhallintajärjestelmien lisäosat (pluginit) vaativat tämän.

**php-zip:** Lisää tuen .zip -pakattujen tiedostojen käsittelylle.

# Asennuksen jälkeisiä kovennustoimenpiteitä tuotantopalvelimella

- Muista ajaa mysql_secure_installation heti MySQL-tietokannan asennuksen jälkeen
- Konfiguroi UFW-palomuuri estämään liikenne muihin kuin tarvittaviin portteihin (tässä nämä olivat 80 ja 443)
- Käytä HTTPS-liikennettä eli TLS/SSL -salausta esim. Let's Encrypt -palvelun kanssa.
- Ota Apache-palvelimen hakemistolistaus pois käytöstä.
- Muokkaa PHP-konfiguraatiota (php.ini) rajoittamaan näkyvyyttä (expose_php = Off).

Lähde: [https://www.digitalocean.com/community/tutorials/how-to-install-lamp-stack-on-ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-lamp-stack-on-ubuntu)

# Graafinen ja selainpohjainen käyttöliittymä MySQL-tietokantaan: phpmyadmin

Jotta päästään simppelimmin selaimen välityksellä operoimaan tietokannassa, asennamme käyttöön phpmyadmin-nimisen selainpohjaisen PHP-ohjelmiston joka sallii tietokannan hallinnan selaimen kautta.

Jotta asennus etenee mukisematta, on tehtävä pieni konfiguraatiomuutos MySQL-tietokantaan. Kirjaudutaan kantaan sisälle komentoriviltä seuraavasti:

```bash
mysql -u root -p
```

Anna taas tietokannan juurikäyttäjän salasana kun sitä kysytään. Tämän jälkeen MySQL-komentokehotteessa aja seuraava komento:

```sql
mysql> UNINSTALL COMPONENT "file://component_validate_password";
```

Tämän jälkeen sulje tietokannan kometokehote kirjoittamalla `exit` ja painamalla enter.

Itse PHP:n asennus onnistuu helpoiten seuraavalla loitsulla, jolla asennetaan samalla myös muutama tarvittava lisämoduuli PHP:n joita ei aiemmin asennettu:

```bash
sudo apt install phpmyadmin php-gd php-json
```

**Ja mitäs ne taas olivatkaan?**

**phpmyadmin:** phpmyadmin-ohjelmisto itse, joka mahdollistaa selainpohjaisen tietokannanhallinnan.

**php-gd:** Lisää tuen [GD-grafiikkakirjastolle](https://en.wikipedia.org/wiki/GD_Graphics_Library).

**php-json:** Lisää tuen JSON-muotoisen datan käsittelylle.

Asennuksen aikana näkyviin pärähtää melko 80-luvun näköinen asennusruutu (velho).

Ensimmäisenä täytyy valita mikä HTTP-palvelin konfiguroidaan. Valitse apache2. Tsekkaa kuvasta että välilyöntiä painamalla varmasti valitset apache2 konfigurointia varten.

![phpmyadmin configuration for apache2](./assets/media/operating-systems-lamp-stack/configuring-phpmyadmin.png){: w="400"}

Samanlaisessa ruudussa seuraavaksi kysytään konfiguroidaanko dbconfig-common. **LUE KYSYMYS JA OHJE** ja valitse Yes.

Tämän jälkeen keksi salasana phpmyadminia varten. Tallenna se itsellesi.

Tietokannan nimeä ja käyttäjänimeä kysyttäessä voit käyttää oletusarvoja.

Asennus lisää automaattisesti phpmyadminia varten konfiguraation Apache-http-palvelimen konfiguraatioon. Viimeinen temppu on ottaa PHP:ssä käyttöön mbstring-moduuli seuraavasti:

```bash
sudo phpenmod mbstring
```

Lopuksi käynnistetään Apache vielä uudelleen jotta konffit tulevat voimaan:

```bash
sudo systemctl restart apache2
```

Nyt phpmyadmin-kirjautumisruudun pitäisi löytyä osoitteesta http://127.0.0.1/phpmyadmin/ (ja vastaavasti isäntäkoneen selaimen kautta jos sieltä menet) ja sisään voi kirjautua käyttäjätunnuksella phpmyadmin ja antamallasi salasanalla.

Nyt meillä on valmis web-palvelin jolla voidaan ajaa PHP-sovelluksia ja johon voidaan asentaa sisällönhallintajärjestelmiä kuten WordPress!

**JOS phpmyadmin ei yllä olevassa osoitteessa toimi**, on asennuksen aikana mennyt jotakin mönkään ja helpointa on ottaa asennus uudelleen alusta asti. phphmyadminin poisto onnistuu seuraavasti:

Poista phpmyadmin kokonaisuudessaan, mukaan lukien sen lataamat riippuvuudet (siksi sudo apt purge eikä sudo apt remove):

```bash
sudo apt purge phpmyadmin
```

Poista phpmyadminin konfiguraatiot seuraavilla komennoilla:

```bash
sudo rm -vf /etc/apache2/conf.d/phpmyadmin.conf
sudo rm -vfR /usr/share/phpmyadmin
```

Lähde: [https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04)

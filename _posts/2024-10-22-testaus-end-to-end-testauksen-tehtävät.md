---
layout: post
title: 'Testaus: End-to-end -testauksen tehtävät'
date: 2024-10-22 16:46 +0300
categories: [Opintojaksot, Testaus]
media_subpath: /assets/media/testaus/
---

## End-to-end -testaus, tehtävä 1

Oletko jo asentanut Cypressin? Jos et, käy ensiksi läpi [Cypressin asennus](https://tiko.jamk.fi/~hsateila/posts/cypressin-asennus/). Siellä olevasta esimerkkitestistä näkyy malli, jota voi hyödyntää tässäkin tehtävässä.

Tee Cypressillä testi, joka toteuttaa seuraavan polun:

1. Menee suomenkieliselle wikipedia pääsivulle.

2. Etsii hakukentän, kirjoittaa siihen "Jamk" ja hakee

3. Tarkistaa, että olemme oikealla sivulla. (url:issa siis tulisi olla "Jyv%C3%A4skyl%C3%A4n_ammattikorkeakoulu" (todennäköisesti, ääkköset ovat hieman kinkkisiä...))

4. Rullaa kohtaan "Kampukset".

5. Tarkistaa, että "Kampukset" on näkyvillä.

6. Odottaa 5 sekuntia.

7. Vaihtaa kielen englanniksi, jolloin meidän tulisi päätyä Jamkin sivuille englannikielisessä Wikipediassa.

8. Tarkistaa, että uusi sivu on oikea (url:in tulisi siis olla jotain tyyliin ```https://en.wikipedia.org/wiki/JAMK_University_of_Applied_Sciences```)

## End-to-end -testaus, tehtävä 2

Tee Cypressillä vähintään seuraava testipolku Frontend-perusteet -kurssin pizza-online sivustolle:

1. Menee sivustolle https://tiko.jamk.fi/~imjar/fronttiper/esimteht/pizza_anim/

2. Täyttää Nimi-kentän tiedot, ja tarkistaa että ne ovat oikein

3. Täyttää Puhelin-kentän tiedot, ja tarkistaa että ne ovat oikein

4. Täyttää Sähköposti-kentän tiedot, ja tarkistaa että ne ovat oikein

5. Valitsee halutun koon

6. Valitsee halutun pohjan

7. Valitsee halutut täytteet

8. Tarkistaa, että "Maksa tilaus"-nappulan yläpuolella oleva hinta-elementissä on oikea loppusumma

Voit halutessasi myös monipuolistaa testipolkua.

>Neuvoa tehtäviin voi etsiä [Cypressin API-dokumentaatiosta](https://docs.cypress.io/api/table-of-contents).
{: .prompt-info}

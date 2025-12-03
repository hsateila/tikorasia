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

8. Tarkistaa, että uusi sivu on oikea (url:in tulisi siis olla jotain tyyliin `https://en.wikipedia.org/wiki/JAMK_University_of_Applied_Sciences`)

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

## Esimerkkejä todo-sovelluksen harjoituksen tehtäviin

Seuraavia voit käyttää pohjana todo-harjoituksen end-to-end -tehtävissä, ensimmäisenä konfiguraatioesimerkki, jossa siirretään koko Cypress tests-kansion alle:

```javascript
import { defineConfig } from 'cypress';

export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },

    // Cypress-konfiguraatiot
    baseUrl: 'http://localhost:5173', // sovelluksen sijaintiurl kehitykympäristössä
    specPattern: 'tests/cypress/e2e/**/*.{cy,spec}.{js,jsx,ts,tsx}', // polku ja tiedostonimimuoto, jolla Cypress etsii testitiedostot
    supportFile: 'tests/cypress/support/e2e.js', // polku ja tiedostonimimuoto, jolla Cypress etsii supportFilen
    fixturesFolder: 'tests/cypress/fixtures', // polku ja tiedostonimimuoto, jolla Cypress etsii fixtures-kansion
  },
});
```
Tässä esimerkkiä pohjaksi testeille spec.cy.js -tiedostoon:

```javascript
describe('Todo app', () => {
  beforeEach(() => {
    cy.visit('/');
    // Clear localStorage before each test for isolation
    cy.clearLocalStorage();
  });

  it('creates a new task and displays it in the list', () => {
    // Fill in the form
    cy.get('#topic').type('Testitaski').should('have.value', 'Testitaski');
    cy.get('#description')
      .type('Testitaskin kuvaus')
      .should('have.value', 'Testitaskin kuvaus');

    // Submit the form
    cy.get('#save-btn').click();

    // Verify the task appears in the list
    cy.get('#task-list').should('be.visible');
    cy.get('#task-list .task').should('have.length', 1);

    // Check the task contains correct content
    cy.get('#task-list .task')
      .first()
      .within(() => {
        cy.get('.title').should('contain', 'Testitaski');
        cy.get('.desc').should('contain', 'Testitaskin kuvaus');
      });

    // Verify empty state is hidden
    cy.get('#empty-state').should('not.be.visible');

    // Verify task is persisted in localStorage
    cy.window().then((win) => {
      const tasks = JSON.parse(win.localStorage.getItem('todo_tasks_v1'));
      expect(tasks).to.have.length(1);
      expect(tasks[0].topic).to.equal('Testitaski');
      expect(tasks[0].description).to.equal('Testitaskin kuvaus');
      expect(tasks[0].priority).to.equal('medium'); // default value
      expect(tasks[0].status).to.equal('todo'); // default value
      expect(tasks[0].completed).to.be.false;
    });
  });

  it('deletes a task and verifies it is removed', () => {
    // First, create a task
    cy.get('#topic').type('Poistettava taski');
    cy.get('#description').type('Tämä poistetaan');
    cy.get('#save-btn').click();

    // Verify task was created
    cy.get('#task-list .task').should('have.length', 1);
    cy.get('#task-list .task .title').should('contain', 'Poistettava taski');

    // Delete the task
    cy.get('#task-list .task')
      .first()
      .within(() => {
        cy.get('button[data-action="delete"]').click();
      });

    // Verify task is removed from the list
    cy.get('#task-list .task').should('have.length', 0);

    // Verify empty state is displayed
    cy.get('#empty-state').should('be.visible');

    // Verify task is removed from localStorage
    cy.window().then((win) => {
      const tasks = JSON.parse(win.localStorage.getItem('todo_tasks_v1'));
      expect(tasks).to.have.length(0);
    });
  });
});
```

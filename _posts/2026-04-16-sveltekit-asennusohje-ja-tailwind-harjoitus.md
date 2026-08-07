---
layout: post
title: SvelteKit-asennusohje ja Tailwind-harjoitus
date: 2026-04-11 16:41 +0200
categories: [Opintojaksot, Käytettävyys web-sovelluksissa]
media_subpath: /assets/media/sveltekit-asennus/
image: svelte-cover.jpg
---
## Esivaatimukset

- Node.js tulee olla asennettuna ja toimia.

## SvelteKit-asennus

Tee itsellesi projektikansio johon tämä harjoitus toteutetaan. Kansioon asennetaan SvelteKitin perusta ja demosovellus, jota ihmettelemällä opetellaan Svelten komponenttiajattelua.

Siirry luomaasi kansioon ja aja seuraava komento (voit korvata esimerkkisovellus-sanan haluamallasi sovelluksen nimellä) ja tee seuraavat valinnat asennuksen aikana:

```php
npx sv create esimerkkisovellus
```

- **Which template would you like?** - `SvelteKit demo`
- **Add type checking with TypeScript?** - `Yes, using TypeScript syntax`
- **What would you like to add to your project?** - Nuolinäppäimillä liikutaan ja valinta tehdään välilyönnillä. Valitse `prettier`, `eslint` ja `tailwindcss`.
- **tailwindcss: Which plugins would you like to add?** - Valitse molemmat tarjolla olevat, `typography` ja `forms`.
- **Which package manager do you want to install dependencies with?** - `npm`

---

Nyt sovelluspohja on asennettu. Vaihda kansioon, jonka sv-asennus loi. Kansio on nimeltään edellisessä komennuksessa antamasi sovelluksen nimi (esimerkkikomennossa tämä on `esimerkkisovellus`)

Testaa sovelluksen toiminta ajamalla komento

```php
npm run dev -- --open
```

Selaimeen pitäisi avautua Svelten esimerkkisovellus, joka näyttää osapuilleen tältä:

![Ohjekuva, miltä Svelte-sovellus näyttää asennuksen jälkeen](sveltekit-installed.png)

---

Seuraavaksi tehdään malliksi oma sivu esimerkkisovellukseen jotta hieman hahmotetaan miten homma toimii. Mene projektikansiossa kansioon `src/routes`, ja luo sinne esimerkiksi kansio jonka nimi on `testi`.

Luo testi -kansioon tiedostot +page.svelte ja +page.ts. Lisää niihin alla olevat sisällöt.

`src/routes/testi/+page.svelte`

```html
<script>
	let count = 0;

	function increment() {
		count += 1;
	}
</script>

<div>
	<h1>Tervetuloa testisivulle!</h1>
	<p>Lukumäärä: {count}</p>
	<button on:click={increment}> Kasvata </button>
</div>

<style>
	div {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 100vh;
	}

	button {
		margin-top: 1rem;
		padding: 0.5rem 1rem;
		cursor: pointer;
	}
</style>
```

`src/routes/testi/+page.ts`

```typescript
import { dev } from '$app/environment';

// we don't need any JS on this page, though we'll load
// it in dev so that we get hot module replacement
export const csr = dev;

// since there's no dynamic data here, we can prerender
// it so that it gets served as a static asset in production
export const prerender = true;
```

> **Huom! +pages.ts EI ole osa Svelteä, vaan SvelteKitiä.** Tämän tiedoston tarkoitus on sisältää koodi jolla sivulle tuotava data ladataan backendistä ennen kuin varsinainen sivu ladataan jotta se on valmiina varsinaista sivulatausta varten.
{: .prompt-warning}

---

Sivu ei vielä näy kehitysympäristössä. Meidän täytyy muokata *komponenttia*, joka sisältää sivun valikon ja lisätä juuri luomamme *route* eli *reititys* sinne. Tiedosto, johon muutos tehdään, löytyy projektista polusta src/routes/Header.svelte. Tee muokkaukset tiedostoon siten että tiedoston sisältö on alla olevan mukainen. 

> Muutos on pieni, etsi `nav` -elementistä lisättävä listaelementti `li` ja lisää se sisältöineen tiedostoon oikeaan kohtaan. Huomaa että **reititys ei ole osa Svelten toiminnallisuutta vaan osa SvelteKitiä.**
{: .prompt-info}

`+Header.svelte`

```html
<script lang="ts">
	import { resolve } from '$app/paths';
	import { page } from '$app/state';
	import github from '$lib/images/github.svg';
	import logo from '$lib/images/svelte-logo.svg';
</script>

<header>
	<div class="corner">
		<a href="https://svelte.dev/docs/kit">
			<img src={logo} alt="SvelteKit" />
		</a>
	</div>

	<nav>
		<svg viewBox="0 0 2 3" aria-hidden="true">
			<path d="M0,0 L1,2 C1.5,3 1.5,3 2,3 L2,0 Z" />
		</svg>
		<ul>
			<li aria-current={page.url.pathname === '/' ? 'page' : undefined}>
				<a href={resolve('/')}>Home</a>
			</li>
			<li aria-current={page.url.pathname === '/about' ? 'page' : undefined}>
				<a href={resolve('/about')}>About</a>
			</li>
			<li aria-current={page.url.pathname.startsWith('/sverdle') ? 'page' : undefined}>
				<a href={resolve('/sverdle')}>Sverdle</a>
			</li>
			<li aria-current={page.url.pathname === '/testi' ? 'page' : undefined}>
				<a href={resolve('/testi')}>Testi</a>
			</li>
		</ul>
		<svg viewBox="0 0 2 3" aria-hidden="true">
			<path d="M0,0 L0,3 C0.5,3 0.5,3 1,2 L2,0 Z" />
		</svg>
	</nav>

	<div class="corner">
		<a href="https://github.com/sveltejs/kit">
			<img src={github} alt="GitHub" />
		</a>
	</div>
</header>

<style>
	header {
		display: flex;
		justify-content: space-between;
	}

	.corner {
		width: 3em;
		height: 3em;
	}

	.corner a {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 100%;
		height: 100%;
	}

	.corner img {
		width: 2em;
		height: 2em;
		object-fit: contain;
	}

	nav {
		display: flex;
		justify-content: center;
		--background: rgba(255, 255, 255, 0.7);
	}

	svg {
		width: 2em;
		height: 3em;
		display: block;
	}

	path {
		fill: var(--background);
	}

	ul {
		position: relative;
		padding: 0;
		margin: 0;
		height: 3em;
		display: flex;
		justify-content: center;
		align-items: center;
		list-style: none;
		background: var(--background);
		background-size: contain;
	}

	li {
		position: relative;
		height: 100%;
	}

	li[aria-current='page']::before {
		--size: 6px;
		content: '';
		width: 0;
		height: 0;
		position: absolute;
		top: 0;
		left: calc(50% - var(--size));
		border: var(--size) solid transparent;
		border-top: var(--size) solid var(--color-theme-1);
	}

	nav a {
		display: flex;
		height: 100%;
		align-items: center;
		padding: 0 0.5rem;
		color: var(--color-text);
		font-weight: 700;
		font-size: 0.8rem;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		text-decoration: none;
		transition: color 0.2s linear;
	}

	a:hover {
		color: var(--color-theme-1);
	}
</style>

```

> **Svelte-komponentin perusajatus** on, että komponentti sisältää aivan kaiken mitä komponentin näyttämiseksi vaaditaan. Tämän rakenteen ansiosta kutakin komponenttia voidaan kehittää ja muuttaa ilman, että se vaikuttaa muualle sovellukseen (Single File Component, SFC).
{: .prompt-info}

> Komponentin osat ovat **Skriptit (The Script Block)**, **HTML-rakenteen (The Markup, HTML)** ja **tyylit (The Style Block)** ja ne sijaitsevat komponentissa tässä järjestyksessä.
{: .prompt-info}

> Tämän voisi sanoa olevan .svelte -tiedoston "pyhä kolminaisuus". Mikään osio ei tarkkaan ottaen ole välttämätön, vaikkapa tyylittelyt voivat puuttua mikäli ne tehdään Tailwindin avulla. Useimmiten komponentit sijaitsevat tiedostossa kuitenkin tässä järjestyksessä.
{: .prompt-info}

---

Palataan uuden tekemämme sivun pariin ja muokataan komponenttia siten, että asettelu ja tyylit tehdään suoran CSS:n sijaan Tailwindcss:n avulla. Muokataan tiedostoa src/routes/testi/+page.svelte.

Muokkaa tiedostoa siten, että sivulla tyyliblokissa `<style>...</style>` tehdyt asettelut ja tyylittelyt tehdään tyyliblokin sijaan Tailwindillä. Muokkauksen jälkeen tiedosto näyttää jotakuinkin alla olevan kaltaiselta. Huomioi, että tästä puuttuu nyt `<style>` -blokki koska sama hoidetaan Tailwindin utility-luokilla:

`src/routes/testi/+page.svelte`

```html
<script>
	let count = 0;

	function increment() {
		count += 1;
	}
</script>

<div class="flex min-h-screen flex-col items-center justify-center gap-3">
	<h1 class="text-3xl font-semibold">Tervetuloa testisivulle!</h1>
	<p class="text-lg">Lukumäärä {count}</p>
	<button
		class="mt-4 rounded-md bg-blue-600 px-4 py-2 text-white transition hover:bg-blue-700 focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:outline-none"
		on:click={increment}
	>
		Kasvata
	</button>
</div>
```

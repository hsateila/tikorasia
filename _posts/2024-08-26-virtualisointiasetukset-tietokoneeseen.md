---
layout: post
title: Virtualisointiasetukset tietokoneeseen
date: 2024-08-26 13:11 +0300
categories: [Opintojaksot, Käyttöjärjestelmät ja palvelimet]
---
## Virtualisointiasetukset kohdalleen

### HyperV:n poistaminen käytöstä

Microsoft-windows -isäntäkoneissa, eli läppärilläsi jossa on käytössä Microsoft Windows (todennäköisesti 10 tai 11), on mahdollisesti otettava HyperV-toiminnallisuus pois käytöstä. VirtualBox ja Hyper-V eivät välttämättä toimi oikein keskenään.

1. Avaa PowerShell ylläpitäjän käyttöoikeuksilla Käynnistä -valikosta
2. Aja seuraava komento
        ```powershell
        Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
        ```

3. Aja seuraava komento

        ```powershell
        dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
        ```

4. Aja seuraava komento

        ```powershell
        bcedit /set hypervisorlaunchtype off
        ```

Jos saat virheilmoituksen joka kertoo jotakin tyyliin "Windows can’t recognize the feature hyper-v", ei hätää. Aja vain muutkin komennot ohjeen mukaan. Tämä johtuu Windowsin vnahasta Hyper-V ja WSL2-tuesta, mutta se ei ole ongelma.

## Virtualisoinnin käyttöönotto

Virtualisointi täytyy ottaa käyttöön hostin UEFI tai BIOS -asetuksissa jotta VirtualBox voi ajaa virtualisoituja koneita. Tarkista käyttääkö koneesi UEFIa vai BIOSia: <https://itsfoss.com/check-uefi-or-bios/>

- UEFI-pohjaisessa tietokoneessa ei useimmiten ole näppäinkomentoa jota tulee painaa ennen kuin käyttöjärjestelmä käynnistyy jotta päästään käsiksi asetuksiin. Sen sijaan näitä asetuksia voidaan säätää käyttöjärjestelmästä itsestään: paina shift-näppäin pohjaan samalla kun uudelleenkäynnistät Windowsin, ja uudelleenkäynnistys vie teämän jälkeen UEFI-asetusvalikkoon. Voit tarkistaa myös laitevalmistajan ohjeista miten UEFI-asetuksiin päästään käsiksi.

- Jotta pääset käsiksi UEFI firmware-asetuksiin, klikkaa Troubleshoot -laatikkoa, valitse Advanced Options ja valitse UEFI Firmware Settings. Klikkaa Restart ja tietokoneesi käynnistyy UEFI firmwaren asetusnäyttöön.

- BIOS-pohjaisella koneellä käynnistä tietokone ja avaa järjestelmän BIOS-valikko. Tämä tehdään useimmiten painamalla käynnistyksen aikana pohjaan delete-näppäin, F1, Alt tai F4, järjestelmästä riippuen. Tarkista näppäin tietokonevalmistajan ohjeista.

Kun olet päässyt tietokoneen BIOS-valikkoon, valitse Processor-valikosta Processor settings (voi olla piilossa Chipset, Advanced CPU Configuration tai Northbridge alla).

- Laita päälle Intel Virtualization Technology (tunnetaan myös nimellä Intel VT) tai AMD-V, riippuen kumman valmistajan prosessori koneessasi on. Virtualisointiasetukset voivat kulkea myös nimellä Virtualization Extensions, Vanderpool, SVM tai muilla nimillä riippuen valmistajasta ja järjestelmän BIOSista.

- Laita päälle Intel VTd tai AMD IOMMU, jos nämä vaihtoehdot ovat näkyvissä. Intel VTd ja AMD IOMMU ovat käytössä PCI-väylän läpivientiä varten.

## Palaaminen lähtöruutuun (esimerkiksi Docker voi Windowsissa vaatia asetusten palauttamista alkuperäisiksi)

Kun olet saanut tehtävät tehtyä ja hyväksyttyä, tee seuraavat temput jotta saat Dockerin taas toimintakuntoon.

1. Avaa PowerShell hallintakäyttäjän oikeuksilla Käynnistä-valikosta
2. Aja seuraava komento

        ```powershell
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
        ```

3. Aja seuraava komento

        ```powershell
        dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /all /norestart
        ```

4. Aja seuraava komento

        ```powershell
        dism.exe /Online /Enable-Feature /featurename:VirtualMachinePlatform /all /norestart
        ```

5. Aja seuraava komento

        ```powershell
        bcdedit /set hypervisorlaunchtype auto
        ```

6. Käynnistä tietokone uudelleen.

Nyt Dockerin tulisi käynnistyä ja toimia normaalisti. Jos ei, yhteys opettajaan.

Ohjeista kiitokset myös Teemu Pölkille!

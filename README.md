# PW NIS2 ACN Database

Progetto PostgreSQL per la gestione strutturata di asset, servizi, dipendenze esterne, responsabilità e profili di sicurezza, con riferimento agli adempimenti informativi NIS2 e alla logica del Framework Nazionale per la Cybersecurity e la Data Protection.

## Contenuto repository

- `schema.sql` : definizione dello schema relazionale
- `seed.sql` : dati di test
- `queries.sql` : query di interrogazione
- `export_view.sql` : vista per output strutturato esportabile
- `versioning.sql` : trigger e funzione per storico modifiche asset
- `data-dictionary.md` : descrizione delle tabelle e dei campi
- `README.md` : panoramica del progetto

## Ordine di esecuzione

1. Creare un database PostgreSQL
2. Eseguire `schema.sql`
3. Eseguire `versioning.sql`
4. Eseguire `seed.sql`
5. Eseguire `export_view.sql`
6. Eseguire le query presenti in `queries.sql`

## Oggetto del progetto

Il database consente di rappresentare:

- organizzazione
- contatti
- provider esterni
- asset
- servizi
- dipendenze
- responsabilità
- subcategory del framework
- controlli di sicurezza
- profili target e current
- associazione tra asset e controlli

## Struttura logica del modello

Il modello è costruito per unire due dimensioni:

1. **dimensione inventariale e organizzativa**, che comprende asset, servizi, provider, dipendenze e responsabilità
2. **dimensione di assessment**, che comprende subcategory, controlli, profili e associazioni tra controlli e asset

In questo modo il database non si limita a conservare un inventario tecnico, ma permette anche di rappresentare il profilo di sicurezza dell’organizzazione secondo una logica coerente con il Framework Nazionale.

## Funzionalità principali

- gestione di asset e servizi
- associazione tra servizi e asset
- tracciamento delle dipendenze da terze parti
- associazione di ruoli e punti di contatto
- gestione di subcategory e controlli
- definizione di profili target e current
- registrazione del livello di implementazione e maturità dei controlli
- associazione tra asset e controlli applicabili
- vista SQL per reporting ed export
- storico minimo delle modifiche sugli asset

## Esempi di interrogazione

Le query incluse nel repository permettono di analizzare:

- asset critici
- servizi attivi
- dipendenze esterne
- responsabilità e contatti associati
- controlli inclusi nel profilo target
- stato dei controlli nel profilo attuale
- associazione tra asset, controlli e subcategory

## Finalità del progetto

L’obiettivo del progetto è costruire una base dati ordinata e interrogabile che consenta di descrivere in modo strutturato il contesto digitale di un’organizzazione, supportando sia la gestione interna delle informazioni sia una rappresentazione più coerente dei controlli e dei profili di sicurezza richiesti in un contesto di assessment.
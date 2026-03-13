# PW NIS2 ACN Database

Progetto PostgreSQL per la gestione strutturata di asset, servizi, dipendenze esterne e responsabilità, con riferimento agli adempimenti informativi NIS2 e ai profili ACN.

## Contenuto repository

- `schema.sql` : definizione dello schema relazionale
- `seed.sql` : dati di test
- `queries.sql` : query di interrogazione
- `export_view.sql` : vista per output strutturato esportabile
- `versioning.sql` : trigger e funzione per storico modifiche asset

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

## Funzionalità principali

- gestione asset e servizi
- associazione tra servizi e asset
- tracciamento dipendenze da terze parti
- associazione di ruoli e punti di contatto
- vista SQL per reporting ed export
- storico minimo delle modifiche sugli asset
# Data Dictionary

## organization
- `organization_id`: identificativo univoco dell'organizzazione
- `name`: nome dell'organizzazione
- `sector`: settore operativo
- `created_at`: data di creazione record

## contact
- `contact_id`: identificativo univoco del contatto
- `organization_id`: riferimento all'organizzazione
- `full_name`: nome e cognome del contatto
- `email`: email del contatto
- `phone`: numero di telefono
- `role_title`: ruolo professionale

## provider
- `provider_id`: identificativo univoco del provider
- `organization_id`: riferimento all'organizzazione
- `name`: nome del provider
- `provider_type`: tipo provider (CLOUD, ISP, MAINTAINER, PARTNER)
- `service_scope`: ambito del servizio erogato

## asset
- `asset_id`: identificativo univoco dell'asset
- `organization_id`: riferimento all'organizzazione
- `name`: nome dell'asset
- `asset_type`: tipologia asset
- `criticality`: livello di criticità
- `status`: stato operativo
- `location`: posizione fisica o logica
- `description`: descrizione sintetica
- `created_at`: data di inserimento
- `updated_at`: data ultimo aggiornamento

## service
- `service_id`: identificativo univoco del servizio
- `organization_id`: riferimento all'organizzazione
- `name`: nome del servizio
- `criticality`: livello di criticità
- `status`: stato del servizio
- `description`: descrizione sintetica
- `created_at`: data di inserimento

## service_asset
- `service_id`: riferimento al servizio
- `asset_id`: riferimento all'asset

## service_dependency
- `dependency_id`: identificativo univoco dipendenza
- `service_id`: riferimento al servizio
- `provider_id`: riferimento al provider
- `dependency_type`: tipo dipendenza
- `notes`: note descrittive

## responsibility
- `responsibility_id`: identificativo univoco responsabilità
- `contact_id`: riferimento al contatto
- `asset_id`: riferimento all'asset, se presente
- `service_id`: riferimento al servizio, se presente
- `responsibility_role`: ruolo assegnato

## asset_history
- `history_id`: identificativo univoco storico
- `asset_id`: riferimento all'asset modificato
- `old_name`: nome precedente
- `old_criticality`: criticità precedente
- `old_status`: stato precedente
- `changed_at`: timestamp modifica
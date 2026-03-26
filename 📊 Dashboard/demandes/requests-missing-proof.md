---
tags:
  - dashboard
---

# ⚠️ Demandes avec données manquantes

> Ces demandes sont **incomplètes** — elles ne constituent pas encore une preuve valide.
> À compléter dès que l'information est disponible.

---

## ❌ Sans ticket externe

```dataview
TABLE WITHOUT ID
  file.link       AS "Demande",
  client          AS "Client",
  project         AS "Projet",
  source_channel  AS "Canal",
  received_at     AS "Reçu le"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND (external_ticket_key = "" OR !external_ticket_key)
SORT received_at DESC
```

---

## ❌ Sans projet

```dataview
TABLE WITHOUT ID
  file.link       AS "Demande",
  client          AS "Client",
  source_channel  AS "Canal",
  received_at     AS "Reçu le"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND (project = "" OR !project)
SORT received_at DESC
```

---

## ❌ Sans responsable de traitement

```dataview
TABLE WITHOUT ID
  file.link       AS "Demande",
  client          AS "Client",
  received_at     AS "Reçu le",
  external_ticket_key AS "Ticket"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND (handled_by = "" OR !handled_by)
SORT received_at DESC
```

---

## ❌ Sans date de livraison

```dataview
TABLE WITHOUT ID
  file.link           AS "Demande",
  client              AS "Client",
  received_at         AS "Reçu le",
  external_ticket_key AS "Ticket",
  handled_by          AS "Traité par"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND (delivered_at = "" OR !delivered_at)
SORT received_at DESC
```

---

## ❌ Sans preuve de livraison

```dataview
TABLE WITHOUT ID
  file.link           AS "Demande",
  client              AS "Client",
  received_at         AS "Reçu le",
  delivered_at        AS "Livré le"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND (delivery_proof = "" OR !delivery_proof)
  AND delivered_at != ""
SORT received_at DESC
```

---

## ❌ Non validées par le client

```dataview
TABLE WITHOUT ID
  file.link           AS "Demande",
  client              AS "Client",
  received_at         AS "Reçu le",
  delivered_at        AS "Livré le",
  delivery_proof      AS "Preuve"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND client_validated = false
  AND delivered_at != ""
SORT received_at DESC
```

---

## 🔔 À relancer

> Demandes actives sans relance depuis +7 jours, avec une relance planifiée aujourd'hui ou en retard, ou bloquées.

```dataview
TABLE WITHOUT ID
  file.link           AS "Demande",
  client              AS "Client",
  project             AS "Projet",
  status              AS "Statut",
  next_followup_at    AS "📅 Relance prévue",
  last_reminder_at    AS "🕐 Dernière relance",
  is_blocked          AS "🚫 Bloqué"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
  AND status != "4-validated"
  AND status != "5-archived"
  AND (
    (next_followup_at AND date(next_followup_at) <= date(today))
    OR (is_blocked = true)
    OR (!last_reminder_at)
    OR ((date(today) - date(last_reminder_at)).days >= 7)
  )
SORT next_followup_at ASC, received_at DESC
```

---
tags:
  - dashboard
---

# 📋 Registre des demandes clients

> **1 ligne = 1 demande = 1 preuve.**
> Source de vérité. Ne jamais modifier les notes sources directement depuis ici.

---

## 🗂️ Journal complet

```dataview
TABLE WITHOUT ID
  file.link                          AS "Demande",
  client                             AS "Client",
  project                            AS "Projet",
  source_channel                     AS "Canal",
  received_at                        AS "Reçu le",
  received_by                        AS "Par",
  external_ticket_key                AS "Ticket",
  handled_by                         AS "Traité par",
  delivered_at                       AS "Livré le",
  choice(client_validated, "✅", "⏳") AS "Validé client"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
SORT received_at DESC
```

---

## 🔴 Demandes critiques

```dataview
TABLE WITHOUT ID
  file.link       AS "Demande",
  client          AS "Client",
  source_channel  AS "Canal",
  received_at     AS "Reçu le",
  external_ticket_key AS "Ticket",
  handled_by      AS "Traité par",
  delivered_at    AS "Livré le"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request") AND priority = "critical"
SORT received_at DESC
```

---

## 🔍 Par client

```dataview
TABLE WITHOUT ID
  client          AS "Client",
  rows.file.link  AS "Demandes",
  length(rows)    AS "Total"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY client
SORT length(rows) DESC
```

---

## 📡 Par canal de réception

```dataview
TABLE WITHOUT ID
  source_channel   AS "Canal",
  rows.file.link   AS "Demandes",
  length(rows)     AS "Total"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY source_channel
SORT length(rows) DESC
```

---

## 📌 Par projet

```dataview
TABLE WITHOUT ID
  project         AS "Projet",
  rows.file.link  AS "Demandes",
  length(rows)    AS "Total"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY project
SORT length(rows) DESC
```


---
tags:
  - dashboard
---

# 📊 Dashboard — Demandes clients

> **Obsidian = registre de preuve.**
> Le suivi opérationnel (statuts, sprints) reste dans Jira / ton outil projet.

---

## ⚡ Accès rapide

| Action | Template |
|--------|----------|
| Capturer une demande | `request-capture` |
| Logger un appel | `phone-log` |
| Logger une réunion | `meeting-log` |

---

## 📋 Vue registre complet → [[requests-log]]

## ⚠️ Preuves manquantes → [[requests-missing-proof]]

## 📖 Guide d'utilisation → [[guide]]

---

## 📈 Stats globales

```dataview
TABLE WITHOUT ID
  length(rows) AS "Total demandes"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
```

```dataview
TABLE WITHOUT ID
  source_channel AS "Canal",
  length(rows)   AS "Nb"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY source_channel
SORT length(rows) DESC
```

```dataview
TABLE WITHOUT ID
  client       AS "Client",
  length(rows) AS "Nb demandes"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY client
SORT length(rows) DESC
```

```dataview
TABLE WITHOUT ID
  project      AS "Projet",
  length(rows) AS "Nb demandes"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
GROUP BY project
SORT length(rows) DESC
```

---

## 🕐 10 dernières demandes reçues

```dataview
TABLE WITHOUT ID
  file.link           AS "Demande",
  client              AS "Client",
  project             AS "Projet",
  source_channel      AS "Canal",
  received_at         AS "Reçu le",
  external_ticket_key AS "Ticket",
  handled_by          AS "Traité par",
  delivered_at        AS "Livré le",
  choice(client_validated, "✅", "⏳") AS "Client OK"
FROM "📥 Customer Demands/📁 Requests"
WHERE contains(tags, "request")
SORT received_at DESC
LIMIT 10
```

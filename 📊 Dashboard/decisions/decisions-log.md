---
tags:
  - dashboard
---

# 🪓 Décisions techniques

> Toutes les décisions techniques prises, liées à leur demande client source.

---

## Journal des décisions

```dataview
TABLE WITHOUT ID
  file.link        AS "Décision",
  decided_at       AS "Décidé le",
  decided_by       AS "Par",
  project          AS "Projet",
  impact_level     AS "Impact",
  related_request  AS "Demande liée"
FROM "🗄️ Archive" OR "📑 Notes"
WHERE contains(tags, "decision")
SORT decided_at DESC
```

---

## Par projet

```dataview
TABLE WITHOUT ID
  project        AS "Projet",
  rows.file.link AS "Décisions",
  length(rows)   AS "Total"
FROM "🗄️ Archive" OR "📑 Notes"
WHERE contains(tags, "decision")
GROUP BY project
SORT length(rows) DESC
```

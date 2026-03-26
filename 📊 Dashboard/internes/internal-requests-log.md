---
tags:
  - dashboard
---

# ⚙️ Suivi des Demandes Internes

> Ce tableau de bord centralise toutes les demandes internes de l'équipe (clarifications, specs, documentation, etc.).

---

## 🚀 Vue d'ensemble

| Statut | Nombre |
|---|---|
| 🟢 Ouvertes | `$=dv.pages('"⚙️ Internal Requests"').where(p => p.status === "1-opened").length` |
| 🟡 En cours | `$=dv.pages('"⚙️ Internal Requests"').where(p => p.status === "2-in-progress").length` |
| ✅ Résolues | `$=dv.pages('"⚙️ Internal Requests"').where(p => p.status === "3-resolved").length` |

---

##  Kanban des Demandes Internes

### 📥 Ouvertes (À traiter)
```dataview
TABLE
    requester as "Demandeur",
    handler as "Assigné à",
    related_project as "Projet"
FROM "⚙️ Internal Requests"
WHERE status = "1-opened"
SORT created_at DESC
```

### ⏳ En cours
```dataview
TABLE
    requester as "Demandeur",
    handler as "Assigné à",
    related_project as "Projet"
FROM "⚙️ Internal Requests"
WHERE status = "2-in-progress"
SORT created_at DESC
```

### ✅ Résolues (30 derniers jours)
```dataview
TABLE
    requester as "Demandeur",
    handler as "Assigné à",
    resolved_at as "Résolu le"
FROM "⚙️ Internal Requests"
WHERE status = "3-resolved" AND (date(today) - date(resolved_at)).days <= 30
SORT resolved_at DESC
```

---

## 👤 Demandes par Membre de l'Équipe

### Assignées à Moi
```dataview
TABLE
    requester as "Demandeur",
    request_type as "Type",
    created_at as "Créé le"
FROM "⚙️ Internal Requests"
WHERE contains(handler, "Ahmed") AND status != "3-resolved"
SORT created_at DESC
```

### Créées par Moi
```dataview
TABLE
    handler as "Assigné à",
    status as "Statut",
    created_at as "Créé le"
FROM "⚙️ Internal Requests"
WHERE contains(requester, "Ahmed")
SORT created_at DESC
```

---

## 🔔 À relancer

> Demandes internes non résolues sans relance depuis +7 jours, bloquées, ou avec une relance planifiée.

```dataview
TABLE
  requester           as "Demandeur",
  handler             as "Assigné à",
  request_type        as "Type",
  status              as "Statut",
  next_followup_at    as "📅 Relance prévue",
  last_reminder_at    as "🕐 Dernière relance",
  is_blocked          as "🚫 Bloqué"
FROM "⚙️ Internal Requests"
WHERE status != "3-resolved"
  AND (
    (next_followup_at AND date(next_followup_at) <= date(today))
    OR (is_blocked = true)
    OR (!last_reminder_at)
    OR ((date(today) - date(last_reminder_at)).days >= 7)
  )
SORT next_followup_at ASC, created_at DESC
```

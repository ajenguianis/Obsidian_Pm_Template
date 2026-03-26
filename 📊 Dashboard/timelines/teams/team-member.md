---
tags:
  - dashboard
  - timeline
  - team
member_name: Anis
---

# 👥 Chronologie membre d'équipe — Anis

> Ce dashboard regroupe chronologiquement tous les éléments liés au membre "Anis" (one-to-one, recadrage, demandes internes, réunions, etc.).

---

## 📋 Tous les éléments du membre (ordre chronologique)

```dataviewjs
const member = "Anis";
const folders = [
  "🗄️ Archive",
  "📅 Meetings",
  "⚙️ Internal Requests",
  "📑 Notes",
  "👥 Team"
];
let pages = dv.pages().where(p => folders.some(f => p.file.path.startsWith(f)));
function hasParticipant(p, name) {
  if (!p.participants) return false;
  if (Array.isArray(p.participants)) return p.participants.includes(name);
  if (typeof p.participants === 'string') return p.participants.split(',').map(x => x.trim()).includes(name);
  return false;
}
let filtered = pages.where(p =>
  hasParticipant(p, member) ||
  p.requester === member ||
  p.handler === member ||
  p.member_name === member
);
dv.table([
  "Élément",
  "Type",
  "Créé le",
  "Mis à jour le"
],
filtered.map(p => [
  p.file.link,
  p.tags && p.tags.includes("meeting") ? "Réunion" : p.tags && p.tags.includes("internal-request") ? "Demande interne" : p.tags && p.tags.includes("one-to-one") ? "One-to-one" : p.tags && p.tags.includes("recadrage") ? "Recadrage" : "Autre",
  p.created ?? "",
  p.updated ?? ""
])
);
```

---

## 📋 Suivi management du membre (one-to-one, recadrage)

```dataviewjs
const member = "Anis";
const folders = [
  "🗄️ Archive",
  "📅 Meetings",
  "⚙️ Internal Requests",
  "📑 Notes",
  "👥 Team"
];
let pages = dv.pages().where(p => folders.some(f => p.file.path.startsWith(f)));
function hasParticipant(p, name) {
  if (!p.participants) return false;
  if (Array.isArray(p.participants)) return p.participants.includes(name);
  if (typeof p.participants === 'string') return p.participants.split(',').map(x => x.trim()).includes(name);
  return false;
}
let filtered = pages.where(p =>
  (hasParticipant(p, member) && (
    (Array.isArray(p.tags) && (p.tags.includes("one-to-one") || p.tags.includes("recadrage"))) ||
    (typeof p.tags === 'string' && (p.tags.includes("one-to-one") || p.tags.includes("recadrage")))
  ))
);
dv.table([
  "Élément",
  "Type",
  "Créé le",
  "Mis à jour le"
],
filtered.map(p => [
  p.file.link,
  p.tags && p.tags.includes("one-to-one") ? "One-to-one" : p.tags && p.tags.includes("recadrage") ? "Recadrage" : "Autre",
  p.created ?? "",
  p.updated ?? ""
])
);
```

---

---
tags:
  - dashboard
  - timeline
  - project
project: acme-website-relaunch
---

# 📅 Chronologie projet — acme-website-relaunch

> Ce dashboard regroupe chronologiquement toutes les demandes, réunions, décisions, livrables liés au projet "acme-website-relaunch".

---

## 📋 Tous les éléments du projet (ordre chronologique)

```dataviewjs
const folders = [
  "🗄️ Archive",
  "📥 Customer Demands/📁 Requests",
  "📅 Meetings",
  "📑 Notes",
  "📌 Projects",
  "♻️ Templates"
];
let pages = dv.pages().where(p => folders.some(f => p.file.path.startsWith(f)) && p.project === "acme-website-relaunch");
function parseDate(d) {
  if (!d || typeof d !== 'string') return null;
  // Supporte YYYY-MM-DD ou YYYY-MM-DD HH:mm:ss
  const parts = d.split(/[- :T]/).map(Number);
  if (parts.length >= 3) {
    return new Date(parts[0], parts[1] - 1, parts[2], parts[3] || 0, parts[4] || 0, parts[5] || 0);
  }
  return null;
}
dv.table([
  "Élément", "Type", "Date demande", "Date décision", "Date réunion", "Échéance livrable", "Créé le", "Mis à jour le"
],
pages.map(p => [
  p.file.link,
  p.tags && p.tags.includes("decision") ? "Décision" : p.tags && p.tags.includes("meeting") ? "Réunion" : p.tags && p.tags.includes("request") ? "Demande" : p.tags && p.tags.includes("deliverable") ? "Livrable" : "Autre",
  p.received_at ?? "",
  p.decided_at ?? "",
  p.date ?? "",
  p.due_date ?? "",
  p.created ?? "",
  p.updated ?? ""
]).sort((a, b) => {
  // Tri chronologique sur la première date non vide (convertie en Date)
  const getFirstDate = row => [row[2], row[3], row[4], row[5], row[6], row[7]].map(parseDate).find(d => d instanceof Date && !isNaN(d));
  const da = getFirstDate(a);
  const db = getFirstDate(b);
  if (!da && !db) return 0;
  if (!da) return 1;
  if (!db) return -1;
  return da - db;
})
);
```

---

## 📋 Toutes les demandes du projet (vue détaillée)

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
WHERE contains(tags, "request") AND project = "acme-website-relaunch"
SORT received_at DESC
```

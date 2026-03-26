<%*
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const today = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';

const project_name = await tp.system.prompt("Nom du projet ?");
const project_slug = slug(project_name || 'no-project');
const archive_path = `🗄️ Archive/${now.getFullYear()}/${project_slug}`;

await tp.file.rename(project_slug || "new-project");
await tp.file.move("📌 Projects/" + (project_slug || "new-project"));
-%>
---
tags:
  - project
  - pm
client: ""
project_slug: "<% project_slug %>"
status: "active"
priority: "medium"
start_date: "<% today %>"
target_date: ""
owner: ""
created: "<% today %>"
updated: "<% today %>"
archive_path: "<% archive_path %>"
repo_url: ""
---

# 🚀 <% project_name %>

> Fiche projet

---

## 📋 Informations projet
- **Nom du projet :** <% project_name %>
- **Client :**
- **Slug :** <% project_slug %>
- **Owner :**
- **Priorité :** Medium
- **Statut :** Actif
- **Date de début :** <% today %>
- **Date cible :**

---

## 🎯 Objectifs & succès

### Objectifs
-

### Critères de succès (KPI)
-

### Hors périmètre
-

---

## 🧩 Périmètre & livrables

### Livrables principaux
-

### Jalons
| Jalon | Échéance | Statut | Notes |
|------|----------|--------|-------|
| Kickoff |  | 🟡 En cours |  |

---

## 👥 Équipe projet

| Rôle | Nom | Contact | Disponibilité |
|------|-----|---------|---------------|
| PM |  |  |  |
| Tech Lead |  |  |  |
| Stakeholder Client |  |  |  |

---

## ⚠️ Risques & blocages

### Risques
-

### Blocages actuels
-

### Décisions en attente
-

---

## 📝 Suivi

### Prochaines actions
- [ ]
- [ ]

### Dernière mise à jour
-

---

## 🔗 Liens utiles
- Dashboard : [[index]]
- Demandes : [[requests-log]]
- Décisions : [[decisions-log]]

---

## 🗂️ Dépôt du projet
| Champ | Valeur |
|-------|--------|
| URL du dépôt | <% tp.frontmatter.repo_url %> |
| Type | (GitHub, GitLab, Bitbucket, etc.) |
| Branche principale | |

---

## 🗄️ Archivage
> **Destination :** `<% archive_path %>`
> 
> **Action :** Clic droit sur la note → Templater → Run archive-note.md

---

**Mise à jour :** <% today %>
**Responsable :**

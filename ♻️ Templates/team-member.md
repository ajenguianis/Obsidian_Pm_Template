<%*
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const today = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';

const member_name = await tp.system.prompt("Nom du membre de l'équipe ?");
const archive_path = `🗄️ Archive/${now.getFullYear()}/team`;

await tp.file.rename(member_name || "new-member");
await tp.file.move("👥 Team/" + (member_name || "new-member"));
-%>
---
tags:
  - team
  - handler
role: ""
email: ""
phone: ""
status: "active"
created: "<% today %>"
updated: "<% today %>"
archive_path: "<% archive_path %>"
---

# 👤 <% member_name %>

## Informations
- **Nom :** <% member_name %>
- **Rôle :**
- **Email :**
- **Téléphone :**
- **Statut :** Actif

## Projets assignés
-

## Notes
-

---

## 🗄️ Archivage
> **Destination :** `<% archive_path %>`
> 
> **Action :** Clic droit sur la note → Templater → Run archive-note.md

---

**Mis à jour :** <% today %>

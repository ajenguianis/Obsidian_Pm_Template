<%*
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const today = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';

const client_name = await tp.system.prompt("Nom du client ?");
const archive_path = `🗄️ Archive/${now.getFullYear()}/clients/${slug(client_name || 'no-client')}`;

await tp.file.rename(client_name || "new-client");
await tp.file.move("👤 Clients/" + (client_name || "new-client"));
-%>
---
tags:
  - client
  - contact
type: ""
industry: ""
website: ""
status: "active"
created: "<% today %>"
updated: "<% today %>"
owner: ""
archive_path: "<% archive_path %>"
---

# 👥 <% client_name %>

> Fiche client

---

## 📋 Informations générales
- **Nom :** <% client_name %>
- **Type :**
- **Industrie :**
- **Site Web :**
- **Relation depuis :** <% today %>
- **Status :** Actif

---

## 👤 Contacts principaux

### Contact Principal - Commercial/PM
- **Nom :**
- **Titre :**
- **Email :**
- **Téléphone :**
- **Préférence :**

### Contact Principal - Technique
- **Nom :**
- **Titre :**
- **Email :**
- **Téléphone :**
- **Préférence :**

### Contact Secondaire
- **Nom :**
- **Titre :**
- **Email :**
- **Téléphone :**
- **Préférence :**

---

## 📞 Canaux de communication préférés

| Canal | Préféré ? | Détail | Horaires |
|-------|-----------|--------|----------|
| 📧 Email | ⭐⭐⭐ |  |  |
| 📞 Téléphone | ⭐⭐ |  |  |
| 📅 Réunion | ⭐⭐ |  |  |
| 💬 Slack/Teams | ⭐ |  |  |
| 🤝 Présentiel | ⭐ |  |  |

---

## 🎯 Projets actifs avec ce client

| Projet | Slug | Statut | Début | Fin estimée |
|--------|------|--------|-------|-------------|
|  |  | 🟢 Actif |  |  |

---

## 📊 Contexte métier & contraintes

### Objectifs client
-

### Pain points
-

### Contraintes importantes
-

### Partenaires / Dépendances
-

---

## 📝 Notes
-

---

## 🔗 Demandes liées
Voir [[requests-log]] et filtrer par client.

---

## 🗄️ Archivage
> **Destination :** `<% archive_path %>`
> 
> **Action :** Clic droit sur la note → Templater → Run archive-note.md

<%*
// Créer un lien cliquable pour l'archivage
const archPath = archive_path;
-%>

---

**Mise à jour :** <% today %>
**Responsable :**

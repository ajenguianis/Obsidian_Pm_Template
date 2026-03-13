<%*
// ─── Génération ID & Timestamp ────────────────────────────────────────────────
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const received_at = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
const request_id = `req_${now.getFullYear()}${pad(now.getMonth() + 1)}${pad(now.getDate())}_${now.getTime().toString().slice(-6)}`;

// ─── Saisie guidée ────────────────────────────────────────────────────────────
const clientFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("👤 Clients/"));
const clientNames = clientFiles.map(f => f.basename);
const client  = await tp.system.suggester(clientNames, clientFiles.map(f => f.basename));

const projectFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("📌 Projects/"));
const projectNames = projectFiles.map(f => f.basename);
const project = await tp.system.suggester(projectNames, projectFiles.map(f => f.basename));

const task_description = await tp.system.prompt("Description courte de la tâche");

const channel = await tp.system.suggester(
  ["📞 Téléphone", "📅 Réunion", "📧 Email", "💬 Slack / Teams", "🤝 Direct (présentiel)", "🎫 Ticket entrant"],
  ["phone", "meeting", "email", "slack", "direct", "ticket"]
);
const priority = await tp.system.suggester(
  ["🔴 Critique", "🟠 Haute", "🟡 Moyenne", "🟢 Basse"],
  ["critical", "high", "medium", "low"]
);

// ─── Auto-move et renommage ───────────────────────────────────────────────────
const date_prefix = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';
const archive_path = `🗄️ Archive/${now.getFullYear()}/${slug(project || 'no-project')}/requests`;
const new_title = `${date_prefix}-${slug(client)}-${slug(project)}-${slug(task_description)}`;
await tp.file.rename(new_title);
await tp.file.move("📥 Customer Demands/📁 Requests/" + new_title);
-%>
---
tags:
  - request
  - proof
request_id: "<% request_id %>"
status: "1-captured"
client: "<% client %>"
project: "<% project %>"
received_at: "<% received_at %>"
received_by: "Anis AJENGUI"
source_channel: "<% channel %>"
priority: "<% priority %>"
external_ticket_key: ""
external_ticket_url: ""
handled_by: ""
delivered_at: ""
delivery_proof: ""
client_validated: false
client_validation_date: ""
time_to_delivery: ""
time_to_validation: ""
next_followup_at: ""
last_reminder_at: ""
is_blocked: false
blocked_reason: ""
archive_path: "<% archive_path %>"
---

# 📋 `<% client %>` — <% tp.file.title %>

> [!info] Horodatage de réception
> **Reçu le :** `<% received_at %>`
> **Client :** `<% client %>`
> **Projet :** `<% project %>`
> **Via :** `<% channel %>`
> **Par :** Anis AJENGUI
> **Priorité :** `<% priority %>`

---

## 🗣️ Verbatim client
> *(Coller ici les mots exacts du client, sans reformulation)*

---

## 📌 Demande reformulée
*(Ta synthèse courte et précise — 2-3 lignes max)*

---

## 🧩 Contexte
- **Problème actuel :**
- **Impact business :**
- **Depuis quand / déclencheur :**

---

## ⚙️ Détails techniques transmis à l'équipe
*(Ce que tu as compris et transmis — stack, endpoints, contraintes, périmètre)*

```
// specs / pseudocode / liens API / captures
```

---

## 🎫 Ticket externe
| Champ | Valeur |
|-------|--------|
| Clé ticket | *(ex: PROJ-123)* |
| URL | *(lien direct)* |
| Outil | *(Jira / Azure DevOps / Linear / …)* |
| Assigné à | |
| Date de transmission | |

---

## ✅ Clôture & Preuve de livraison
| Champ | Valeur |
|-------|--------|
| Traité par | |
| Livré le | |
| Preuve | *(mail, CR, lien commit, release note, …)* |
| Validé par le client | ☐ Oui &nbsp; ☐ Non &nbsp; ☐ En attente |
| Notes de clôture | |

---

## 📎 Pièces jointes & références
- 

---

## 🔔 Suivi & Relance
| Champ | Valeur |
|-------|--------|
| Prochaine relance | *(remplir `next_followup_at` dans le frontmatter)* |
| Dernière relance | *(remplir `last_reminder_at` dans le frontmatter)* |
| Bloqué ? | ☐ Oui &nbsp; ☐ Non |
| Raison blocage | |

---

## 🗄️ Archivage
> **Destination :** `<% archive_path %>`
> 
> **Action :** Clic droit sur la note → Templater → Run archive-note.md


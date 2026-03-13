<%*
// ─── Génération ID & Timestamp ────────────────────────────────────────────────
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const ts = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
const request_id = `req_${now.getFullYear()}${pad(now.getMonth() + 1)}${pad(now.getDate())}_${now.getTime().toString().slice(-6)}`;

// ─── Saisie guidée ────────────────────────────────────────────────────────────
const clientFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("👤 Clients/"));
const clientNames = clientFiles.map(f => f.basename);
const client  = await tp.system.suggester(clientNames, clientFiles.map(f => f.basename));

const projectFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("📌 Projects/"));
const projectNames = projectFiles.map(f => f.basename);
const project = await tp.system.suggester(projectNames, projectFiles.map(f => f.basename));

const task_description = await tp.system.prompt("Description courte de la tâche");
const caller = await tp.system.prompt("Nom de l'appelant");
const dir    = await tp.system.suggester(["📲 Appel entrant", "📤 Appel sortant"], ["inbound", "outbound"]);

// ─── Auto-move et renommage ───────────────────────────────────────────────────
const date_prefix = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';
const new_title = `${date_prefix}-${slug(client)}-${slug(project)}-${slug(task_description)}`;
await tp.file.rename(new_title);
await tp.file.move("📥 Customer Demands/📁 Requests/" + new_title);
-%>
---
tags:
  - request
  - proof
  - phone
request_id: "<% request_id %>"
status: "1-captured"
client: "<% client %>"
project: "<% project %>"
caller: "<% caller %>"
call_direction: "<% dir %>"
received_at: "<% ts %>"
received_by: "Anis AJENGUI"
source_channel: "phone"
priority: ""
external_ticket_key: ""
external_ticket_url: ""
handled_by: ""
delivered_at: ""
delivery_proof: ""
client_validated: false
client_validation_date: ""
time_to_delivery: ""
time_to_validation: ""
---

# 📞 Appel — `<% client %>` — <% tp.file.title %>

> [!info] Horodatage appel
> **Date/heure :** `<% ts %>`
> **Client :** `<% client %>`
> **Projet :** `<% project %>`
> **Appelant :** `<% caller %>`
> **Direction :** `<% dir %>`
> **Pris par :** Anis AJENGUI

---

## 🗣️ Verbatim client
> *(Mots exacts du client pendant l'appel)*

---

## 📋 Demandes identifiées

| # | Demande | Lien note | Priorité | Ticket |
|---|---------|-----------|----------|--------|
| 1 | | | | |

> Créer une note `request-capture` par demande distincte.

---

## ✅ Engagements pris pendant l'appel
- [ ] 
- [ ] 

## ❓ Points à clarifier
- 

---

## 📎 Preuve d'appel
- Numéro appelant :
- Durée :
- Enregistrement / SMS de confirmation :

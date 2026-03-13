<%*
// ─── Configuration ────────────────────────────────────────────────────────────
const FOLDER_MEETINGS = "📅 Meetings";
const FOLDER_CLIENTS = "👤 Clients/";
const FOLDER_PROJECTS = "📌 Projects/";

const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const ts = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}`;
const date_prefix = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;

const meeting_type = await tp.system.suggester(
["Client", "Partenaire", "Interne"],
["client", "partner", "internal"]
);

let participants_str = "Anis AJENGUI (Interne)";
let project_link = "";
let client_link = "";

if (meeting_type === "client") {
const clientFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith(FOLDER_CLIENTS));
const clientNames = clientFiles.map(f => f.basename);
const client_name = await tp.system.suggester(clientNames, clientNames);
if (client_name) {
client_link = `[[${client_name}]]`;
participants_str += `\n- ${client_name} (Client)`;
}

const projectFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith(FOLDER_PROJECTS));
const projectNames = projectFiles.map(f => f.basename);
const project_name = await tp.system.suggester(projectNames, projectNames);
if (project_name) {
project_link = `[[${project_name}]]`;
}
} else if (meeting_type === "partner") {
const partner_name = await tp.system.prompt("Nom du partenaire ?");
if (partner_name) {
participants_str += `\n- ${partner_name} (Partenaire)`;
}
}

const meeting_subject = await tp.system.prompt("Sujet de la réunion ?") || "meeting";
const slug = (str) => str.toLowerCase().replace(/\s+/g, "-").replace(/[^a-z0-9-]/g, "");
const raw_project = project_link.replace(/\[\[|\]\]/g, "");
const archive_path = `🗄️ Archive/${now.getFullYear()}/${slug(raw_project || "no-project")}/meetings`;
const new_title = `${date_prefix}-${meeting_type}-${slug(meeting_subject)}`;

if (tp.file && tp.file.title) {
await tp.file.rename(new_title);
try { await app.vault.createFolder(FOLDER_MEETINGS); } catch (e) {}
await tp.file.move(`${FOLDER_MEETINGS}/${new_title}`);
}
%>
---
tags:
  - meeting
  - log
meeting_type: "<% meeting_type %>"
created_at: "<% ts %>"
client: "<% client_link %>"
project: "<% project_link %>"
partner: ""
source_channel: "meeting"
status: "captured"
next_followup_at: ""
last_reminder_at: ""
archive_path: "<% archive_path %>"
---

# 📅 CR Réunion — <% tp.date.now("YYYY-MM-DD") %>

## 🧭 Type de réunion
- <% meeting_type === "client" ? "[x]" : "[ ]" %> Client
- <% meeting_type === "partner" ? "[x]" : "[ ]" %> Partenaire
- <% meeting_type === "internal" ? "[x]" : "[ ]" %> Interne

## 📝 Sujet
- <% meeting_subject %>

## 👥 Participants
<%*
// Format participants as a list
const participants = participants_str.split('\n').filter(p => p.trim() !== '');
for (let p of participants) {
tR += `\n${p}`;
}
%>

## 🔗 Contexte
- Client: <% client_link %>
- Projet: <% project_link %>
- Partenaire (si applicable):
- Liens utiles:

## 🎯 Ordre du jour
1.
2.
3.

## 🗣️ Points discutés
-

## 🪓 Décisions
-

## ✅ Actions à entreprendre
- [ ]

## 📋 Demandes émises pendant la réunion
> Si plusieurs demandes: créer 1 note `request-capture` par demande via `ALT+N`, puis lier ici.

| # | Demande | Lien note | Priorité | Ticket externe |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |

## 📎 Pièces jointes
- Enregistrement:
- Présentation:
- Docs partagés:

---

## 🗄️ Archivage
> **Destination :** `<% archive_path %>`
> 
> **Action :** Clic droit sur la note → Templater → Run archive-note.md

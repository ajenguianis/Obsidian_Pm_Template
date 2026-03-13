<%*
// ─── Génération ID & Timestamp ────────────────────────────────────────────────
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const created_at = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
const request_id = `ireq_${now.getFullYear()}${pad(now.getMonth() + 1)}${pad(now.getDate())}_${now.getTime().toString().slice(-6)}`;

// ─── Saisie guidée ────────────────────────────────────────────────────────────
const teamFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("👥 Team/"));
const teamMembers = teamFiles.map(f => f.basename);
const requester = await tp.system.suggester(teamMembers, teamMembers);

const request_type = await tp.system.suggester(
  ["❓ Clarification", "📄 Documentation", "🛠️ Spec Technique", "🐛 Bug Report", "💡 Amélioration"],
  ["clarification", "documentation", "spec", "bug", "improvement"]
);

const handler = await tp.system.suggester(teamMembers, teamMembers);

const projectFiles = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("📌 Projects/"));
const projectNames = projectFiles.map(f => f.basename);
const related_project = await tp.system.suggester(["(Aucun)", ...projectNames], ["", ...projectNames]);

const task_description = await tp.system.prompt("Description courte de la demande");
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : 'no-project';
const archive_path = `🗄️ Archive/${now.getFullYear()}/${slug(related_project || 'no-project')}/internal-requests`;

// ─── Auto-move et renommage ───────────────────────────────────────────────────
const date_prefix = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const new_title = `${date_prefix}-${slug(request_type)}-${slug(requester)}-${slug(task_description)}`;
await tp.file.rename(new_title);
await tp.file.move("⚙️ Internal Requests/" + new_title);
-%>
---
tags:
  - internal-request
request_id: "<% request_id %>"
status: "1-opened"
requester: "[[👥 Team/<% requester %>]]"
request_type: "<% request_type %>"
handler: "[[👥 Team/<% handler %>]]"
related_project: "<% related_project %>"
created_at: "<% created_at %>"
resolved_at: ""
next_followup_at: ""
last_reminder_at: ""
is_blocked: false
blocked_reason: ""
archive_path: "<% archive_path %>"
---

# ⚙️ <% tp.file.title %>

> [!info] Demande Interne
> **ID :** `<% request_id %>`
> **Demandeur :** [[👥 Team/<% requester %>]]
> **Type :** <% request_type %>
> **Date :** <% created_at %>
> **Assigné à :** [[👥 Team/<% handler %>]]

---

## ❓ Demande
*(Description claire et concise du besoin : Que manque-t-il ? Quel est le problème ?)*


---

## 🎯 Contexte
*(Pourquoi cette demande est-elle nécessaire ? Pour quel projet/client ? Quel est l'impact si elle n'est pas traitée ?)*
- **Projet lié :** <% related_project %>
- **Demande client liée :** 

---

## ✅ Solution / Réponse
*(Une fois la demande traitée, décrire ici la solution apportée, la décision prise ou fournir le lien vers la documentation/spec.)*


---

## 🔗 Liens & Références
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


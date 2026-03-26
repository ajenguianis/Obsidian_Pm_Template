<%*
const title = tp.file.title.replace(/\s+/g, "-").toLowerCase();
await tp.file.move("🗂️ Collections/" + title);

const now = new Date();
const pad = n => String(n).padStart(2, "0");
const ts  = `${now.getFullYear()}-${pad(now.getMonth()+1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
const project = await tp.system.prompt("Projet concerné");
-%>
---
tags:
  - decision
  - technical
decided_at: "<% ts %>"
decided_by: "Anis AJENGUI"
project: "<% project %>"
impact_level: "<% await tp.system.suggester(['🔴 Critique','🟠 Élevé','🟡 Moyen','🟢 Bas'], ['critical','high','medium','low']) %>"
related_request: ""
external_ticket_key: ""
external_ticket_url: ""
---

# 🪓 Décision — <% tp.file.title %>

> [!important] Décidé le `<% ts %>` par Anis AJENGUI | Projet : `<% project %>`

---

## Contexte
*(Pourquoi cette décision était nécessaire ?)*

## Décision retenue
*(Ce qui a été choisi)*

## Alternatives écartées
| Option | Raison du rejet |
|--------|----------------|
| | |

## Justification technique
*(Argumentaire solide, irréversible — utilisable face à un expert ou supérieur)*

## Impact
- Codebase :
- Tests :
- Performance :
- Sécurité :

## Lien demande client
[[<% tp.frontmatter.related_request %>]]

## 🎫 Ticket externe
| Champ | Valeur |
|-------|--------|
| Clé ticket | <% tp.frontmatter.external_ticket_key %> |
| URL | <% tp.frontmatter.external_ticket_url %> |
| Outil | Jira |
| Assigné à | |
| Date de transmission | |

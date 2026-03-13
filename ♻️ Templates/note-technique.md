<%*
const title = tp.file.title.replace(/\s+/g, "-").toLowerCase();
await tp.file.move("📑 Notes/" + title);

const now = new Date();
const pad = n => String(n).padStart(2, "0");
const ts  = `${now.getFullYear()}-${pad(now.getMonth()+1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`;
-%>
---
tags:
  - note
  - technical
created_at: "<% ts %>"
author: "Anis AJENGUI"
type: "<% await tp.system.suggester(['Architecture','Troubleshooting','How-To','RFC','Investigation'], ['architecture','troubleshooting','how-to','rfc','investigation']) %>"
related_request: ""
---

# 📝 <% tp.file.title %>

> `<% ts %>` — Anis AJENGUI

---

## Résumé
*(1-2 lignes : de quoi parle cette note ?)*

## Détails

```
// code / config / logs
```

## Conclusion / À retenir

## Liens
- Demande liée : [[<% tp.frontmatter.related_request %>]]

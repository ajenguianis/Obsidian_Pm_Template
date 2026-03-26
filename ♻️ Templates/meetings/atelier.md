<%*
const meeting_date = tp.date.now('YYYY-MM-DD');
const team_folder = app.vault.getAbstractFileByPath('👥 Team');
let team_members = [];
if (team_folder && team_folder.children) {
  team_members = team_folder.children
    .filter(f => f.extension === 'md')
    .map(f => f.basename);
}
const base_name = `atelier-${meeting_date}`;
await tp.file.rename(base_name);
-%>
---
tags: [meeting, atelier]
meeting_type: "atelier"
project: ""
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# 🧠 Atelier / Workshop — <% tp.file.title %>

## Objectifs de l'atelier
- 

## Participants
- 

## Ordre du jour
1. Introduction
2. Activités / Brainstorming
3. Synthèse
4. Actions / Décisions

## Activités / Brainstorming
- 

## Synthèse
- 

## Actions / Décisions
- [ ]

## Points à approfondir
-

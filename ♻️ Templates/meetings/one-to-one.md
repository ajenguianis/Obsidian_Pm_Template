<%*
const meeting_date = tp.date.now('YYYY-MM-DD');
const team_folder = app.vault.getAbstractFileByPath('👥 Team');
let team_members = [];
if (team_folder && team_folder.children) {
  team_members = team_folder.children
    .filter(f => f.extension === 'md')
    .map(f => f.basename);
}
const base_name = `one-to-one-${meeting_date}`;
await tp.file.rename(base_name);
-%>
---
tags: [meeting, one-to-one]
meeting_type: "one-to-one"
project: ""
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# 👤 One-to-One — <% tp.file.title %>

## Objectifs de la réunion
- 

## Participants
- 

## Ordre du jour
1. Suivi individuel
2. Points de satisfaction
3. Points de progrès
4. Questions / Décisions

## Points abordés
- 

## Actions à entreprendre
- [ ]

## Feedback / Questions ouvertes
- 

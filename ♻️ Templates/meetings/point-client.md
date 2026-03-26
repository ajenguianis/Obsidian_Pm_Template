---
tags: [meeting, point-client]
meeting_type: "point-client"
project: "" # Saisir ou choisir (suggestion : <% projects.join(', ') %>)
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# 🤝 Point Client — <% tp.file.title %>

## Objectifs de la réunion
- 

## Participants
- 

## Ordre du jour
1. Suivi des demandes
2. Feedback client
3. Prochaines étapes
4. Questions / Décisions

## Points discutés
- 

## Décisions
- 

## Actions à entreprendre
- [ ]

## Feedback / Questions ouvertes
- 

<%*
const meeting_date = tp.date.now('YYYY-MM-DD');
const projects_folder = app.vault.getAbstractFileByPath('📌 Projects');
let projects = [];
if (projects_folder && projects_folder.children) {
  projects = projects_folder.children
    .filter(f => f.extension === 'md')
    .map(f => f.basename);
}
const team_folder = app.vault.getAbstractFileByPath('👥 Team');
let team_members = [];
if (team_folder && team_folder.children) {
  team_members = team_folder.children
    .filter(f => f.extension === 'md')
    .map(f => f.basename);
}
const base_name = `point-client-${meeting_date}`;
await tp.file.rename(base_name);
-%>

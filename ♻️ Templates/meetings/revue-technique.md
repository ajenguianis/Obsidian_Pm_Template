---
tags: [meeting, revue-technique]
meeting_type: "revue-technique"
project: "" # Saisir ou choisir (suggestion : <% projects.join(', ') %>)
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# 🛠️ Revue Technique — <% tp.file.title %>

## Objectifs de la réunion
- 

## Participants
- 

## Ordre du jour
1. Présentation technique
2. Analyse des choix
3. Points de vigilance
4. Questions / Décisions

## Points techniques abordés
- 

## Décisions
- 

## Actions à entreprendre
- [ ]

## Points bloquants
- 

## Liens utiles
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
const base_name = `revue-technique-${meeting_date}`;
await tp.file.rename(base_name);
-%>

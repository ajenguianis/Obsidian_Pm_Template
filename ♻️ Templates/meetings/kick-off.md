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
const base_name = `kick-off-${meeting_date}`;
await tp.file.rename(base_name);
-%>
---
tags: [meeting, kick-off]
meeting_type: "kick-off"
project: "" # Saisir ou choisir (suggestion : <% projects.join(', ') %>)
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# 🚀 Kick-off Projet — <% tp.file.title %>

## Objectifs de la réunion
- 

## Participants
- 

## Ordre du jour
1. Présentation du contexte
2. Objectifs du projet
3. Rôles et responsabilités
4. Planning prévisionnel
5. Questions / Risques

## Décisions prises
- 

## Actions à suivre
- [ ]

## Points à clarifier
- 

## Liens utiles
- 

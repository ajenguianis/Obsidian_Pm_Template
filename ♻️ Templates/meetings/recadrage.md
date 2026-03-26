<%*
const meeting_date = tp.date.now('YYYY-MM-DD');
const team_folder = app.vault.getAbstractFileByPath('👥 Team');
let team_members = [];
if (team_folder && team_folder.children) {
  team_members = team_folder.children
    .filter(f => f.extension === 'md')
    .map(f => f.basename);
}
const base_name = `recadrage-${meeting_date}`;
await tp.file.rename(base_name);
-%>
---
tags: [meeting, recadrage]
meeting_type: "recadrage"
project: ""
date: "<% meeting_date %>"
participants: [] # Saisir ou choisir (suggestion : <% team_members.join(', ') %> ou ajouter un nom externe)
archive_path: ""
---

# ⚠️ Réunion de recadrage — <% tp.file.title %>

> **Documentation** :
> - Utiliser ce template pour toute réunion de recadrage (entretien disciplinaire, rappel à l'ordre, clarification d'attentes, etc.).
> - Garder une trace factuelle, factuelle et respectueuse.

## Contexte
- Motif du recadrage :
- Faits observés :
- Impact sur l'équipe/projet :

## Attentes et rappels
- Règles/processus rappelés :
- Attentes pour la suite :

## Échanges et réactions
- Points exprimés par le collaborateur :
- Questions/réponses :

## Plan d'action
- Actions à mettre en place :
- Suivi prévu (date, modalité) :

## Décisions
- Décision(s) prise(s) :

## Feedback post-recadrage
- (À remplir lors du suivi)

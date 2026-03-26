---
tags:
  - guide
---

# 📖 Guide d'Utilisation : Votre Espace de Gestion de Projet

Bienvenue ! Ce guide est conçu pour vous aider à prendre en main cet espace de travail Obsidian, même si vous n'y connaissez rien. L'objectif est simple : **tracer et organiser toutes les informations** relatives à vos projets, clients et communications d'équipe.

**Le principe d'or :** Une note = un événement. Que ce soit une demande client, une réunion ou une question interne, tout est tracé.

---

## 🚀 Démarrage Rapide : Les 3 Actions Essentielles

### 1. Capturer une Nouvelle Demande Client (Le plus courant)

C'est l'action que vous ferez le plus souvent. Un client vous demande quelque chose par email, téléphone ou en réunion ?

**Comment faire ?**
1.  Appuyez sur le raccourci `ALT + N`.
2.  Une fenêtre s'ouvre et vous pose des questions :
    *   **Quel client ?** (La liste de vos clients existants apparaît).
    *   **Quel projet ?** (La liste des projets liés à ce client s'affiche).
    *   **Description courte de la tâche ?** (Ex: "Relooking de la page d'accueil").
3.  Répondez à ces questions.
4.  **C'est tout !** Une nouvelle note est automatiquement créée, nommée (ex: `2026-03-13-acme-corp-website-relaunch-relooking-page-accueil.md`), et rangée dans le dossier `📥 Customer Demands/📁 Requests/`.

**Que faire ensuite ?**
Ouvrez la note et complétez les informations importantes dans la section du haut (le "frontmatter") :
*   `priority`: Est-ce urgent ?
*   `external_ticket_key`: Collez ici le numéro du ticket Jira ou de votre autre système (à renseigner aussi dans les décisions, projets, livrables si applicable).
*   `external_ticket_url` : Collez ici le lien direct vers le ticket externe (Jira, Azure DevOps, etc.).
*   Dans le corps de la note, collez le verbatim du client (l'email, vos notes, etc.).

### 2. Créer un Compte Rendu de Réunion

Vous sortez d'une réunion (client, partenaire, interne) et vous devez garder une trace.

**Comment faire ?**
1.  Utilisez le template `meeting-log` (via `ALT+E` si configuré, ou manuellement).
2.  Le système vous demande :
    *   **Type de réunion ?** (Client, Partenaire, Interne).
    *   **Sujet de la réunion ?**
    *   Si c'est une réunion client, il vous demandera de quel client et projet il s'agit.
3.  La note est créée et rangée automatiquement dans le dossier `📅 Meetings`.

**Que faire ensuite ?**
*   Listez les participants.
*   Remplissez les sections `Points discutés & Décisions` et `Actions à Entreprendre`. C'est votre plan d'action post-réunion.
*   Si des demandes précises ont été faites pendant la réunion, **créez une note de demande pour chacune** en utilisant `ALT + N` et mettez le lien dans le tableau `Demandes Client / Partenaire`.

### 3. Gérer une Demande Interne (Nouveau !)

Un membre de votre équipe a besoin d'une information, d'une clarification sur une tâche, ou d'un document ? Ce système permet de tracer ces demandes pour ne rien oublier.

**Comment faire ?**
1.  Utilisez le template `internal-request`.
2.  Le système vous demande :
    *   **Quel est le type de demande ?** (Clarification, Documentation, Spécification technique, Autre).
    *   **Qui est le demandeur ?** (La liste des membres de l'équipe apparaît).
    *   **À qui est-ce assigné ?** (Qui doit répondre à la demande).
    *   **Sujet de la demande ?**
3.  La note est créée et rangée dans `⚙️ Internal Requests`.

**Comment suivre ?**
Allez dans le tableau de bord `📊 Dashboard/internal-requests-log`. Vous y verrez un Kanban avec toutes les demandes internes, leur statut (Ouvert, En cours, Résolu) et à qui elles sont assignées.

---

## 🏛️ Structure des Dossiers : Où trouver quoi ?

*   `📥 Customer Demands/`: Le cœur du système. Toutes les demandes clients sont ici. **Vous n'avez quasiment jamais besoin d'y aller directement**, les tableaux de bord sont là pour ça.
*   `📅 Meetings/`: Tous vos comptes rendus de réunion, bien organisés.
*   `⚙️ Internal Requests/`: Toutes les demandes de votre équipe.
*   `👤 Clients/`: La liste de vos clients. Créez une fiche par client pour lier les projets et contacts.
*   `📌 Projects/`: La liste de vos projets. Un projet peut être lié à plusieurs demandes.
*   `📊 Dashboard/`: **Votre point d'entrée principal.** C'est ici que vous avez une vue d'ensemble de tout ce qui se passe.
    *   `index`: La page d'accueil.
    *   `requests-log`: Toutes les demandes clients.
    *   `internal-requests-log`: Toutes les demandes internes.
    *   `project-timeline.md` : chronologie de tous les éléments d’un projet (demandes, réunions, décisions, livrables…)
    *   `team-timeline.md` : chronologie de tous les éléments liés à un membre de l’équipe (one-to-one, recadrage, réunions, demandes internes…)

## 🤔 Foire Aux Questions

**Q: Pourquoi ne pas tout mettre dans Jira (ou autre) ?**
**R:** Ce système capture la "preuve" de la demande initiale (le "quand", "qui", "quoi") avant même qu'elle ne devienne une tâche technique. Il garde une trace de la communication, ce que les outils de ticketing font moins bien.

**Q: `ALT+N` ne fonctionne pas !**
**R:** Assurez-vous que le plugin "Templater" est bien activé et que le raccourci est correctement configuré dans les paramètres d'Obsidian (`Settings > Hotkeys`). Cherchez "Templater" et assignez `ALT+N` à la commande "Create new note from template".

**Q: Comment je sais ce que je dois faire aujourd'hui ?**
**R:** Commencez votre journée en regardant les tableaux de bord :
1.  `internal-requests-log`: Y a-t-il des demandes internes qui vous sont assignées ?
2.  `requests-log`: Quelles sont les demandes clients récentes ou prioritaires ?
3.  Votre `Daily Note` (note journalière) est un bon endroit pour lister vos 3 priorités de la journée.
# Obsidian PM System

Système Obsidian pour gérer et tracer :
- les demandes clients,
- les demandes internes,
- les comptes-rendus de réunion,
- la preuve de livraison,
- l’archivage long terme.

## Pourquoi ce système ?

Ce vault sert de **registre de preuve** :
- Obsidian capture le contexte (qui, quoi, quand, pourquoi),
- ton outil de ticketing (Jira, etc.) exécute la partie delivery.

---

## Vue rapide

- `♻️ Templates/` : templates Templater (création, frontmatter, auto-move)
- `📊 Dashboard/` : vues Dataview (suivi, relances, manquants)
- `📥 Customer Demands/📁 Requests/` : demandes clients actives
- `⚙️ Internal Requests/` : demandes internes actives
- `📅 Meetings/` : réunions actives
- `👤 Clients/` : fiches clients
- `📌 Projects/` : fiches projets
- `👥 Team/` : fiches membres
- `🗄️ Archive/` : historique structuré

Guide complet : [`📊 Dashboard/guide.md`](📊%20Dashboard/guide.md)

---

## Plugins utilisés

- **Templater** : prompts, génération de champs, renommage, déplacement, scripts
- **Dataview** : dashboards dynamiques
- *(optionnel)* **Buttons** : non requis actuellement

---

## Templates principaux

- `request-capture.md` : nouvelle demande client
- `internal-request.md` : nouvelle demande interne
- `meeting-log.md` : compte-rendu de réunion
- `client-log.md` : fiche client
- `project-log.md` : fiche projet
- `team-member.md` : fiche membre équipe
- `archive-note.md` : script d’archivage selon `archive_path`
- `meetings/kick-off.md` : réunion de lancement de projet
- `meetings/suivi-projet.md` : suivi projet (weekly, mensuel...)
- `meetings/revue-technique.md` : revue technique/architecture
- `meetings/point-client.md` : point client
- `meetings/retro.md` : rétrospective
- `meetings/one-to-one.md` : one-to-one manager/collaborateur
- `meetings/incident.md` : incident/crise
- `meetings/atelier.md` : atelier/workshop/brainstorming

---

## Raccourcis (recommandés)

- `ALT + N` : capture demande client (`request-capture`)
- `ALT + E` : réunion (`meeting-log`) si configuré
- Demande interne : lancer template `internal-request`

Configurer dans Obsidian : `Settings > Hotkeys`.

---

## Champs importants (frontmatter)

- `status` : état de la demande
- `next_followup_at` : prochaine relance
- `last_reminder_at` : dernière relance
- `is_blocked` : blocage oui/non
- `blocked_reason` : raison du blocage
- `archive_path` : destination d’archivage

---

## Archivage méthodique

Convention :

- `🗄️ Archive/YYYY/<project-slug>/requests`
- `🗄️ Archive/YYYY/<project-slug>/internal-requests`
- `🗄️ Archive/YYYY/<project-slug>/meetings`
- `🗄️ Archive/YYYY/clients/<client-slug>`
- `🗄️ Archive/YYYY/team`

Exemple :
- `🗄️ Archive/2026/acme-website-relaunch/requests`

### Archiver une note

1. Ouvrir la note
2. Vérifier `archive_path`
3. Lancer `Templater` avec `archive-note.md`
4. La note est déplacée automatiquement au bon endroit

---

## Anti-oubli (relances)

Les dashboards remontent les notes à relancer si :
- `next_followup_at` est atteint/dépassé
- ou `is_blocked = true`
- ou pas de relance depuis 7 jours

Pages utiles :
- `📊 Dashboard/requests-missing-proof.md`
- `📊 Dashboard/internal-requests-log.md`

---

## Git : public + privé

### Repo public (structure)

Publier :
- `♻️ Templates/`
- `📊 Dashboard/`
- `🤖 Scripts/`
- `README.md`

Ne pas publier :
- `👤 Clients/`
- `📌 Projects/` (si sensibles)
- `📥 Customer Demands/`
- `⚙️ Internal Requests/`
- `🗄️ Archive/`
- `🗒️ Daily/`

### Repo privé (notes)

Conserver toutes les notes opérationnelles, données clients et archives.

---

## Démarrage rapide (nouvel utilisateur)

1. Créer un client (`client-log`)
2. Créer un projet (`project-log`)
3. Capturer une demande (`ALT + N`)
4. Suivre via dashboards
5. Relancer via champs follow-up
6. Archiver avec `archive-note.md` une fois clôturé
---

## 🗄️ Archivage méthodique (retrouver une info dans 10 ans)

L'archivage est organisé par **année → projet → type**. Exemple :

```
🗄️ Archive/
├── 2023/
│   └── acme-website-relaunch/
│       ├── requests/
│       ├── internal-requests/
│       └── meetings/
├── 2024/
│   └── orange-platform/
│       ├── requests/
│       └── meetings/
└── 2026/
    └── acme-website-relaunch/
        ├── requests/
        └── internal-requests/
```

### Comment archiver une note ?

1. La demande est **clôturée** : `status = 4-validated` ou `status = 3-resolved`.
2. Vérifier le champ `archive_path` dans le frontmatter de la note (ex: `🗄️ Archive/2026/acme-website-relaunch/requests`).
3. Dans Obsidian : **clic droit sur la note → Move file to...** → coller le chemin `archive_path`.
4. Si le dossier n'existe pas encore, Obsidian le crée automatiquement.

### Règle de nommage archive_path
| Champ | Valeur |
|-------|--------|
| `archive_path` | `🗄️ Archive/YYYY/projet-slug/type` |
| Exemple | `🗄️ Archive/2026/acme-website-relaunch/requests` |

> Ces champs sont **auto-remplis** à la création de la note via le template.

---

## 🔔 Système anti-oubli (style notifications)

Chaque demande (client et interne) contient 4 champs de suivi :

| Champ | Rôle |
|-------|------|
| `next_followup_at` | Date de la prochaine relance planifiée |
| `last_reminder_at` | Date de la dernière relance effectuée |
| `is_blocked` | `true` si la demande est bloquée |
| `blocked_reason` | Raison du blocage |

### Comment ça remonte dans les dashboards ?

Une demande apparaît dans la section **🔔 À relancer** si :
- La date `next_followup_at` est aujourd'hui ou dépassée.
- Ou `is_blocked = true`.
- Ou aucune relance depuis **+7 jours** (`last_reminder_at` vide ou > 7 jours).

### Routine quotidienne (5 min)

1. Ouvrir **[[requests-missing-proof]]** → section `🔔 À relancer` → relancer le client.
2. Ouvrir **[[internal-requests-log]]** → section `🔔 À relancer` → relancer le collègue.
3. Après chaque relance effectuée :
   - Mettre à jour `last_reminder_at` avec la date du jour.
   - Planifier `next_followup_at` (ex: dans 3 jours).
4. Si demande bloquée : passer `is_blocked: true` et remplir `blocked_reason`.

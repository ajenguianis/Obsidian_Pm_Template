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


Publier aussi les **dossiers uniquement** (sans contenu réel) :
- `👤 Clients/`
- `📌 Projects/` (si sensibles)
- `📥 Customer Demands/`
- `⚙️ Internal Requests/`
- `🗄️ Archive/`
- `🗒️ Daily/`

> Bonne pratique : ajouter un fichier `.gitkeep` dans chaque dossier pour conserver la structure dans Git sans exposer les notes.

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

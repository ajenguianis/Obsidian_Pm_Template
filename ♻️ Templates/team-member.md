<%*
const now = new Date();
const pad = (n) => String(n).padStart(2, "0");
const today = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
const slug = (str) => str ? str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '') : '';

const member_name = await tp.system.prompt("Nom du membre de l'équipe ?");
const archive_path = `🗄️ Archive/${now.getFullYear()}/team`;

await tp.file.rename(member_name || "new-member");
await tp.file.move("👥 Team/" + (member_name || "new-member"));
-%>
---
tags: [team, handler]
role: ""
status: "active"
feedbacks:
  - date: 2026-03-01
    type: "positif"
    auteur: "Manager"
    contenu: "Très bonne gestion du dernier sprint, esprit d'équipe remarquable."
  - date: 2026-03-15
    type: "amélioration"
    auteur: "Manager"
    contenu: "Attention à la documentation technique, à renforcer."
objectifs:
  - type: "OKR"
    titre: "Livrer la V1 du projet X"
    statut: "en cours"
    echeance: "2026-04-30"
  - type: "Formation"
    titre: "Formation React avancé"
    statut: "prévu"
    echeance: "2026-05-15"
hard_skills: [Javascript, React, Node.js]
soft_skills: [Communication, Esprit d'équipe, Proactivité]
certifications: [Scrum Master, React Pro]
souhaits_evolution: [Lead Dev, Formation DevOps]
---

# 👤 {{nom}}

> **Documentation** :
> - **feedbacks** : Liste structurée des feedbacks réguliers (date, type, auteur, contenu).
> - **objectifs** : Objectifs individuels (OKR, plans de progrès, formations suivies).
> - **hard_skills / soft_skills** : Compétences techniques et comportementales.
> - **certifications** : Diplômes, certifications obtenues.
> - **souhaits_evolution** : Souhaits d’évolution professionnelle.

## Feedbacks réguliers
| Date       | Type        | Auteur   | Feedback |
|------------|-------------|----------|----------|
| 2026-03-01 | Positif     | Manager  | Très bonne gestion du dernier sprint, esprit d'équipe remarquable. |
| 2026-03-15 | Amélioration| Manager  | Attention à la documentation technique, à renforcer. |

## Objectifs individuels (OKR, plans de progrès, formations)
- **OKR** : Livrer la V1 du projet X (en cours, échéance 2026-04-30)
- **Formation** : React avancé (prévu, échéance 2026-05-15)

## Historique management
- 2026-03-10 : One-to-one (voir [[2026-03-10-one-to-one-{{nom}}]])
- 2026-03-20 : Recadrage (voir [[2026-03-20-recadrage-{{nom}}]])
- 2026-03-25 : Félicitation (Sprint réussi)

## Compétences
- **Hard skills** : Javascript, React, Node.js
- **Soft skills** : Communication, Esprit d'équipe, Proactivité
- **Certifications** : Scrum Master, React Pro
- **Souhaits d’évolution** : Lead Dev, Formation DevOps

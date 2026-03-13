<%*
// ─── Script d'archivage automatique ──────────────────────────────────────────
// Lit le champ archive_path de la note courante et déplace la note

const currentFile = app.workspace.getActiveFile();
if (!currentFile) {
  new Notice("❌ Aucun fichier actif trouvé.");
  return;
}

const cache = app.metadataCache.getFileCache(currentFile);
const frontmatter = cache?.frontmatter;

if (!frontmatter) {
  new Notice("❌ Impossible de lire le frontmatter.");
  return;
}

const archive_path = frontmatter.archive_path;

if (!archive_path) {
  new Notice("❌ Champ 'archive_path' manquant dans le frontmatter.");
  return;
}

// Créer les dossiers intermédiaires si nécessaire
const parts = archive_path.split("/");
let current = "";
for (const part of parts) {
  if (!part) continue;
  current = current ? `${current}/${part}` : part;
  try {
    const folder = await app.vault.getAbstractFileByPath(current);
    if (!folder) {
      await app.vault.createFolder(current);
    }
  } catch (e) {
    // Le dossier existe déjà ou erreur non critique
  }
}

// Déplacer la note vers le chemin final
const new_path = `${archive_path}/${currentFile.name}`;
try {
  await app.vault.rename(currentFile, new_path);
  new Notice(`✅ Note archivée avec succès dans :\n${archive_path}`);
} catch (e) {
  new Notice(`❌ Erreur lors de l'archivage :\n${e.message}`);
}
-%>

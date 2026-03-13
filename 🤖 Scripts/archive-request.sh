#!/bin/bash

# Archive a request note into 🗄️ Archive
# Usage: ./archive-request.sh <FILE_PATH>
#
# What it does:
#   1. Adds tag "archived" to the note's frontmatter
#   2. Stamps archived_at with current datetime
#   3. Moves the file to 🗄️ Archive/
#   4. Opens it in Obsidian

VAULT_NAME="Obsidian"
ARCHIVE_FOLDER="🗄️ Archive"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <FILE_PATH>"
    exit 1
fi

FILE_PATH="$1"

if [ ! -f "$FILE_PATH" ]; then
    echo "Error: File '$FILE_PATH' not found!"
    exit 1
fi

# Check it is a request note
if ! grep -q "tags:" "$FILE_PATH"; then
    echo "Error: No frontmatter found in '$FILE_PATH'"
    exit 1
fi

ARCHIVED_AT=$(date '+%Y-%m-%d %H:%M:%S')

# Inject archived_at field after the last frontmatter field (before closing ---)
sed -i '' "0,/^---/{/^---$/!b};/^---$/{n;s/^/archived_at: \"$ARCHIVED_AT\"\n/}" "$FILE_PATH" 2>/dev/null \
  || sed -i "0,/^---/{/^---$/!b};/^---$/{n;s/^/archived_at: \"$ARCHIVED_AT\"\n/}" "$FILE_PATH"

# Add archived tag
sed -i '' "s/tags:/tags:\n  - archived/" "$FILE_PATH" 2>/dev/null \
  || sed -i "s/tags:/tags:\n  - archived/" "$FILE_PATH"

# Move to archive folder
DEST="$ARCHIVE_FOLDER/$(basename "$FILE_PATH")"
mv "$FILE_PATH" "$DEST"

echo "✅ Archived: '$FILE_PATH' → '$DEST' at $ARCHIVED_AT"

# Open in Obsidian
ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$DEST'''))")
open "obsidian://open?vault=${VAULT_NAME}&file=${ENCODED}"

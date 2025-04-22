# Patch gitconfig
cat gitconfig >> ~/.gitconfig

# Backup and install aliases
ALIAS_DIR="$HOME/.config/gitconfig/aliases"
ALIAS_BACKUP="$HOME/.config/gitconfig_backup_$(date +%Y%m%d_%H%M%S).zip"

if [ -d "$ALIAS_DIR" ] && [ "$(ls -A "$ALIAS_DIR")" ]; then
  echo "Backing up existing aliases to $ALIAS_BACKUP"
  zip -r "$ALIAS_BACKUP" "$ALIAS_DIR"
  rm -rf "$ALIAS_DIR"
fi

mkdir -p "$ALIAS_DIR"
cp -r aliases/* "$ALIAS_DIR"

# Test
git alias

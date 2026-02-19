# SSH agent persistence via keychain (Linux)
# On macOS, UseKeychain in ~/.ssh/config handles this natively.
# On Linux, keychain starts/reuses ssh-agent across sessions,
# requiring the passphrase only once per boot.
if command -v keychain >/dev/null 2>&1; then
    eval "$(keychain --eval --quiet ~/.ssh/id_ecdsa_cm)"
fi

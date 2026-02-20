# dotfiles

Personal [chezmoi](https://www.chezmoi.io/) dotfiles repository managing zsh shell configuration across macOS and Linux machines.

## Quick Start

### Home machine

```bash
chezmoi init --apply github.com/mborysow/dotfiles
```

You'll be prompted for:
- **Does this machine have internet access?** — `true`
- **Is this a work machine?** — `false`
- **Age key passphrase** — to decrypt the encryption key

### Work machine

See [dotfiles-work](https://gitlab.com/mborysow1/dotfiles-work) for the work bootstrap flow.

## What's Managed

- **Shell config** — `~/.zshrc`, `~/.zshrc.include` (templated, OS-conditional), `~/.fzf.zsh`, `~/.p10k.zsh`
- **Git config** — `~/.gitconfig` (templated for work/home email)
- **Editor** — kickstart.nvim (downloaded and patched via run script)
- **Terminal** — kitty, zellij configs
- **Shell history** — atuin config and encrypted key
- **SSH** — encrypted private key
- **External tools** — oh-my-zsh + 10 plugins/themes as `git-repo` externals
- **Install helpers** — `~/.local/bin/dot-install-*.sh` dispatchers and `~/.local/bin/helpers/` scripts for tool installation

## External Dependencies

All managed via `.chezmoiexternal.toml.tmpl` as `type = "git-repo"` with shallow clones:

| Tool | Source |
|---|---|
| oh-my-zsh | ohmyzsh/ohmyzsh |
| fast-syntax-highlighting | zdharma-continuum/fast-syntax-highlighting |
| fzf | junegunn/fzf |
| fzf-zsh-plugin | unixorn/fzf-zsh-plugin |
| you-should-use | MichaelAquilina/zsh-you-should-use |
| zsh-autocomplete | marlonrichert/zsh-autocomplete |
| zsh-autosuggestions | zsh-users/zsh-autosuggestions |
| zsh-bat | fdellwing/zsh-bat |
| zsh-completions | zsh-users/zsh-completions |
| zsh-syntax-highlighting | zsh-users/zsh-syntax-highlighting |
| powerlevel10k (v1.15.0) | romkatv/powerlevel10k |

On work machines, these pull from GitLab mirrors instead of GitHub.

## Drop-in Directory

`~/.zshrc.include.d/*.zsh` files are sourced automatically. Numbering convention:
- `00-49` — reserved for this repo
- `50-99` — reserved for work repo

## Config Variables

| Variable | Type | When | Purpose |
|---|---|---|---|
| `has_internet` | bool | Always | Controls tool auto-install scripts |
| `is_work` | bool | Always | Toggles work-specific behavior |
| `git_mirror_base` | string | Work only | GitLab mirror base URL |
| `git_mirror_namespace` | string | Work only | Mirror namespace |
| `work_repo_url` | string | Work only | Work dotfiles repo URL |

## Day-to-Day

```bash
chezmoi update          # Pull and apply latest
chezmoi edit ~/.zshrc.include  # Edit shell config
chezmoi diff            # Preview pending changes
chezmoi apply -n        # Dry run
```

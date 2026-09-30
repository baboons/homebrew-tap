# homebrew-tap

Homebrew tap for Baboons tools.

## Casks

### [Zorro](https://github.com/baboons/zorro) — native macOS Git merge-conflict resolver

```bash
brew install --cask baboons/tap/zorro
brew upgrade --cask zorro
```

### [CmdTab](https://github.com/baboons/cmdtab) — ⌘Tab replacement with window previews and type-to-search

```bash
brew install --cask baboons/tap/cmdtab
```

CmdTab updates itself, so `brew upgrade` skips it unless you pass `--greedy`.

## Formulae

### [ssh-to-age](https://github.com/Mic92/ssh-to-age) — convert SSH Ed25519 keys to age keys

```bash
brew install baboons/tap/ssh-to-age
```

## Usage

Convert an SSH public key to an age recipient:

```bash
ssh-to-age < ~/.ssh/id_ed25519.pub
```

Convert an SSH private key to an age identity:

```bash
ssh-to-age -private-key < ~/.ssh/id_ed25519
```

## Updating

```bash
brew update
brew upgrade ssh-to-age
```

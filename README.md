# homebrew-tap

Homebrew tap for [ssh-to-age](https://github.com/Mic92/ssh-to-age) — a tool to convert SSH Ed25519 keys to age keys.

## Installation

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

# Crush Guide

## Build / Lint / Test
- **Build**: `nix build` (if using Nix)
- **Lint**: `stylua --check lua/**` and `luacheck lua/**`
- **Test**: `busted -c tests/`  *(runs all tests)*
- **Single test**: `busted -c tests/<file>.lua:<line>`

## Code Style
- Use Lua 5.1 syntax compatible with Neovim.
- Imports via `require("module")`; modules are under `lua/`.
- Follow `.stylua.toml` formatting rules.
- Variable names: camelCase; functions: lowerCamel.
- Return errors as tables `{ err = "msg" }` or use `vim.notify` for diagnostics.
- No global variables unless documented in `defaults.lua`.

## Cursor & Copilot
- See `.cursor/rules/` and `.github/copilot-instructions.md` for cursor settings.
- Include any new rules here.

---
All commands are available via the `CRUSH.md` for future agents. 
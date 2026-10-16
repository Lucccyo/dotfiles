# Config Neovim

## Prérequis
- `Neovim >= 0.11` pour lspconfig natif
- `nodejs`, `npm` pour pyright

## Test dans un Docker Archlinux
Docker compose qui intégre le dossier `/workspace` contenant les fichiers de demo pour tester la configuration sur les langages installés.
```bash
docker build -t nvim-arch .
docker compose run --rm nvim
```

## Vraie installation
```bash
./install.sh
nvim
```

## Pour ajouter un nouveau langage (mode facile si c'est sur Mason)
Attention, si des choses ont besoin d'être installées en plus, il faut les installer dans le Dockerfile ainsi que les noter quelque part, notamment dans la partie prérequis du README.md.

1. Ajouter le nom lspconfig du serveur dans `ensure_installed` dans `nvim/lua/plugins/lsp.lua`. Pour être certain de ce qu'on ajoute, il faut ouvrir `:Mason` et chercher le langage voulu.
Attention, il faut ajouter le nom du pacquet, donc par exemple pour lua, il faut prendre `lua_ls` et non `lua-language-server`.
Si besoin, on peut ajouter des réglages pour le serveur.
```lua
vim.lsp.config("pyright", {
  settings = { python = { analysis = { typeCheckingMode = "basic" } } },
})
```

2. Ajouter le nom du parser dans la liste des langages du fichier `nvim/lua/plugins/treesitter.lua` pour avoir la coloration syntaxique.
Pour avoir la liste des parsers disponible, on fait
`:lua =require("nvim-treesitter").get_available()` (pas terrible, mais au moins c'est trié par ordre alphabetique).

3. Normalement, le formatter est obtenu directement via LSP.

4. Ajouter un fichier de test pour verifier que le LSP réponds correctement, en le testant dans le conteneur.

5. Editer le README.md pour tenir à jours les langages supportés.



## Ce qui est supporté

### Plugins installés

### Langages supportés
- lua (lua_ls)
- python (pyright)
- c (clangd)
- cpp (clangd)
- cmake (neocmake)
- makefile (NO LSP)
- markdown (marksman)
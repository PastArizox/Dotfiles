" ===========================================
"             PARAMÈTRES GÉNÉRAUX
" ===========================================

" Activer la compatibilité minimale pour éviter des comportements imprévus
set nocompatible

" Activer la détection automatique du type de fichier pour des paramètres spécifiques
filetype plugin indent on

" Toujours afficher la barre de statut
set laststatus=2

" Afficher des informations complètes dans la barre de statut
set statusline=%F%m%r%h%w\ [FORMAT=%Y]\ [EOL=%{&ff}]\ [ENC=%{&encoding}]\ [POS=%l,%v][%p%%]\ %{strftime(\"%H:%M\")}

" Activer le surlignement de la ligne courante
set cursorline

" Activer le surlignement de la colonne courante (peut être distrayant pour certains)
" set cursorcolumn

" Utiliser la coloration syntaxique
syntax enable

" Activer le support de la souris (utile pour copier/coller, redimensionner les fenêtres)
set mouse=a

" Utiliser la recherche incrémentale
set incsearch

" Surligner tous les résultats de la recherche
set hlsearch

" Ignorer la casse lors de la recherche (sauf si une majuscule est utilisée)
set ignorecase
set smartcase

" Ne pas wraper les lignes longues (préférable pour le code)
set nowrap

" Activer l'historique étendu pour les commandes et les recherches
set history=1000

" Utiliser le tampon de presse-papiers du système
set clipboard=unnamedplus

" Ne pas créer de fichiers de swap (.swp) pour éviter les problèmes de synchronisation dans certains setups
" (Attention: désactiver le swap rend la récupération de fichier après un crash plus difficile)
" set noswapfile

" Ne pas créer de fichiers de backup (.bak)
set nobackup

" Définir le dossier de cache pour les fichiers de swap, d'undo, etc.
" remplacez par un chemin existant, par exemple ~/.cache/vim/
" set undodir=~/.cache/vim/undo
" set backupdir=~/.cache/vim/backup
" set directory=~/.cache/vim/swap

" Activer l'auto-lecture des fichiers modifiés à l'extérieur de Vim
set autoread

" Afficher les parenthèses correspondantes
set showmatch

" Complétion automatique des mots avec la touche Tab
" set wildmode=list:longest,full

" Complétion automatique du chemin des fichiers quand on tape un chemin
set wildmenu

" Toujours afficher la barre de commande (même si elle est vide)
set cmdheight=1

" ===========================================
"             NUMÉROS DE LIGNE
" ===========================================

" Afficher les numéros de ligne absolus
set number

" Afficher les numéros de ligne relatifs
" C'est excellent pour la navigation avec les commandes de mouvement (par ex. 5j pour descendre de 5 lignes)
set relativenumber

" ===========================================
"             INDENTATION
" ===========================================

" Utiliser des espaces au lieu de tabulations (fortement recommandé pour la cohérence du code)
set expandtab

" Nombre d'espaces qu'une tabulation représente (pour l'affichage)
set tabstop=4

" Nombre d'espaces à insérer pour une indentation ou une dé-indentation
set shiftwidth=4

" Détecter l'indentation du fichier si elle existe
set autoindent

" Indentation intelligente pour le code (reconnaît les blocs de code et les structures)
set smartindent

" (Optionnel) Indentation spécifique au langage de programmation (souvent inclus avec filetype indent on)
" set cindent " Pour les langages de type C

" Afficher les caractères invisibles (espaces à la fin de ligne, tabulations)
" set list
" set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,space:·

" Supprimer les espaces en trop à la fin des lignes au moment de la sauvegarde
autocmd BufWritePre * %s/\s\+$//e

" ===========================================
"             NAVIGATION ET RECHERCHE
" ===========================================

" Déplacement du curseur pour qu'il ne soit jamais tout en haut ou tout en bas de l'écran
set scrolloff=8

" ===========================================
"             PERFORMANCE (pour les gros fichiers)
" ===========================================

" Limiter les mises à jour de l'écran (peut aider sur de très gros fichiers)
" set lazyredraw

" ===========================================
"             PLUGINS (Exemple avec Pathogen)
" ===========================================

" Si vous utilisez un gestionnaire de plugins comme Pathogen, Vim-Plug, ou Vundle,
" leur configuration va ici. Voici un exemple avec Pathogen :
" execute pathogen#infect()
" syntax enable
" filetype plugin indent on

" ===========================================
"             Raccourcis Clavier (Exemples)
" ===========================================

" Mapper <Space> comme touche leader (très courant et pratique)
" Remplacez <Space> par n'importe quelle touche non utilisée, par ex. virgule `,`
let mapleader = " "

" Recharger le fichier .vimrc rapidement
map <leader>rc :source $MYVIMRC<CR>

" Basculer entre les numéros de ligne absolus/relatifs
nnoremap <leader>n :set invnumber<CR>:set invrelativenumber<CR>

" Basculer l'affichage des caractères invisibles (listchars)
" nnoremap <leader>l :set invlist<CR>

" Basculer le surlignement de la recherche
nnoremap <leader>h :set invhlsearch<CR>

" Naviguer entre les buffers ouverts (si vous utilisez des buffers)
" nnoremap <leader>b :ls<CR>:buffer<Space>


" Copier vers le presse-papiers Wayland (Ctrl+C / "+)
" Pour le mode visuel (sélection)
xnoremap <silent> "+y :<C-u>call system('wl-copy', @")<CR>
" Pour le mode normal (ex: yy, dw)
nnoremap <silent> "+y :<C-u>call system('wl-copy', @")<CR>

" Coller depuis le presse-papiers Wayland (Ctrl+V / "+)
" Pour le mode normal
nnoremap <silent> "+p :<C-u>put =system('wl-paste')<CR>
nnoremap <silent> "+P :<C-u>put! =system('wl-paste')<CR>

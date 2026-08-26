local o = vim.opt

-- ui
o.number = true -- show line numbers
o.relativenumber = true -- show relative line numbers
o.termguicolors = true -- enable 24-bit true colors
o.signcolumn = "yes" -- always show sign column
o.cursorline = true -- highlight current line
o.cmdheight = 2 -- height of command line
o.colorcolumn = "80,100,120" -- vertical guide lines at 80/100/120 chars
o.list = true -- show invisible characters
o.listchars = {
  tab = "»·", -- tabs
  lead = "·", -- leading spaces
  trail = "·", -- trailing spaces
  -- eol = "↴", -- end-of-line marker
  nbsp = "␣", -- non-breaking spaces
}
o.winborder = "rounded"

-- input
o.mouse = "a" -- enable mouse support
o.clipboard = "unnamedplus" -- use system clipboard
o.backspace = { "indent", "eol", "start" } -- backspace behavior in insert mode

-- indent
o.tabstop = 2 -- tab width
o.shiftwidth = 2 -- indent width
o.expandtab = true -- use spaces
o.smartindent = true -- auto indent

-- text
o.wrap = false -- no line wrap
o.scrolloff = 10 -- keep lines around cursor
o.sidescrolloff = 10 -- keep lines around cursor
o.encoding = "UTF-8" -- file/text encoding

-- search
o.ignorecase = true -- case-insensitive search
o.smartcase = true -- case-sensitive with uppercase

-- splits
o.splitright = true -- vertical split to right
o.splitbelow = true -- horizontal split below

-- timing
o.updatetime = 100 -- faster updates
o.timeoutlen = 300 -- key timeout

-- files
o.swapfile = false -- no swap files
o.backup = false -- no backup files
o.autoread = true -- auto reload files changed outside Neovim

-- persistent undo
local undodir = vim.fn.stdpath("data") .. "/undodir"

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p") -- create the directory if missing
end
o.undodir = undodir -- location for undo history files
o.undofile = true -- save undo history

-- completion
o.completeopt = "menu,menuone,noselect,popup" -- completion menu

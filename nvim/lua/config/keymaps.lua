local function map(mode, lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", {
    silent = true,
    desc = desc,
  }, opts or {})

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", "New tab")
map("n", "<leader>tc", "<cmd>tabclose<cr>", "Close tab")
map("n", "<leader>to", "<cmd>tabonly<cr>", "Close other tabs")
map("n", "<Tab>", "<cmd>tabnext<cr>", "Next tab")
map("n", "<S-Tab>", "<cmd>tabprevious<cr>", "Previous tab")

-- exit / clear
map("i", "jk", "<Esc>", "Exit insert mode")
map("n", ";", ":", "Enter command mode")
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search")

-- save / quit / select
map("n", "<leader>w", "<cmd>w<cr>", "Save file")
map("n", "<leader>q", "<cmd>q<cr>", "Quit")
map("n", "<C-s>", "<cmd>w<cr>", "Save file")
map("i", "<C-s>", "<cmd>w<cr><Esc>", "Save file")
map("n", "<C-a>", "ggVG", "Select all")

-- move lines
map("n", "<A-j>", ":m .+1<cr>==", "Move line down")
map("n", "<A-k>", ":m .-2<cr>==", "Move line up")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move selection up")

-- indent
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- paste
map("x", "p", "P", "Paste without yanking")

-- preserve register
map({ "n", "x" }, "c", '"_c', "Change without yanking")
map({ "n", "x" }, "C", '"_C', "Change line without yanking")

-- centered navigation
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")
map("n", "n", "nzzzv", "Next search result")
map("n", "N", "Nzzzv", "Previous search result")

-- folds
map("n", "z<Space>", "za", "Toggle fold")

-- mouse scrolling
map({ "n", "v", "i" }, "<ScrollWheelUp>", "<C-y>", "Scroll up")
map({ "n", "v", "i" }, "<ScrollWheelDown>", "<C-e>", "Scroll down")
map({ "n", "v", "i" }, "<S-ScrollWheelLeft>", "zh", "Scroll left")
map({ "n", "v", "i" }, "<S-ScrollWheelRight>", "zl", "Scroll right")

-- diagnostics
map("n", "gl", vim.diagnostic.open_float, "Show diagnostic")
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, "Previous diagnostic")

map("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, "Next diagnostic")

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

opts = { noremap = true, silent = true }


-- Move current line up/down in normal mode
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = "Move line down", silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = "Move line up", silent = true })

-- Move selected block up/down in visual mode
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move block down", silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move block up", silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- For conciseness local opts = { noremap = true, silent = false }

vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", opts)

-- save file
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR>", opts)

-- save file without formatting

vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

--vim.keymap.set('n', 'd', '"_d', opts)

--vim.keymap.set('n', 'c', '"_c', opts)

vim.keymap.set("v", "p", '"_dP', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "[W]indow Split [V]ertical", noremap = true, silent = true }) -- split window vertically
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "[W]indow Split [H]orizontal", noremap = true, silent = true }) -- split window horizontally
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "[W]indow Split [E]qual", noremap = true, silent = true }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wc", ":close<CR>", { desc = "[W]indow Split [C]orizontal", noremap = true, silent = true }) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen", noremap = true, silent = true }) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "[T]ab [C]lose", noremap = true, silent = true }) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext", noremap = true, silent = true }) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious", noremap = true, silent = true }) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set(
	"n",
	"<leader>lw",
	"<cmd>set wrap!<CR>",
	{ desc = "[L]ine [W]rap toggle", noremap = true, silent = true }
)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
--vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

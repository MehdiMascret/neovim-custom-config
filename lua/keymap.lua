vim.g.mapleader = " "

-- Neotree
vim.keymap.set('n', '<C-n>', ':Neotree<CR>', {})
vim.keymap.set('n', '<leader>n', ':Neotree<CR>', {}) 

-- Windows
for _, dir in ipairs({ "Up", "Down", "Left", "Right" }) do
  vim.keymap.set("n", "<C-" .. dir .. ">", "<C-w><" .. dir .. ">", { silent = true })
end

local function make_resize(key_1, key_2, type_resize, delta_1, delta_2)
  return function()
    v = vim.fn.winnr()
    if vim.fn.winnr(key_1) == v and vim.fn.winnr(key_2) ~= v then
      vim.cmd(type_resize .. delta_1)
    else
      vim.cmd(type_resize .. delta_2)
    end
  end
end

local resize_with_maj_horizontal_up = make_resize("j", "k", "resize ", "+5", "-5")
local resize_with_maj_horizontal_down = make_resize("j", "k", "resize ", "-5", "+5")
local resize_with_maj_vertical_left = make_resize("l", "h", "vertical resize ", "+5", "-5")
local resize_with_maj_vertical_right = make_resize("l", "h", "vertical resize ", "-5", "+5")

vim.keymap.set("n", "<S-A-Up>", resize_with_maj_horizontal_up, { silent = true })
vim.keymap.set("n", "<S-A-Left>", resize_with_maj_vertical_left, { silent = true })
vim.keymap.set("n", "<S-A-Down>", resize_with_maj_horizontal_down, { silent = true })
vim.keymap.set("n", "<S-A-Right>", resize_with_maj_vertical_right, { silent = true })

local resize_horizontal_up = make_resize("j", "k", "resize ", "+1", "-1")
local resize_horizontal_down = make_resize("j", "k", "resize ", "-1", "+1")
local resize_vertical_left = make_resize("l", "h", "vertical resize ", "+1", "-1")
local resize_vertical_right = make_resize("l", "h", "vertical resize ", "-1", "+1")

vim.keymap.set("n", "<A-Up>", resize_horizontal_up, { silent = true })
vim.keymap.set("n", "<A-Left>", resize_vertical_left, { silent = true })
vim.keymap.set("n", "<A-Down>", resize_horizontal_down, { silent = true })
vim.keymap.set("n", "<A-Right>", resize_vertical_right, { silent = true })

-- Désindenter
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { silent = true })

-- Indenter + insert
vim.keymap.set("n", "<Tab>", ">>I", { silent = true })

vim.g.mapleader = " "

for _, dir in ipairs({ "Up", "Down", "Left", "Right" }) do
  vim.keymap.set("n", "<C-" .. dir .. ">", "<C-w><" .. dir .. ">", { silent = true })
end

local function make_resize(key, type_resize, delta_1, delta_2)
  return function()
    if vim.fn.winnr(key) == vim.fn.winnr() then
      vim.cmd(type_resize .. delta_1)
    else
      vim.cmd(type_resize .. delta_2)
    end
  end
end

local resize_horizontal_up = make_resize("j", "resize ", "+1", "-1")
local resize_horizontal_down = make_resize("j", "resize ", "-1", "+1")
local resize_vertical_left = make_resize("l", "vertical resize ", "+1", "-1")
local resize_vertical_right = make_resize("l", "vertical resize ", "-1", "+1")

vim.keymap.set("n", "<A-Up>", resize_horizontal_up, { silent = true })
vim.keymap.set("n", "<A-Left>", resize_vertical_left, { silent = true })
vim.keymap.set("n", "<A-Down>", resize_horizontal_down, { silent = true })
vim.keymap.set("n", "<A-Right>", resize_vertical_right, { silent = true })


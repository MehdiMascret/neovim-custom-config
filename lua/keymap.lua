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
    -- Ne fait rien si je suis seul
    if vim.fn.winnr(key_2) == vim.fn.winnr(key_1) then
      return
    end

    if vim.fn.winnr(key_1) == vim.fn.winnr() then
      vim.cmd(string.format("%s%+d", type_resize, delta_1))
    else
      vim.cmd(string.format("%s%+d", type_resize, delta_2))
    end
  end
end

for _, m in ipairs({
  { dir="Up",    key1="j", key2="k", prefix="",          d1= 1, d2=-1 },
  { dir="Down",  key1="j", key2="k", prefix="",          d1=-1, d2= 1 },
  { dir="Left",  key1="l", key2="h", prefix="vertical ", d1= 1, d2=-1 },
  { dir="Right", key1="l", key2="h", prefix="vertical ", d1=-1, d2= 1 },
}) do
  vim.keymap.set("n", "<A-"..m.dir..">", make_resize(m.key1, m.key2, m.prefix.."resize ", m.d1, m.d2), { silent=true })
  vim.keymap.set("n", "<S-A-"..m.dir..">", make_resize(m.key1, m.key2, m.prefix.."resize ", 5*m.d1, 5*m.d2), { silent=true })
end

-- Désindenter
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { silent = true })

-- Indenter + insert
vim.keymap.set("n", "<Tab>", ">>I", { silent = true })

-- Aller à une autre ligne si position (END + Right) ou (HOME + Left)
local function make_change_line(condition, action, other_action)
  return function()
    if condition() then
      return other_action
    end
    return action
  end
end

for _, m in ipairs({
  { 
    modes = "i", 
    condition = function () return vim.api.nvim_win_get_cursor(0)[2] >= #vim.api.nvim_get_current_line() end, 
    action = "<Right>", other_action = "<Home><Down>"
  },
  { 
    modes = { "i", "n" }, 
    condition = function () return vim.api.nvim_win_get_cursor(0)[2] <= 0 end, 
    action = "<Left>", other_action = "<End><Up>"
  },
}) do
  vim.keymap.set(
    m.modes, 
    m.action, 
    make_change_line(m.condition, m.action, m.other_action), 
    { expr = true, silent = true, replace_keycodes = true }
  )
end
vim.keymap.set("n", "<Right>", 
  make_change_line(
    function ()
      return vim.api.nvim_win_get_cursor(0)[2] >= #vim.api.nvim_get_current_line() - 1
    end, "<Right>", "<Home><Down>"
  ), { expr = true, silent = true, replace_keycodes = true }
)

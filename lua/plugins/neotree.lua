return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = function(_, opts)
    opts = opts or {}

    -- Enter Smart sur un : 
    -- - dossier affiche se centre sur le dossier 
    -- - fichier affiche le fichier dans le précedent buffer
    opts.commands = opts.commands or {}
    opts.commands.enter_smart = function(state)
      local node = state.tree:get_node()
      if not node then
        return
      end

      local fs = require("neo-tree.sources.filesystem.commands")
      if node.type == "directory" then
        fs.set_root(state)
      else
        fs.open(state)
      end
    end

    -- Afficher les fichiers invisible
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
    opts.filesystem.filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    }

    -- mappings
    opts.window = opts.window or {}
    opts.window.mappings = opts.window.mappings or {}
    opts.window.mappings = {
      ["<Right>"] = "open",
      ["<Left>"] = "open",
      ["<CR>"] = "enter_smart",
    }

    return opts
  end
  ,
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("Neotree toggle focus")
        if vim.fn.winnr("$") >= 2 then
          vim.cmd("2wincmd w")
        end
      end,
    })
  end,
}


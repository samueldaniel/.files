-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
local actions = require('telescope.actions')
--local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
  defaults = {
    path_display = {
      "absolute",
    },
    file_ignore_patterns = {
      ".git/",
    },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    --file_browser = {
    --  -- theme = "ivy",
    --  mappings = {
    --    ['i'] = {
    --      ['<A-c>'] = fb_actions.create,
    --      ['<A-r>'] = fb_actions.rename,
    --      ['<A-m>'] = fb_actions.move,
    --      ['<A-y>'] = fb_actions.copy,
    --      ['<A-d>'] = fb_actions.remove,
    --      ['<C-o>'] = fb_actions.open,
    --      ['<C-g>'] = fb_actions.goto_parent_dir,
    --      ['<C-e>'] = fb_actions.goto_home_dir,
    --      ['<C-w>'] = fb_actions.goto_cwd,
    --      ['<C-t>'] = fb_actions.change_cwd,
    --      ['<C-f>'] = fb_actions.toggle_browser,
    --      ['<C-h>'] = fb_actions.toggle_hidden,
    --      ['<C-s>'] = fb_actions.toggle_all,
    --    },
    --    ['n'] = {
    --      ['c'] = fb_actions.create,
    --      ['r'] = fb_actions.rename,
    --      ['m'] = fb_actions.move,
    --      ['y'] = fb_actions.copy,
    --      ['d'] = fb_actions.remove,
    --      ['o'] = fb_actions.open,
    --      ['g'] = fb_actions.goto_parent_dir,
    --      ['e'] = fb_actions.goto_home_dir,
    --      ['w'] = fb_actions.goto_cwd,
    --      ['t'] = fb_actions.change_cwd,
    --      ['f'] = fb_actions.toggle_browser,
    --      ['h'] = fb_actions.toggle_hidden,
    --      ['s'] = fb_actions.toggle_all,
    --    },
    --  },
    --},
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
}

require('telescope').load_extension('fzf')


local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup({
  extensions = {
    file_browser = {
      path = vim.loop.cwd(),
      cwd = vim.loop.cwd(),
      cwd_to_path = false,
      grouped = false,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = { file_browser = false, folder_browser = false },
      respect_gitignore = vim.fn.executable "fd" == 1,
      no_ignore = false,
      follow_symlinks = false,
      browse_files = require("telescope._extensions.file_browser.finders").browse_files,
      browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = false,
      quiet = false,
      dir_icon = "",
      dir_icon_hl = "Default",
      display_stat = { date = true, size = true, mode = true },
      hijack_netrw = false,
      use_fd = true,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
        },
        ["n"] = {
          ["c"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["g"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["f"] = fb_actions.toggle_browser,
          ["h"] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
    },
  },
})
require('telescope').load_extension('file_browser')
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

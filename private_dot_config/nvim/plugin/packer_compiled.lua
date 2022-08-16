-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nﬂ\3\0\1\a\0\22\00066\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\0010Ä6\1\4\0'\3\5\0B\1\2\0029\2\6\0009\3\6\0019\3\a\3\5\2\3\0X\2\2Ä'\2\b\0X\3\1Ä'\2\t\0+\3\0\0009\4\6\0009\5\6\0019\5\n\5\5\4\5\0X\4\aÄ6\4\4\0'\6\v\0B\4\2\0029\4\f\4B\4\1\2\18\3\4\0X\4\16Ä9\4\r\0009\5\r\0019\5\14\5\4\4\5\0X\4\5Ä9\4\r\0009\5\r\0019\5\15\5\5\4\5\0X\4\6Ä6\4\4\0'\6\v\0B\4\2\0029\4\16\4B\4\1\2\18\3\4\0006\4\4\0'\6\17\0B\4\2\0029\4\18\0045\6\19\0=\2\20\6=\3\21\6D\4\2\0K\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\20typescriptreact\rfiletype\abo\bvimN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n¥\1\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\a\0B\0\4\1K\0\1\0005<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<A-i>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\n\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0 luasnip.loaders.from_vscode\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["highlight-current-n.nvim"] = {
    config = { "\27LJ\2\nœ\6\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0ÿ\5\t\t\t\t\t\tnmap n <Plug>(highlight-current-n-n)\n\t\t\t\t\t\tnmap N <Plug>(highlight-current-n-N)\n\t\t\t\t\t\tautocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()\n\t\t\t\t\t\tnmap * *N\n\n\t\t\t\t\t\t\" Some QOL autocommands\n\t\t\t\t\t\taugroup ClearSearchHL\n\t\t\t\t\t\t\tautocmd!\n\t\t\t\t\t\t\t\" You may only want to see hlsearch /while/ searching, you can automatically\n\t\t\t\t\t\t\t\" toggle hlsearch with the following autocommands\n\t\t\t\t\t\t\tautocmd CmdlineEnter /,\\? set hlsearch\n\t\t\t\t\t\t\tautocmd CmdlineLeave /,\\? set nohlsearch\n\t\t\t\t\t\t\t\" this will apply similar n|N highlighting to the first search result\n\t\t\t\t\t\t\t\" careful with escaping ? in lua, you may need \\\\?\n\t\t\t\t\t\t\tautocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()\n\t\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\bvim\1\0\1\20highlight_group\14IncSearch\nsetup\24highlight_current_n\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/highlight-current-n.nvim",
    url = "https://github.com/rktjmp/highlight-current-n.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n¬\6\0\0\6\0\17\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\r\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\14\0'\3\15\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\14\0'\3\16\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\6T\6t\5ô\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>ò\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>\6oÇ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>\6FÅ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lf.nvim"] = {
    config = { "\27LJ\2\n≠\1\0\0\5\0\f\0\0186\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\1K\0\1\0\f:Lf<CR>\14<leader>o\6n\bset\vkeymap\1\0\2\vborder\frounded\16escape_quit\1\nsetup\alf\frequire\rlf_netrw\6g\bvim\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/lf.nvim",
    url = "https://github.com/lmburns/lf.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nÔ\a\0\0\5\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0034\4\0\0=\4\14\3B\1\2\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0005\4\19\0B\1\3\0016\1\15\0009\1\16\0019\1\20\1'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\0\2\fpattern\17LspsagaHover\fcommand<nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>\rFileType\24nvim_create_autocmd\1\0\1\nclear\2\22lspsaga_filetypes\24nvim_create_augroup\bapi\bvim\24server_filetype_map\25rename_output_qflist\1\0\2\venable\1\21auto_open_qflist\1\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\tquit\6q\vvsplit\6s\16scroll_down\n<C-f>\14scroll_up\n<C-b>\topen\6o\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3(\tsign\2\venable\2\17virtual_text\2\1\0\17\29use_saga_diagnostic_sign\1\26finder_reference_icon\nÔåë  \25rename_prompt_prefix\b‚û§\22max_preview_lines\3\n\ndebug\1\27finder_definition_icon\nÔåë  \21highlight_prefix\1\30diagnostic_message_format\n%m %c\29diagnostic_prefix_format\t%d. \21code_action_icon\tÔ†¥ \27diagnostic_header_icon\v ÔÜà  \15infor_sign\bÔëâ\17border_style\vsingle\14hint_sign\bÔ†µ\28definition_preview_icon\nÔî∏  \14warn_sign\bÔî©\15error_sign\bÔôô\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/kkharji/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19lualine_config\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neovim-ayu"] = {
    config = { "\27LJ\2\nR\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14overrides\1\0\1\vmirage\1\nsetup\bayu\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\n∫\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\15CurrentDir\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\19colon_replacer\a++\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\31autosave_ignore_not_normal\2\26autosave_last_session\2\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16null_config\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17mycmp.config\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vc/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp.config\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ6\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d û\2\1\0\5\0\16\0\0256\0\0\0009\0\1\0)\1c\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0009\0\6\0B\0\1\0029\1\a\0005\2\t\0=\2\b\0013\1\n\0006\2\v\0'\4\f\0B\2\2\0029\2\r\0025\4\14\0=\1\15\4B\2\2\1K\0\1\0\27fold_virt_text_handler\1\0\0\nsetup\bufo\frequire\0\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\15foldenable\14foldlevel\bopt\bvim\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  penvim = {
    config = { "\27LJ\2\nÇ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\16project_env\1\0\1\venable\2\rindentor\18disable_types\1\b\0\0\thelp\14dashboard\16dashpreview\rNvimTree\nvista\14sagahover\rterminal\1\0\3\18indent_length\3\2\venable\2\raccuracy\3\5\vrooter\1\0\0\1\0\1\venable\2\nsetup\vpenvim\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/penvim",
    url = "https://github.com/Abstract-IDE/penvim"
  },
  playground = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15find_files\22telescope.builtin\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14live_grep\22telescope.builtin\frequireA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fbuffers\22telescope.builtin\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14help_tags\22telescope.builtin\frequire‹\1\1\0\a\0\r\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0003\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0003\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0003\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0003\5\f\0\18\6\0\0B\1\5\1K\0\1\0\0\15<leader>fh\0\15<leader>fb\0\15<leader>fg\0\15<leader>ff\6n\bset\vkeymap\bvim\1\0\1\fnoremap\2\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nˆ\4\0\0\6\0\25\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2$<cmd>Trouble lsp_references<cr>\agR\1\0\2\vsilent\2\fnoremap\2\30<cmd>Trouble quickfix<cr>\15<leader>xq\1\0\2\vsilent\2\fnoremap\2\29<cmd>Trouble loclist<cr>\15<leader>xl\1\0\2\vsilent\2\fnoremap\2*<cmd>Trouble document_diagnostics<cr>\15<leader>xd\1\0\2\vsilent\2\fnoremap\2+<cmd>Trouble workspace_diagnostics<cr>\15<leader>xw\1\0\2\vsilent\2\fnoremap\2\21<cmd>Trouble<cr>\15<leader>xx\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vscode-svelte-snippets"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/vscode-svelte-snippets",
    url = "https://github.com/fivethree-team/vscode-svelte-snippets"
  },
  ["vue-vscode-snippets"] = {
    loaded = true,
    path = "/home/vc/.local/share/nvim/site/pack/packer/start/vue-vscode-snippets",
    url = "https://github.com/sdras/vue-vscode-snippets"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: highlight-current-n.nvim
time([[Config for highlight-current-n.nvim]], true)
try_loadstring("\27LJ\2\nœ\6\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0ÿ\5\t\t\t\t\t\tnmap n <Plug>(highlight-current-n-n)\n\t\t\t\t\t\tnmap N <Plug>(highlight-current-n-N)\n\t\t\t\t\t\tautocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()\n\t\t\t\t\t\tnmap * *N\n\n\t\t\t\t\t\t\" Some QOL autocommands\n\t\t\t\t\t\taugroup ClearSearchHL\n\t\t\t\t\t\t\tautocmd!\n\t\t\t\t\t\t\t\" You may only want to see hlsearch /while/ searching, you can automatically\n\t\t\t\t\t\t\t\" toggle hlsearch with the following autocommands\n\t\t\t\t\t\t\tautocmd CmdlineEnter /,\\? set hlsearch\n\t\t\t\t\t\t\tautocmd CmdlineLeave /,\\? set nohlsearch\n\t\t\t\t\t\t\t\" this will apply similar n|N highlighting to the first search result\n\t\t\t\t\t\t\t\" careful with escaping ? in lua, you may need \\\\?\n\t\t\t\t\t\t\tautocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()\n\t\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\bvim\1\0\1\20highlight_group\14IncSearch\nsetup\24highlight_current_n\frequire\0", "config", "highlight-current-n.nvim")
time([[Config for highlight-current-n.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\n∫\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\15CurrentDir\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\19colon_replacer\a++\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\31autosave_ignore_not_normal\2\26autosave_last_session\2\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n¬\6\0\0\6\0\17\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\a\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\v\0'\3\t\0'\4\r\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\14\0'\3\15\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\14\0'\3\16\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\6T\6t\5ô\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>ò\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>\6oÇ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>\6FÅ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16null_config\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15find_files\22telescope.builtin\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14live_grep\22telescope.builtin\frequireA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fbuffers\22telescope.builtin\frequireC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14help_tags\22telescope.builtin\frequire‹\1\1\0\a\0\r\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0003\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0003\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0003\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0003\5\f\0\18\6\0\0B\1\5\1K\0\1\0\0\15<leader>fh\0\15<leader>fb\0\15<leader>fg\0\15<leader>ff\6n\bset\vkeymap\bvim\1\0\1\fnoremap\2\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0 luasnip.loaders.from_vscode\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: lf.nvim
time([[Config for lf.nvim]], true)
try_loadstring("\27LJ\2\n≠\1\0\0\5\0\f\0\0186\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\1K\0\1\0\f:Lf<CR>\14<leader>o\6n\bset\vkeymap\1\0\2\vborder\frounded\16escape_quit\1\nsetup\alf\frequire\rlf_netrw\6g\bvim\0", "config", "lf.nvim")
time([[Config for lf.nvim]], false)
-- Config for: penvim
time([[Config for penvim]], true)
try_loadstring("\27LJ\2\nÇ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\16project_env\1\0\1\venable\2\rindentor\18disable_types\1\b\0\0\thelp\14dashboard\16dashpreview\rNvimTree\nvista\14sagahover\rterminal\1\0\3\18indent_length\3\2\venable\2\raccuracy\3\5\vrooter\1\0\0\1\0\1\venable\2\nsetup\vpenvim\frequire\0", "config", "penvim")
time([[Config for penvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nˆ\4\0\0\6\0\25\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2$<cmd>Trouble lsp_references<cr>\agR\1\0\2\vsilent\2\fnoremap\2\30<cmd>Trouble quickfix<cr>\15<leader>xq\1\0\2\vsilent\2\fnoremap\2\29<cmd>Trouble loclist<cr>\15<leader>xl\1\0\2\vsilent\2\fnoremap\2*<cmd>Trouble document_diagnostics<cr>\15<leader>xd\1\0\2\vsilent\2\fnoremap\2+<cmd>Trouble workspace_diagnostics<cr>\15<leader>xw\1\0\2\vsilent\2\fnoremap\2\21<cmd>Trouble<cr>\15<leader>xx\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nÔ\a\0\0\5\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0034\4\0\0=\4\14\3B\1\2\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0005\4\19\0B\1\3\0016\1\15\0009\1\16\0019\1\20\1'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\0\2\fpattern\17LspsagaHover\fcommand<nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>\rFileType\24nvim_create_autocmd\1\0\1\nclear\2\22lspsaga_filetypes\24nvim_create_augroup\bapi\bvim\24server_filetype_map\25rename_output_qflist\1\0\2\venable\1\21auto_open_qflist\1\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\tquit\6q\vvsplit\6s\16scroll_down\n<C-f>\14scroll_up\n<C-b>\topen\6o\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3(\tsign\2\venable\2\17virtual_text\2\1\0\17\29use_saga_diagnostic_sign\1\26finder_reference_icon\nÔåë  \25rename_prompt_prefix\b‚û§\22max_preview_lines\3\n\ndebug\1\27finder_definition_icon\nÔåë  \21highlight_prefix\1\30diagnostic_message_format\n%m %c\29diagnostic_prefix_format\t%d. \21code_action_icon\tÔ†¥ \27diagnostic_header_icon\v ÔÜà  \15infor_sign\bÔëâ\17border_style\vsingle\14hint_sign\bÔ†µ\28definition_preview_icon\nÔî∏  \14warn_sign\bÔî©\15error_sign\bÔôô\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nﬂ\3\0\1\a\0\22\00066\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\0010Ä6\1\4\0'\3\5\0B\1\2\0029\2\6\0009\3\6\0019\3\a\3\5\2\3\0X\2\2Ä'\2\b\0X\3\1Ä'\2\t\0+\3\0\0009\4\6\0009\5\6\0019\5\n\5\5\4\5\0X\4\aÄ6\4\4\0'\6\v\0B\4\2\0029\4\f\4B\4\1\2\18\3\4\0X\4\16Ä9\4\r\0009\5\r\0019\5\14\5\4\4\5\0X\4\5Ä9\4\r\0009\5\r\0019\5\15\5\5\4\5\0X\4\6Ä6\4\4\0'\6\v\0B\4\2\0029\4\16\4B\4\1\2\18\3\4\0006\4\4\0'\6\17\0B\4\2\0029\4\18\0045\6\19\0=\2\20\6=\3\21\6D\4\2\0K\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\20typescriptreact\rfiletype\abo\bvimN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp.config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ6\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d û\2\1\0\5\0\16\0\0256\0\0\0009\0\1\0)\1c\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\4\0009\0\5\0009\0\6\0B\0\1\0029\1\a\0005\2\t\0=\2\b\0013\1\n\0006\2\v\0'\4\f\0B\2\2\0029\2\r\0025\4\14\0=\1\15\4B\2\2\1K\0\1\0\27fold_virt_text_handler\1\0\0\nsetup\bufo\frequire\0\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\15foldenable\14foldlevel\bopt\bvim\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19lualine_config\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n¥\1\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\a\0B\0\4\1K\0\1\0005<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<A-i>\6n\bset\vkeymap\bvim\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: neovim-ayu
time([[Config for neovim-ayu]], true)
try_loadstring("\27LJ\2\nR\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14overrides\1\0\1\vmirage\1\nsetup\bayu\frequire\0", "config", "neovim-ayu")
time([[Config for neovim-ayu]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17mycmp.config\frequire\0", "config", "nvim-cmp")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

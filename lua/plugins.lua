----------------------------------- OLD Vim Plug
local Plug = require 'plugins.vimplug'

Plug.begin('~/.local/share/nvim/plugged')

-- Theme
Plug 'lifepillar/vim-solarized8'

-- Modern C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

-- Plug ('ntpeters/vim-better-whitespace',  { commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de' })
Plug ('junegunn/fzf',                    { tag = '0.18.0', dir = '~/.fzf', ['do'] = vim.fn['fzf#install']})
Plug ('junegunn/fzf.vim',                { commit = 'b31512e2a2d062ee4b6eb38864594c83f1ad2c2f' })

-- nvim env setting
Plug 'L3MON4D3/LuaSnip'
-- Plug 'saadparwaiz1/cmp_luasnip'

-- coq nvim?!
Plug ('ms-jpq/coq_nvim',                 { branch = 'coq' })
-- 9000+ snippets
Plug ('ms-jpq/coq.artifacts',            { branch = 'artifacts' })
Plug ('ms-jpq/coq.thirdparty',           { branch = '3p' })

Plug.ends()

----------------------------------- Packer
-- if plugins updated, we need to call PackerCompile
vim.cmd([[augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- package manager itself
  use 'wbthomason/packer.nvim'
  -- collection of common configurations for the nvim lsp
  use 'neovim/nvim-lspconfig'
  -- nvim airline (statusline)
  use 'feline-nvim/feline.nvim'
  -- icon! and nvim - tree
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  -- visualize lsp progress
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  })
  use('simrat39/rust-tools.nvim')
  -- git diff view
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- markdown preview
  use({
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- octo for PR review
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
}

end)


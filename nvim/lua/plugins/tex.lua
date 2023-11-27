return {
  'lervag/vimtex',
  config = function ()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    
    vim.g.tex_conceal = 'abdmg'
    vim.opt.conceallevel = 1
    
    vim.cmd([[
    let g:vimtex_compiler_latexmk = {
      \ 'aux_dir': 'out/',
      \ 'out_dir': 'out/',
      \ 'options': [
      \   '-xelatex',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-outdir=out'
      \ ]
    \ }
    ]]);
  end
}

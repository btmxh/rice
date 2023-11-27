local M = {}

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

local make_cond = require("luasnip.extras.conditions").make_condition

function M.env(env)
  return make_cond(function()
    local ret = vim.fn["vimtex#env#is_inside"](env)
    return ret[1] > 0 and ret[2] > 0
  end)
end

M.math = make_cond(function() return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1 end)
M.document = M.env("document")
M.text = -M.math

M.sa = ls.extend_decorator.apply(s, { snippetType = "autosnippet", wordTrig = false })
M.msa = ls.extend_decorator.apply(s, { snippetType = "autosnippet", wordTrig = false }, { condition = M.math })
M.tsa = ls.extend_decorator.apply(s, { snippetType = "autosnippet", wordTrig = false }, { condition = M.text })

function M.ss(trig, text)
  return M.sa(trig, { t(text) })
end

function M.mss(trig, text)
  return M.msa(trig, { t(text) })
end

return M

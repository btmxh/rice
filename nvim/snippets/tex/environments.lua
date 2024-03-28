local line_begin = require("luasnip.extras.conditions.expand").line_begin

return {
  tsa("-i", fmta([[
    \begin{itemize}
    \item <>
    \end{itemize}
    ]],
    { c(1, { i(0), sn(nil, fmta(
      [[
        [<>] <>
        ]],
      { i(1), i(0) })) })
    }
  )),
  tsa({ trig = "--", hidden = true }, { t("\\item") },
    { condition = (env("itemize") + env("enumerate")) * line_begin, }
  ),
  tsa(",,thr", fmta([[
    \begin{theorem}
    \label{thr:<>}
      <>
    \end{theorem}
    ]],
    { i(1), i(2) }
  )),
  tsa("ttrr", fmta([[
    \begin{theorem}
    \label{thr:<>}
      <>
    \end{theorem}
    ]],
    { i(1), i(2) }
  )),
  tsa("trrr", fmta([[
    \begin{theorem}[<>]
    \label{thr:<>}
      <>
    \end{theorem}
    ]],
    { i(1), rep(1), i(2) }
  )),
  tsa("ccll", fmta([[
    \begin{corollary}
    \label{cor:<>}
      <>
    \end{corollary}
    ]],
    { i(1), i(2) }
  )),
  tsa("clll", fmta([[
    \begin{corollary}[<>]
    \label{cor:<>}
      <>
    \end{corollary}
    ]],
    { i(1), rep(1), i(2) }
  )),
  tsa("ddkk", fmta([[
    \begin{definition}
    \label{def:<>}
      <>
    \end{definition}
    ]],
    { i(1), i(2) }
  )),
  tsa("dkkk", fmta([[
    \begin{definition}[<>]
    \label{def:<>}
      <>
    \end{definition}
    ]],
    { i(1), rep(1), i(2) }
  )),
  tsa("llmm", fmta([[
    \begin{lemma}
    \label{lem:<>}
      <>
    \end{lemma}
    ]],
    { i(1), i(2) }
  )),
  tsa("lmmm", fmta([[
    \begin{lemma}[<>]
    \label{lem:<>}
      <>
    \end{lemma}
    ]],
    { i(1), rep(1), i(2) }
  )),
  tsa("algr", fmta([[
    \begin{algorithm}
      \caption{<>}
      \label{lem:<>}
      \begin{algorithmic}
      <>
      \end{algorithmic}
    \end{algorithm}
    ]],
    { i(1), rep(1), i(2) }
  )),
  tsa("rtt", {t("Theorem \\ref{thr:"), i(1), t("}")}),
  tsa("rll", {t("Lemma \\ref{lem:"), i(1), t("}")}),
  tsa("sfg", fmta([[
    \begin{subfigure}[.5\textwidth]
      \centering
      <>
      \caption{<>}
    \end{subfigure}
    ]], {i(2), i(1)})),
    tsa("abc", fmta([[
    \begin{enumerate}[label=\alph*]
      <>
    \end{enumerate}
    ]], {i(1)}))
}

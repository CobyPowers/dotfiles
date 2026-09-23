 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1d2021',
    base01 = '#282828',
    base02 = '#323232',
    base03 = '#6a6a6a',
    base04 = '#d4be98',
    base05 = '#d4be98',
    base06 = '#d4be98',
    base07 = '#d4be98',
    base08 = '#ea6962',
    base09 = '#89b482',
    base0A = '#e78a4e',
    base0B = '#a9b665',
    base0C = '#a1e996',
    base0D = '#dbe996',
    base0E = '#f0b58f',
    base0F = '#f6d2bc',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#d4be98',          bg = '#1d2021' })
  hi('TelescopeBorder',         { fg = '#6a6a6a',             bg = '#1d2021' })
  hi('TelescopePromptNormal',   { fg = '#d4be98',          bg = '#1d2021' })
  hi('TelescopePromptBorder',   { fg = '#6a6a6a',             bg = '#1d2021' })
  hi('TelescopePromptPrefix',   { fg = '#a9b665',             bg = '#1d2021' })
  hi('TelescopePromptCounter',  { fg = '#d4be98',  bg = '#1d2021' })
  hi('TelescopePromptTitle',    { fg = '#1d2021',             bg = '#a9b665' })
  hi('TelescopePreviewTitle',   { fg = '#1d2021',             bg = '#e78a4e' })
  hi('TelescopeResultsTitle',   { fg = '#1d2021',             bg = '#89b482' })
  hi('TelescopeSelection',      { fg = '#d4be98',          bg = '#323232' })
  hi('TelescopeSelectionCaret', { fg = '#a9b665',             bg = '#323232' })
  hi('TelescopeMatching',       { fg = '#a9b665',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#d4be98',          bg = '#1d2021' })
  hi('MiniPickBorder',         { fg = '#6a6a6a',             bg = '#1d2021' })
  hi('MiniPickPrompt',   { fg = '#d4be98',          bg = '#1d2021' })
  hi('MiniPickPromptPrefix',   { fg = '#a9b665',             bg = '#1d2021' })
  hi('MiniPickBorderText',    { fg = '#1d2021',             bg = '#a9b665' })
  hi('MiniPickMatchCurrent',      { fg = '#d4be98',          bg = '#323232' })
  hi('MiniPickPromptCaret', { fg = '#a9b665',             bg = '#323232' })
  hi('MiniPickMatchRanges',       { fg = '#a9b665',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M

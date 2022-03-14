--
-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("nvim-autopairs not installed")
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    -- java = false,
  },
  ignored_next_char = "[%w%.]",
  disable_filetype = { "TelescopePrompt" },
  fast_wrap = {
    map = "A-e",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
--    highlight = "PmenuSel",
    highlight = "Error",
    highlight_grey = "LineNr",
  },
}

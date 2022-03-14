
-- Globals used throughout the entire config
--
_G.plugcfg = function(name)
 -- print(string.format('require("plugins/%s")', name))
  return string.format('require("plugins/%s")', name)
end


_G.my_os = vim.fn.system('uname')


-- quickly print a lua table to :messages
_G.dump = function(...)
  print(vim.inspect(...))
end

--

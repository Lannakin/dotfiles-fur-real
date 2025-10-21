-- /utils/clipboard.lua
-- disabled if below line is active
-- if true then return {} end
-- from MeteorVim
-- LazyVim may already have this
function ClipboardYank()
  vim.cmd('call system("echo\'". @@,"\' | xsel -i -b")')
end

function ClipboardPaste()
  vim.cmd("let @@ = system('xsel -o -b')")
end

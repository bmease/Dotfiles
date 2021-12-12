nmap = require('utils').nmap

-- Highlight jumps over 3 lines
vim.g.beacon_minimal_jump = 3
vim.g.beacon_size = 100

nmap("n", "n:Beacon<cr>")
nmap("N", "N:Beacon<cr>")
nmap("*", "*:Beacon<cr>")
nmap("#", "#:Beacon<cr>")

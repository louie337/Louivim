return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
                                   %@@@@@@@@@+                  
                             @@@@@@@@: . . *@@@@@+              
                             @@@@. . . . . . . . =@*            
              +%%%%%%%%%%%%%%@@... . . . . . . . ..-%*          
          +%%%+.:.:.:.:.:.:.:..  . . . . . . . . . ..-%*        
        *%=.:.. . . . . . . . .  . . . . . . . . . . -@#        
      +#@@- . . . . . . . .#%#%  . ##%#: . . . . . . .:-%#      
    ##@@=:: . . . . . . . .:-@@##. -:%@%#- . . . . . . :@@      
    @@=:. . . . . . . . . . .:--:. . -:-:: . . . . . . :@@##    
  *#=-. . . . =#####+ . . . . .  . . . . . . . . . . . .-=@@    
+*=-. . . . =*%@@@@@%*+ . . . .  . . . . . . . . . . :****-=**  
@@. . . . . --#@@@@@#-- . . . .  . . . . . . . -*= :*#@@@@**-=*+
==**. . . . . -=====- . . . . .  . . . . . . =*+=+*#@@@@@@@@  @@
  @@. . . . . . . . . . . . . .  . . . . . =++=++#@@@@@@@@@@  @@
  @@. . . . . . . . . . :++ .++  . . . . . *@+ +@@@@@@@@@@@@  @@
  =++=: . . . . . . . :=+**=+++  +=. ==: . *@+ +@@@@@@@@@@@@  @@
    +++=: . . . . :=- -@%-=@@ .==#*+=++: . *@+ +@@@@@@@@@@@@  @@
      =*========- =@* -@%-=@@==##***+: . . *@+ +@@@@@@@@@@+*==*+
        =++++++++-+#*-+##-=####--@@: . . --#@+ +@@@@@@@@**-=**  
              .-+#*-+#*-=-=-=----##=-=-=-+***+-+********-=**    
              -**++++-=-=-=-=++--++######=:. -*+-------=**      
                =#%@%++-=-=-=%%--%%=-=-=-*%=:  -#######*        
              .:::+####=+-=-=----=-=-=-=-=-#@=                  
            ..+#%#+ . -@%-=-=------=-=-=-=-#@=                  
            +@+ . . . -%#==-=----=-========*#-                  
            +%+.. . . . :%%========%%@@%%%%-                    
             .*@+ . . . . .@@@@@@@@: %@-                        


        █░█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀ █▀ █▀   █ █▀   ▄▀█  
        █▀█ █▀█ █▀▀ █▀▀ █ █░▀█ ██▄ ▄█ ▄█   █ ▄█   █▀█  

         █░█░█ ▄▀█ █▀█ █▀▄▀█   █▀█ █░█ █▀█ █▀█ █▄█
         ▀▄▀▄▀ █▀█ █▀▄ █░▀░█   █▀▀ █▄█ █▀▀ █▀▀ ░█░
]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " [F]ind file", ":Telescope find_files <CR>"),
      dashboard.button("H", " " .. " Find [H]idden files", ":Telescope find_files hidden=true<CR>"),
      dashboard.button("n", " " .. " Find [N]o ignore", ":Telescope find_files hidden=true no_ignore=true<CR>"),
      dashboard.button("r", " " .. " [R]ecent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find [G]rep", ":Telescope live_grep <CR>"),
      dashboard.button("l", "󰒲 " .. " [L]azygit", ":LazyGit<CR>"),
      dashboard.button("c", "󰒲 " .. " Lazygit [C]onfig", ":LazyGitConfig<CR>"),
      dashboard.button("C", " " .. " [C]onfig", ":e $MYVIMRC <CR>"),
      dashboard.button("L", "󰒲 " .. " [L]azy", ":Lazy<CR>"),
      dashboard.button("s", " " .. " Restore [S]ession", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("q", " " .. " [Q]uit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    -- dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

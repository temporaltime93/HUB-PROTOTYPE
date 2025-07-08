if MADE_BY ~= "TEAM_PROTOTYPE" or DISCORD ~= "https://discord.gg/2qcRceCmtC" then
    error("Este script no funcionará sin los créditos originales.")
end


if DESACTIVAR_BLOQUEO == "SI" then
    spawn(function()
        while true do
            if game.UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default then
                game.UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end
            wait(0.5)
        end
    end)
else
    print("no")
end


if _G.CARGA == "VIRUS" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/HUB-PROTOTYPE/refs/heads/main/CONNECTORS/%5BSCRTIPS%5D.lua"))()
else
    _G.CARGA = "VIRUS" 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/HUB-PROTOTYPE/refs/heads/main/CONNECTORS/%5BCARGA%5D.lua"))()
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/HUB-PROTOTYPE/refs/heads/main/UTILITIES/%5BNOTI%5D.lua"))()
end

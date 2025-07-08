
local baseURL = "https://raw.githubusercontent.com/temporaltime93/SCRTIPS/refs/heads/main/"

-- * Tabla de hubs por GameId
local hubs = {
    ["ID"] = { "POINT","MARCA", "SCRIPT" },
    ["7018190066"] = { "SI", "DEAD_RIELS", "DEAD_RIELS" }
}

local juegoID = tostring(game.GameId)
local GENERAL = hubs[juegoID]

if GENERAL then
    local POINT = GENERAL[1]
    local MARCA = GENERAL[2]
    local SCRIPT = GENERAL[3]

    local _1_, _2_ = SCRIPT:match("([^_]+)_([^_]+)")
    local NOMBRE = (_1_ and _2_) and (_1_ .. " " .. _2_) or SCRIPT

    -- * Definir globales
    _G.ID = GENERAL
    _G.POINT = POINT
    _G.MARCA_DEL_JUEGO = MARCA
    _G.NOMBRE = NOMBRE
    _G.SCRIPT = SCRIPT

    print("✅ POINT:", _G.POINT)
    print("✅ MARCA:", _G.MARCA_DEL_JUEGO)
    print("✅ SCRIPT:", _G.SCRIPT)

    -- * URL completa del script
	local carpeta = SCRIPT.. "/" ..SCRIPT
	print(carpeta)
    local url = baseURL.. carpeta .. ".lua"

    -- * Modo de carga
    if POINT == "SI" then
        if _G.PING_PONG == "true" then
            local success, result = pcall(function()
                _G.mensaje = {
        	        M = "success", -- Opciones: error, log, success, help
        	        T = "HUB ENCONTRADO: " ..SCRIPT
                }
                return loadstring(game:HttpGet(url))()
            end)

            if not success then
                _G.mensaje = {
            	    M = "error", -- Opciones: error, log, success, help
            	    T = "Error al ejecutar el script: " ..result
                }
            end
        else
            _G.mensaje = {
                M = "help", -- Opciones: error, log, success, help
                T = "ESTE SCRIPT USA 'ENDPOINT' ASI QUE DANOS TU ID DE DISCORD"
            }
            loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/HUB-PROTOTYPE/refs/heads/main/CONNECTORS/EXTRA/%5BPING%5D.lua"))()
        end
    else
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not success then
            _G.mensaje = {
        	    M = "error", -- Opciones: error, log, success, help
        	    T = "Error al ejecutar el script: " ..result
            }
        end
    end
else
     _G.mensaje = {
	    M = "error", -- Opciones: error, log, success, help
	    T = "NO TENEMOS UN HUB PARA TU JUEGO: " .. juegoID
    }
end

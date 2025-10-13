function sendNotification(playerId, message, type)
    if Config.NotificationSystem == "ox" then
        TriggerClientEvent('ox_lib:notify', playerId, { description = message, type = type })
    elseif Config.NotificationSystem == "esx" then
        TriggerClientEvent('esx:showNotification', playerId, message)
    elseif Config.NotificationSystem == "mythic" then
        TriggerClientEvent('mythic_notify:client:SendAlert', playerId, { type = type, text = message })
    elseif Config.NotificationSystem == "custom" then
        -- Ajoutez le votre !
    else
        print("[BDA] Veuillez définir le système de notification utilisé !")
    end
end

function _U(key, ...)
    local text = Locales[CurrentLocale][key] or key
    return string.format(text, ...)
end

local localeFile = ('locales/%s.lua'):format(Config.Locale)
local f = LoadResourceFile(GetCurrentResourceName(), localeFile)
if f then
    load(f)()
else
    print(('^1[BDA] Fichier de langue %s introuvable^0'):format(localeFile))
    Locales = {}
end
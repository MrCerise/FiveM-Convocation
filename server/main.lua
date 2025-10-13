local function sendWebhook(message)
    if Config.WebhookURL == "" then return end
    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({
        username = "Convocation",
        avatar_url = Config.WebhookAvatar,
        embeds = {{
            title = _U('WEBHOOK_EMBED'),
            description = message,
            color = 16753920,
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ['Content-Type'] = 'application/json' })
end

local function getAuthorizedName(source)
    local identifiers = GetPlayerIdentifiers(source)

    for _, id in ipairs(identifiers) do
        if Config.AuthorizedUsers[id] then
            return Config.AuthorizedUsers[id]
        end
    end

    if Config.AuthorizedUsers[source] then
        return Config.AuthorizedUsers[source]
    end

    return nil
end

RegisterCommand(Config.Command, function(source, args, rawCommand)
    local senderName = getAuthorizedName(source)

    if not senderName then
        sendNotification(source, _U('NO_PERMISSION'), 'error')
        return
    end

    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerName(targetId) then
        sendNotification(source, _U('BAD_USAGE'), 'warning')
        return
    end

    local targetName = GetPlayerName(targetId)

    local identifiers = {}
    local playerIdents = GetPlayerIdentifiers(targetId)

    for i = 1, #playerIdents do
        local ident = playerIdents[i]
        local colonPosition = string.find(ident, ":") - 1
        local identifierType = string.sub(ident, 1, colonPosition)
        identifiers[identifierType] = ident
    end

    local license	 = identifiers["license"] or "N/A"
    local discordId = identifiers["discord"] or "N/A"
    local fivemId = identifiers["fivem"] or "N/A"

    local message = (Config.ConvocationMsg):format(senderName)

    sendNotification(targetId, message, 'error')
    sendNotification(source, _U('SENT', targetName), 'success')

    sendWebhook(_U('WEBHOOK'), senderName, targetName, tostring(targetId), license, discordId, fivemId)
end)
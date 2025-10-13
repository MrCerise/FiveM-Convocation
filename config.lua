Config = {}

Config.NotificationSystem = "ox" -- Notification lists available in function.lua
Config.Locale = 'fr' -- Language available: fr, en
Config.Command = 'bda' -- Command name

Config.AuthorizedUsers = {
    ["license:1234567890abcdef"] = "Capitaine Dupont", -- Add your license and the name shown when summon
    ["steam:11000010abcdef12"] = "Inspecteur Martin",
}

-- Discord Webhook (leave blank to disable)
Config.WebhookURL = ""
Config.WebhookAvatar = ""
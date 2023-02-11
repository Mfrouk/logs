local webhooks = {
    ['inventory'] = "",
    ['mdt'] = "",
    ['rpchat'] = ""
}

function lib.logger(source, event, message, ...)
    webhook = ""

    if webhooks[event] then
        webhook = webhooks[event]
    end

    local embed = {
        {
            ["color"] = 2600155,
            ["title"] = "Player: " .. source,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Logs by Mfrouk#1507 for SSG :)!",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "SSG logy", embeds = embed, avatar_url = "https://media.discordapp.net/attachments/1073916403079446600/1073937228021108736/ssg_2.png?width=670&height=670" }), { ['Content-Type'] = 'application/json' })
end

return lib.logger

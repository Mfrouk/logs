local service = GetConvar('ox:logger', 'datadog')
local hostname = GetConvar('sv_projectName', 'fxserver')
local buffer
local bufferSize = 0

local function badResponse(endpoint, response)
    print(('unable to submit logs to %s\n%s'):format(endpoint, json.encode(response, { indent = true })))
end

-- idk where to put this?

local function split(str,pat)
    local tbl = {}
    str:gsub(pat, function(x) tbl[#tbl+1]=x end)
    return tbl
end

local playerData = {}

AddEventHandler('playerDropped', function()
    playerData[source] = nil
end)

local function formatTags(source, tags)
    if type(source) == 'number' and source > 0 then
        local data = playerData[source]

        if not data then
            local _data = {
                ('username:%s'):format(GetPlayerName(source))
            }

            local num = 1

            ---@cast source string
            for i = 0, GetNumPlayerIdentifiers(source) - 1 do
                local identifier = GetPlayerIdentifier(source, i)

                if not identifier:find('ip') then
                    num += 1
                    _data[num] = identifier
                end
            end

            data = table.concat(_data, ',')
            playerData[source] = data
        end

        tags = tags and ('%s,%s'):format(tags, data) or data
    end

    return tags
end
function lib.logger(source, event, message, type, ...)
    webhook = "YOUR WEBHOOK"
   
    if type == 'inventory' then
        webhook = "YOUR WEBHOOK" 
    end

local embed = {
    {
        ["color"] = 2600155,
        ["title"] = "Player: **" .. source,
        ["description"] = message,
        ["footer"] = {
            ["text"] = "Logs by MFROUK#1507 :)!",
        },
    }
}
PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',
    json.encode({ username = "MFROUK logs opice", embeds = embed,
        avatar_url = "" })
    , { ['Content-Type'] = 'application/json' })
end




return lib.logger

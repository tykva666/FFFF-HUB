if not (game.PlaceId == 113604074601559) then -- Build A Beehive
    return
end

local LastUpDate = "Last Update: 10/17/25"

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "FFFF HUB by MDream",
    Icon = "skull",
    LoadingTitle = "FFFF HUB",
    LoadingSubtitle = "by MDream",
    ShowText = "FFFF HUB",
    Theme = "Amethyst",
 
    ToggleUIKeybind = "K",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ffffhub",
        FileName = "ffffhubbab"
    },

    KeySystem = true,
    KeySettings = {
       Title = "FFFF HUB by MDream",
       Subtitle = "Key-inamo System",
       Note = "Kiss mo ko! di wag 😡",
       FileName = "ffffhubkey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"bembemko"}
    }
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local FlowerShopList = player.FlowerShopScript
local ToolShopList = player.ToolShopScript

local Config = {
    Settings = {
        ToggleAutoDepositHoney = false,
        ToggleAutoCollect = false,
        ToggleAutoSell = false
    }
}

local function MDreamNotif(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration,
        Image = "skull",
    })
end

local function AutoFuncDepositHoney()
    while Config.Settings.ToggleAutoDepositHoney do
        local RemoteEvent = ReplicatedStorage.Framework.Features.HoneySystem.GameEventUtil.RemoteEvent

        RemoteEvent:FireServer("DepositBloodMoonHoney")
        task.wait(5)
    end
end

local function AutoFuncCollect()
    local RemoteEvent = ReplicatedStorage.Framework.Features.HoneySystem.HiveUtil.RemoteEvent


    while Config.Settings.ToggleAutoCollect do
        for i, v in pairs(workspace.Plots.Model.Hives:GetChildren()) do
            local args = {
                "ExtractHoney",
                {
                    workspace.Plots.Model.Hives[tostring(v)]
                }
            }
            RemoteEvent:FireServer(unpack(args))
        end
        task.wait(5)
    end
end

local function AutoFuncSell()
    while Config.Settings.ToggleAutoSell do
        local RemoteEvent = ReplicatedStorage.Framework.Features.HoneySystem.HoneyUtil.RemoteEvent

        RemoteEvent:FireServer("SellHoney")
        task.wait(30)
    end
end

local function getItemList(shop)
    local items = {}

    for _, item in ipairs(shop:GetChildren())
        table.insert(items, item)
    end
    return items
end

MDreamNotif("Made by MDream", "Welcome to FFFF HUB ON TOP!", 10)

local MainTab = Window:CreateTab("Main", "skull")

MainTab:CreateSection("Main Tab")

MainTab:CreateLabel("Build A Beehive", "gamepad-2")

MainTab:CreateLabel(LastUpDate, "calendar-check")

MainTab:CreateParagraph({Title = "Welcome to FFFF HUB by MDream! 💀", Content = "©2025 .defnotmdream. All rights reserved."})

MainTab:CreateButton({
    Name = "Join Discord! 💀",
    Callback = function()
        setclipboard("https://discord.gg/A86X5KnkrN")
        MDreamNotif("Made by MDream", "Copied to clipboard: https://discord.gg/A86X5KnkrN", 5)
    end,
})

local FarmTab = Window:CreateTab("Farm", "badge-dollar-sign")

FarmTab:CreateSection("Farm Tab")

FarmTab:CreateToggle({
    Name = "Auto Deposit Honey",
    Flag = "ToggleAutoDepositHoney",
    Callback = function(Value)
        Config.Settings.ToggleAutoDepositHoney = Value
        AutoFuncDepositHoney()
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Collect",
    Flag = "ToggleAutoCollect",
    Callback = function(Value)
        Config.Settings.ToggleAutoCollect = Value
        AutoFuncCollect()
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Sell",
    Flag = "ToggleAutoSell",
    Callback = function(Value)
        Config.Settings.ToggleAutoSell = Value
        AutoFuncSell()
    end,
})

local FlowerShop = Window:CreateTab("Flower Shop", "badge-dollar-sign")

FlowerShop:CreateSection("Flower Shop Tab")

FlowerShop:CreateDropdown({
    Name = "Select Seeds",
    Options = getItemList(FlowerShopList),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "SelectFlowers",
    Callback = function(selected)
        print(selected)
    end,
})

Rayfield:LoadConfiguration()

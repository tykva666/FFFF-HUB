if not (game.PlaceId == 127742093697776) then -- Plants Vs Brainrots
    return
end

local LastUpDate = "Last Update: 10/02/25"

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "FFFF HUB by MDream",
    Icon = "skull",
    LoadingTitle = "FFFF HUB",
    LoadingSubtitle = "by MDream",
    ShowText = "FFFF HUB",
    Theme = "Amethyst",
 
    ToggleUIKeybind = "K",

    KeySystem = true,
    KeySettings = {
       Title = "FFFF HUB by MDream",
       Subtitle = "Key-inamo System",
       Note = "Kiss mo ko! di wag 😡",
       FileName = "FFFFhubKey",
       SaveKey = false,
       GrabKeyFromSite = false,
       Key = {"bembemko"}
    }
})



local Config = {
    Settings = {
        ToggleAutoCollect = false,
        SelectSeeds = "Cactus Seed",
        ToggleAutoBuySeeds = false,
        SelectGears = "Water Bucket",
        ToggleAutoBuyGears = false,
        ToggleAntiAFK = false
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

local function AutoFuncCollect()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local EquipBestBrainrots = ReplicatedStorage.Remotes.EquipBestBrainrots

    while Config.Settings.ToggleAutoCollect == true do
        EquipBestBrainrots:FireServer()
        task.wait(30)
    end
end

local function AutoFuncBuySeeds()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BuyItem = ReplicatedStorage.Remotes.BuyItem

    while Config.Settings.ToggleAutoBuySeeds == true do
        for _, seed in ipairs(Config.Settings.SelectSeeds) do
            local args = {seed}
            BuyItem:FireServer(unpack(args))
            task.wait(1)
        end
    end
end

local function AutoFuncBuyGears()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BuyGear = ReplicatedStorage.Remotes.BuyGear

    while Config.Settings.ToggleAutoBuyGears == true do
        for _, gear in ipairs(Config.Settings.SelectGears) do
            local args = {gear}
            BuyGear:FireServer(unpack(args))
            task.wait(1)
        end
    end
end

local function AntiFuncAFK()
    local Players = game:GetService("Players")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local player = Players.LocalPlayer

    if Config.Settings.ToggleAntiAFK == true then
        player.Idled:Connect(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
            task.wait(1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            MDreamNotif("Made by MDream", "Anti AFK Working!", 10)
        end)
    end
end


MDreamNotif("Made by MDream", "Welcome to FFFF HUB ON TOP!", 10)


local MainTab = Window:CreateTab("Main", "skull")

MainTab:CreateSection("Main Tab")

MainTab:CreateLabel("Plants Vs Brainrots", "gamepad-2")

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
    Name = "Auto Collect",
    Callback = function(Value)
        Config.Settings.ToggleAutoCollect = Value
        AutoFuncCollect()
    end,
})

local SeedsTab = Window:CreateTab("Seeds", "sprout")

SeedsTab:CreateSection("Seeds Tab")

SeedsTab:CreateDropdown({
    Name = "Select Seeds",
    Options = {
        "Cactus Seed", 
        "Strawberry Seed", 
        "Pumpkin Seed", 
        "Sunflower Seed", 
        "Dragon Fruit Seed", 
        "Eggplant Seed", 
        "Watermelon Seed", 
        "Grape Seed", 
        "Cocotank Seed", 
        "Carnivorous Seed", 
        "Mr Carrot Seed", 
        "Tomatrio Seed", 
        "Shroombino Seed"
    },
    MultipleOptions = true,
    Callback = function(Options)
        Config.Settings.SelectSeeds = Options
        AutoFuncBuySeeds()
    end,
})

SeedsTab:CreateToggle({
    Name = "Auto Buy Seeds",
    Callback = function(Value)
        Config.Settings.ToggleAutoBuySeeds = Value
        AutoFuncBuySeeds()
    end,
})

local GearsTab = Window:CreateTab("Gears", "cog")

GearsTab:CreateSection("Gears Tab")

GearsTab:CreateDropdown({
    Name = "Select Gears",
    Options = {
        "Water Bucket", 
        "Frost Grenade", 
        "Banana Gun", 
        "Frost Blower", 
        "Carrot Launcher"
    },
    MultipleOptions = true,
    Callback = function(Options)
        Config.Settings.SelectGears = Options
        AutoFuncBuyGears()
    end,
})

GearsTab:CreateToggle({
    Name = "Auto Buy Gears",
    Callback = function(Value)
        Config.Settings.ToggleAutoBuyGears = Value
        AutoFuncBuyGears()
    end,
})

local MiscTab = Window:CreateTab("Misc", "ellipsis")

MiscTab:CreateSection("Misc Tab")

MiscTab:CreateToggle({
    Name = "Anti AFK",
    Callback = function(Value)
        Config.Settings.ToggleAntiAFK = Value
        AntiFuncAFK()
    end,
})
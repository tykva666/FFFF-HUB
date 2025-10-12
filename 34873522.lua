if not (game.PlaceId == 90462358603255) then -- Anime Eternal
    return
end

local LastUpDate = "Last Update: 10/12/25"

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
        FileName = "ffffhubae"
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





local Config = {
    Settings = {
        ToggleAutoClick = false,
        ToggleRankUp = false,
        Walkspeed = 50,
        ToggleWalkspeed = false,
        ToggleStatsDamage = false,
        ToggleStatsEnergy = false,
        ToggleStatsCoins = false,
        ToggleStatsLuck = false,
        ToggleAutoReconnect = false,
        ToggleBlackScreen = false,
        ToggleAntiAFK = false
    }
}

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer

local function MDreamNotif(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration,
        Image = "skull",
    })
end

local function AutoFuncClick()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local MouseClick = ReplicatedStorage.Events.To_Server
    local args = {{Action = "_Mouse_Click"}}

    while Config.Settings.ToggleAutoClick == true do
        MouseClick:FireServer(unpack(args))
        task.wait(0.1)
    end
end

local function AutoFuncRankUp()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local aRankUp = ReplicatedStorage.Events.To_Server
    local args = {{Upgrading_Name = "Rank", Action = "_Upgrades", Upgrade_Name = "Rank_Up"}}

    while Config.Settings.ToggleRankUp == true do
        aRankUp:FireServer(unpack(args))
        task.wait(30)
    end
end

local function WalkFuncSpeed(Value)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    if Config.Settings.ToggleWalkspeed then
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    else
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 50
        end
    end
end

local function StatsFunc(stats)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local SkillPoints = ReplicatedStorage.Events.To_Server

    if stats == "Damage" then
        while Config.Settings.ToggleStatsDamage == true do
            local args = {
                {
                    Name = "Primary_Damage",
                    Action = "Assign_Level_Stats",
                    Amount = 1
                }
            }
            SkillPoints:FireServer(unpack(args))
            taks.wait(5)
        end
    elseif stats == "Energy" then
        while Config.Settings.ToggleStatsEnergy == true do
            local args = {
                {
                    Name = "Primary_Energy",
                    Action = "Assign_Level_Stats",
                    Amount = 1
                }
            }
            SkillPoints:FireServer(unpack(args))
            taks.wait(5)
        end
    elseif stats == "Coins" then
        while Config.Settings.ToggleStatsCoins == true do
            local args = {
                {
                    Name = "Primary_Coins",
                    Action = "Assign_Level_Stats",
                    Amount = 1
                }
            }
            SkillPoints:FireServer(unpack(args))
            taks.wait(5)
        end
    elseif stats == "Luck" then
        while Config.Settings.ToggleStatsLuck == true do
            local args = {
                {
                    Name = "Primary_Luck",
                    Action = "Assign_Level_Stats",
                    Amount = 1
                }
            }
            SkillPoints:FireServer(unpack(args))
            taks.wait(5)
        end
    end
end

local function AutoFuncReconnect(errorMessage)
    if Config.Settings.ToggleAutoReconnect == true then
        if errorMessage and errorMessage ~= "" then
            if player then
                task.wait(1)
                TeleportService:Teleport(game.PlaceId, player)
            end
        end
    end
end

local function BlackFuncScreen()
    if Config.Settings.ToggleBlackScreen then
        if not player:FindFirstChild("PlayerGui") then
            task.wait(1)
        end
        
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "BlackScreenGui"
        screenGui.IgnoreGuiInset = true
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.Parent = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") or game:GetService("Players").LocalPlayer.PlayerGui
        
        local blackFrame = Instance.new("Frame")
        blackFrame.Name = "BlackFrame"
        blackFrame.Size = UDim2.new(1, 0, 1, 0)
        blackFrame.Position = UDim2.new(0, 0, 0, 0)
        blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        blackFrame.BorderSizePixel = 0
        blackFrame.ZIndex = 999
        blackFrame.Parent = screenGui
    else
        local playerGui = player:FindFirstChild("PlayerGui") or player.PlayerGui
        local blackScreenGui = playerGui:FindFirstChild("BlackScreenGui")
        
        if blackScreenGui then
            blackScreenGui:Destroy()
        end
    end
end

local function AntiFuncAFK()
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

MainTab:CreateLabel("Anime Eternal", "gamepad-2")

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
    Name = "Auto Click",
    Flag = "ToggleAutoClick",
    Callback = function(Value)
        Config.Settings.ToggleAutoClick = Value
        AutoFuncClick()
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Rank Up",
    Flag = "ToggleRankUp",
    Callback = function(Value)
        Config.Settings.ToggleRankUp = Value
        AutoFuncRankUp()
    end,
})

local PlayerTab = Window:CreateTab("Player", "user")

PlayerTab:CreateSection("Player Tab")

local WalkspeedSlider = PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {30, 100},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "WalkspeedSlider",
    Callback = function(Value)
        WalkFuncSpeed(Value)
    end,
})

PlayerTab:CreateToggle({
    Name = "Enable Walkspeed",
    Flag = "ToggleWalkspeed",
    Callback = function(Value)
        Config.Settings.ToggleWalkspeed = Value
        WalkFuncSpeed(WalkspeedSlider.CurrentValue)
    end,
})

local StatsTab = Window:CreateTab("Stats", "user")

StatsTab:CreateSection("Level Stats Tab")

StatsTab:CreateToggle({
    Name = "Auto Stats Damage",
    Flag = "ToggleStatsDamage",
    Callback = function(Value)
        Config.Settings.ToggleStatsDamage = Value
        StatsFunc("Damage")
    end,
})

StatsTab:CreateToggle({
    Name = "Auto Stats Energy",
    Flag = "ToggleStatsEnergy",
    Callback = function(Value)
        Config.Settings.ToggleStatsEnergy = Value
        StatsFunc("Energy")
    end,
})

StatsTab:CreateToggle({
    Name = "Auto Stats Coins",
    Flag = "ToggleStatsCoins",
    Callback = function(Value)
        Config.Settings.ToggleStatsCoins = Value
        StatsFunc("Coins")
    end,
})

StatsTab:CreateToggle({
    Name = "Auto Stats Star Luck",
    Flag = "ToggleStatsLuck",
    Callback = function(Value)
        Config.Settings.ToggleStatsLuck = Value
        StatsFunc("Luck")
    end,
})

local MiscTab = Window:CreateTab("Misc", "ellipsis")

MiscTab:CreateSection("Misc Tab")

MiscTab:CreateToggle({
    Name = "Auto Reconnect",
    Flag = "ToggleAutoReconnect",
    Callback = function(Value)
        Config.Settings.ToggleAutoReconnect = Value
    end,
})

MiscTab:CreateToggle({
    Name = "Black Screen",
    Flag = "ToggleBlackScreen",
    Callback = function(Value)
        Config.Settings.ToggleBlackScreen = Value
        BlackFuncScreen()
    end,
})

MiscTab:CreateToggle({
    Name = "Anti AFK",
    Flag = "ToggleAntiAFK",
    Callback = function(Value)
        Config.Settings.ToggleAntiAFK = Value
        AntiFuncAFK()
    end,
})

GuiService.ErrorMessageChanged:Connect(AutoFuncReconnect)
Rayfield:LoadConfiguration()

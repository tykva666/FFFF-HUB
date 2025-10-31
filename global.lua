local LastUpDate = "Last Update: 10/13/25"

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
        FileName = "ffffhubg"
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
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer

local Config = {
    Settings = {
        ToggleAutoReconnect = false,
        ToggleBlackScreen = false,
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

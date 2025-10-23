if not (game.PlaceId == 75366259315586) then -- build ur base
    return
end

local LastUpDate = "Last Update: 10/23/25"

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
        Enabled = false,
        FolderName = "ffffhub",
        FileName = "ffffhubbub"
    },

    KeySystem = false,
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



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local selectBlocks = ReplicatedStorage.Items.Overworld.Blocks.Blocks
local selectDecor = ReplicatedStorage.Items.Overworld.Blocks.Decor
local selectDefenses = ReplicatedStorage.Items.Overworld.Blocks.Defenses

local BuyStock = ReplicatedStorage.Remotes.Functions.BuyStock

local selectedBlocks = {}
local selectedDecor = {}
local selectedDefenses = {}
local AutoBuyEnabledBlocks = false



local function getItemList(scrollFrame)
    local items = {}
    for _, itemList in ipairs(scrollFrame:GetChildren()) do
        table.insert(items, itemList.Name)
    end
    return items
end

local function buyItem(choice, itemName)
    local args = {
        choice,
        itemName
    }
    BuyStock:InvokeServer(unpack(args))
end

local 

local function MDreamNotif(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration,
        Image = "skull",
    })
end



MDreamNotif("Made by MDream", "Welcome to FFFF HUB ON TOP!", 10)



local MainTab = Window:CreateTab("Main", "skull")

MainTab:CreateSection("Main Tab")

MainTab:CreateLabel(gameName.Name, "gamepad-2")

MainTab:CreateLabel(LastUpDate, "calendar-check")

MainTab:CreateParagraph({Title = "Welcome to FFFF HUB by MDream! 💀", Content = "©2025 .defnotmdream. All rights reserved."})

MainTab:CreateButton({
    Name = "Join Discord! 💀",
    Callback = function()
        setclipboard("https://discord.gg/A86X5KnkrN")
        MDreamNotif("Made by MDream", "Copied to clipboard: https://discord.gg/A86X5KnkrN", 5)
    end,
})

local BlocksTab = Window:CreateTab("Blocks", "box")

BlocksTab:CreateSection("Blocks Tab")

BlocksTab:CreateDropdown({
    Name = "Select Blocks",
    Options = getItemList(selectBlocks),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "DropdownSelectBlocks",
    Callback = function(selected)
        selectedBlocks = selected
    end,
})

BlocksTab:CreateToggle({
    Name = "Enable Auto-Buy",
    CurrentValue = false,
    Flag = "ToggleAutoBuyBlocks",
    Callback = function(Value)
        AutoBuyEnabledBlocks = Value
    end,
})

local DecorTab = Window:CreateTab("Decor", "door-closed")

DecorTab:CreateSection("Decor Tab")

DecorTab:CreateDropdown({
    Name = "Select Decor",
    Options = getItemList(selectDecor),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "DropdownSelectDecor",
    Callback = function(selected)
        selectedDecor = selected
    end,
})

local DefensesTab = Window:CreateTab("Defenses", "swords")

DefensesTab:CreateSection("Defenses Tab")

DefensesTab:CreateDropdown({
    Name = "Select Defenses",
    Options = getItemList(selectDefenses),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "DropdownSelectDefenses",
    Callback = function(selected)
        selectedDefenses = selected
    end,
})

while AutoBuyEnabledBlocks == true do
    for _, blockName in ipairs(selectedBlocks) do
        buyItem("Blocks", blockName)
        print("working line 162")
    end
    task.wait(1)
end

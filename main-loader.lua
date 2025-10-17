if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait( math.random() )

local games = {
	[35734714] = 'https://raw.githubusercontent.com/tykva666/FFFF-HUB/refs/heads/main/35734714.lua', -- AT
    [34873522] = 'https://raw.githubusercontent.com/tykva666/FFFF-HUB/refs/heads/main/34873522.lua', -- AE
    [34869880] = 'https://raw.githubusercontent.com/tykva666/FFFF-HUB/refs/heads/main/34869880.lua', -- PvB
    [36051520] = 'https://raw.githubusercontent.com/tykva666/FFFF-HUB/refs/heads/main/36051520.lua' --BAB
}

if games[game.CreatorId] then
    loadstring(game:HttpGet(games[game.CreatorId]))()
end

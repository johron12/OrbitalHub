local games = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games.lua'))().module

if game.PlaceId == games.PrisonLife then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/prisonlife.lua'))()
elseif game.PlaceId == games.Arsenal then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/arsenal.lua'))()
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/default.lua'))()
end
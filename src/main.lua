local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/ui-library.lua'))()
local win = lib:Window("ORBITAL", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
local tab = win:Tab("Loader")


tab:Label("Welcome to OrbitalHub!")
tab:Label("Please enter a passcode to load the hub.")

local games = {
    ["PrisonLife"] = 155615604,
    ["Arsenal"] = 286090429
}

local function loadGame()
    if game.PlaceId == games.PrisonLife then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/prisonlife.lua'))()
    elseif game.PlaceId == games.Arsenal then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/arsenal.lua'))()
    else
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/test.lua'))()
    end
end


tab:Textbox("Passcode", true, function(t)
	if t == "alpha" then
		lib:Notification("Orbital Loader", "Correct Credentials", "Load")
        wait(1)
        --lib:Destroy()
        loadGame()
	else
		lib:Notification("Orbital Loader", "Incorrect Credentials", "Try Again.")
	end
end)

tab:Label("Press enter to Submit.")
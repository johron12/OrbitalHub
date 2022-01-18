--> Lib Setup <--

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/ui-library.lua'))()
local win = lib:Window("ORBITAL", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightShift)
local tab = win:Tab("Loader")

--> Loader Labels <--

tab:Label("Welcome to OrbitalHub!")
tab:Label("Please enter a passcode to load the hub.")

--> Supported Games <--

local games = {
    ["prisonlife"] = 155615604,
    ["arsenal"] = 286090429
}

--> Game Loader <--

local function loadGame()
    if game.PlaceId == games.prisonlife then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/prisonlife.lua'))()
    elseif game.PlaceId == games.arsenal then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/arsenal.lua'))()
    else
        loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/default.lua'))()
    end
end

--> Passcode Checker <--

tab:Textbox("Passcode", true, function(t)
	if t == "alpha" then
		lib:Notification("Orbital Loader", "Correct Credentials", "Load")
        wait(1)
        loadGame()
        lib:Destroy()
	else
		lib:Notification("Orbital Loader", "Incorrect Credentials", "Try Again.")
	end
end)

--> Help Label <--

tab:Label("Press enter to Submit.")
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/ui-library.lua'))()
local win = lib:Window("ORBITAL", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
local tab = win:Tab("Welcome")

--local default = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/src/games/default.lua'))()

tab:Label("Welcome to OrbitalHub!")
tab:Label("Please enter a passcode to load the hub.")

tab:Textbox("Passcode", true, function(t)
	if t == "alpha" then
		lib:Notification("Orbital Loader", "Correct Credentials", "Load")
        default.init(lib, win, tab)
	else
		lib:Notification("Orbital Loader", "Incorrect Credentials", "Try Again.")
	end
end)

tab:Label("Press enter to Submit.")
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/ui-library.lua'))()
local win = lib:Window("ORBITAL", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
local tab = win:Tab("Loader")


local passcode = ""


tab:Label("Passcode")

tab:Textbox("Passcode", true, function(t)
	passcode = t
end)

tab:Button("Submit", function()
	if passcode == "orbital" then
		lib:Notification("Orbital Loader", "Hello!", "Correct passcode")
	else
		lib:Notification("Orbital Loader", "Hello!", "Wrong passcode!")
	end
end)
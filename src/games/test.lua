local function load(lib, win)


    local plr = win:Tab("Player")
    local visuals = win:Tab("Visuals")
    local world = win:Tab("World")

    -- Player Tab
    plr:Slider("WalkSpeed", 1, 256, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    plr:Slider("JumpPower", 1, 512, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)


end)

--load()
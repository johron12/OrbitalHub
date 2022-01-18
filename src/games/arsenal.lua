--> Lib Setup <--

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/JohanDevv/OrbitalHub/main/ui-library.lua'))()
local win = lib:Window("ORBITAL", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightShift)

--> Tabs <--

local plr = win:Tab("Player")
local visuals = win:Tab("Visuals")
local world = win:Tab("World")

--> Variables <--

local aimEnabled = false

local plrs = game:GetService("Players")
local player = plrs.LocalPlayer
local mouse = player:GetMouse()
local camera = game:GetService("Workspace").CurrentCamera

--> Functions <--

function notBehindWall(target)
    local ray = Ray.new(player.Character.Head.Position, (target.Position - player.Character.Head.Position).Unit * 300)
    local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {player.Character}, false, true)
    if part then
        local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
        end
        if humanoid and target and humanoid.Parent == target.Parent then
            local pos, visible = camera:WorldToScreenPoint(target.Position)
            if visible then
                return true
            end
        end
    end
end
 
function getPlayerClosestToMouse()
    if aimEnabled then
        local target = nil
        local maxDist = 100
        for _,v in pairs(plrs:GetPlayers()) do
            if aimEnabled then
                if v.Character then
                    if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= player.TeamColor then
                        local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                        local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                        if dist < maxDist and vis then
                            local torsoPos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                            local torsoDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(torsoPos.X, torsoPos.Y)).magnitude
                            local headPos = camera:WorldToViewportPoint(v.Character.Head.Position)
                            local headDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(headPos.X, headPos.Y)).magnitude
                            if torsoDist > headDist then
                                if notBehindWall(v.Character.Head) then
                                    target = v.Character.Head
                                end
                            else
                                if notBehindWall(v.Character.HumanoidRootPart) then
                                    target = v.Character.HumanoidRootPart
                                end
                            end 
                            maxDist = dist
                        end
                    end
                end
            end
        end
        return target
    end
end

--> Player Tab <--

plr:Slider("WalkSpeed", 1, 256, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

plr:Slider("JumpPower", 1, 512, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

plr:Toggle("Silent Aimbot", false, function(v)
    if v then
        aimEnabled = v
        local gmt = getrawmetatable(game)
        setreadonly(gmt, false)
        local oldNamecall = gmt.__namecall

        gmt.__namecall = newcclosure(function(self, ...)
            local Args = {...}
            local method = getnamecallmethod()
            if tostring(self) == "HitPart" and tostring(method) == "FireServer" then
                Args[1] = getPlayerClosestToMouse()
                Args[2] = getPlayerClosestToMouse().Position
                return self.FireServer(self, unpack(Args))
            end
            return oldNamecall(self, ...)
        end)
    else
        aimEnabled = v
    end
end)
Players = game:GetService("Players")
Player = game.Players.LocalPlayer
LocalPlayer = Player

if Player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    print("Loading V2 R15 Animations..")
    Player.Character.Animate:Destroy()
    local a = game:GetObjects("rbxassetid://6816103163")[1]
    local function b()
        local c = Instance.new("LocalScript", Close)
        c.Name = "Animate"
        c.Parent = Player.Character
        for d, e in next, a:GetDescendants() do
            if e:IsA("StringValue") then
                e.Parent = c
            end
        end
        function waitForChild(f, g)
            local h = nil
            local i = f:findFirstChild(g)
            if i then
                return i
            end
            while true do
                h = f.ChildAdded:wait()
                if h.Name == g then
                    break
                end
            end
            return h
        end
        local j = c.Parent
        local k = waitForChild(j, "Humanoid")
        k.CameraOffset = Vector3.new(0, 0.5, 0)
        math.randomseed(os.time())
        local l = {}
        function configureAnimationSet(m, n)
            if l[m] then
                local o, p, q = pairs(l[m].connections)
                while true do
                    local r, s = o(p, q)
                    if r then
                    else
                        break
                    end
                    q = r
                    s:disconnect()
                end
            end
            l[m] = {}
            l[m].count = 0
            l[m].totalWeight = 0
            l[m].connections = {}
            local t = c:FindFirstChild(m)
            if t then
                table.insert(
                    l[m].connections,
                    t.ChildAdded:connect(
                        function(u)
                            configureAnimationSet(m, n)
                        end
                    )
                )
                table.insert(
                    l[m].connections,
                    t.ChildRemoved:connect(
                        function(v)
                            configureAnimationSet(m, n)
                        end
                    )
                )
                local w = 1
                local x, y, z = pairs(t:GetChildren())
                while true do
                    local A, B = x(y, z)
                    if A then
                    else
                        break
                    end
                    z = A
                    if B:IsA("Animation") then
                        table.insert(
                            l[m].connections,
                            B.Changed:connect(
                                function(C)
                                    configureAnimationSet(m, n)
                                end
                            )
                        )
                        l[m][w] = {}
                        l[m][w].anim = B
                        local D = B:FindFirstChild("Weight")
                        if D == nil then
                            l[m][w].weight = 1
                        else
                            l[m][w].weight = D.Value
                        end
                        l[m].count = l[m].count + 1
                        l[m].totalWeight = l[m].totalWeight + l[m][w].weight
                        w = w + 1
                    end
                end
            end
            if l[m].count <= 0 then
                local E, F, G = pairs(n)
                while true do
                    local H, I = E(F, G)
                    if H then
                    else
                        break
                    end
                    G = H
                    l[m][H] = {}
                    l[m][H].anim = Instance.new("Animation")
                    l[m][H].anim.Name = m
                    l[m][H].anim.AnimationId = I.id
                    l[m][H].weight = I.weight
                    l[m].count = l[m].count + 1
                    l[m].totalWeight = l[m].totalWeight + I.weight
                end
            end
        end
        local J = {
            idle = {
                {id = "rbxasset://R15021216/idle_stretch.xml", weight = 1},
                {id = "rbxasset://R15021216/idle_look.xml", weight = 1},
                {id = "rbxasset://R15021216/idle.xml", weight = 9}
            },
            walk = {{id = "rbxasset://R15021216/run.xml", weight = 10}},
            run = {{id = "rbxasset://R15021216/run.xml", weight = 10}},
            jump = {{id = "rbxasset://R15021216/jump.xml", weight = 10}},
            fall = {{id = "rbxasset://R15021216/falling.xml", weight = 10}},
            climb = {{id = "rbxasset://R15021216/climb.xml", weight = 10}},
            sit = {{id = "http://www.roblox.com/asset/?id=393915321", weight = 10}},
            toolnone = {{id = "http://www.roblox.com/asset/?id=393915542", weight = 10}},
            toolslash = {{id = "http://www.roblox.com/asset/?id=393915542", weight = 10}},
            toollunge = {{id = "http://www.roblox.com/asset/?id=393915542", weight = 10}},
            wave = {{id = "http://www.roblox.com/asset/?id=393915710", weight = 10}},
            point = {{id = "http://www.roblox.com/asset/?id=393915866", weight = 10}},
            dance = {
                {id = "http://www.roblox.com/asset/?id=393916260", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393916456", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393916635", weight = 10}
            },
            dance2 = {
                {id = "http://www.roblox.com/asset/?id=393916791", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393916989", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393917195", weight = 10}
            },
            dance3 = {
                {id = "http://www.roblox.com/asset/?id=393917375", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393917556", weight = 10},
                {id = "http://www.roblox.com/asset/?id=393917721", weight = 10}
            },
            laugh = {{id = "http://www.roblox.com/asset/?id=393916166", weight = 10}},
            cheer = {{id = "http://www.roblox.com/asset/?id=393916016", weight = 10}}
        }
        function scriptChildModified(K)
            local L = J[K.Name]
            if L then
                configureAnimationSet(K.Name, L)
            end
        end
        c.ChildAdded:connect(scriptChildModified)
        c.ChildRemoved:connect(scriptChildModified)
        for M, N in pairs(J) do
            configureAnimationSet(M, N)
        end
        local O = ""
        local P = {
            wave = false,
            point = false,
            dance = true,
            dance2 = true,
            dance3 = true,
            laugh = false,
            cheer = false
        }
        local Q = nil
        local R = nil
        local S = nil
        function stopAllAnimations()
            local T = O
            if P[T] then
                if P[T] == false then
                    T = "idle"
                end
            end
            O = ""
            Q = nil
            if R then
                R:disconnect()
            end
            if S then
                S:Stop()
                S:Destroy()
                S = nil
            end
            return T
        end
        local U = 1
        function setAnimationSpeed(V)
            if V ~= U then
                U = V
                S:AdjustSpeed(U)
            end
        end
        function keyFrameReachedFunc(W)
            if W == "End" then
                local X = O
                if P[X] then
                    if P[X] == false then
                        X = "idle"
                    end
                end
                playAnimation(X, 0.15, k)
                setAnimationSpeed(U)
            end
        end
        function playAnimation(Y, Z, _)
            local a0 = math.random(1, l[Y].totalWeight)
            local a1 = 1
            while true do
                if l[Y][a1].weight < a0 then
                else
                    break
                end
                a0 = a0 - l[Y][a1].weight
                a1 = a1 + 1
            end
            local a2 = l[Y][a1].anim
            if a2 ~= Q then
                if S then
                    S:Stop(Z)
                    S:Destroy()
                end
                U = 1
                S = _:LoadAnimation(a2)
                S:Play(Z)
                O = Y
                Q = a2
                if R then
                    R:disconnect()
                end
                R = S.KeyframeReached:connect(keyFrameReachedFunc)
            end
        end
        local a3 = ""
        function toolKeyFrameReachedFunc(a4)
            if a4 == "End" then
                playToolAnimation(a3, 0, k)
            end
        end
        local a5 = nil
        local a6 = nil
        local a7 = nil
        function playToolAnimation(a8, a9, aa)
            local ab = math.random(1, l[a8].totalWeight)
            local ac = 1
            while true do
                if l[a8][ac].weight < ab then
                else
                    break
                end
                ab = ab - l[a8][ac].weight
                ac = ac + 1
            end
            local ad = l[a8][ac].anim
            if a5 ~= ad then
                if a6 then
                    a6:Stop()
                    a6:Destroy()
                    a9 = 0
                end
                a6 = aa:LoadAnimation(ad)
                a6:Play(a9)
                a3 = a8
                a5 = ad
                a7 = a6.KeyframeReached:connect(toolKeyFrameReachedFunc)
            end
        end
        function stopToolAnimations()
            if a7 then
                a7:disconnect()
            end
            a3 = ""
            a5 = nil
            if a6 then
                a6:Stop()
                a6:Destroy()
                a6 = nil
            end
            return a3
        end
        local ae = "Standing"
        function onRunning(af)
            if 0.01 < af then
            else
                playAnimation("idle", 0.1, k)
                ae = "Standing"
                return
            end
            playAnimation("walk", 0.1, k)
            setAnimationSpeed(af / 15)
            ae = "Running"
        end
        function onDied()
            ae = "Dead"
        end
        local ag = 0
        function onJumping()
            playAnimation("jump", 0.1, k)
            ag = 0.31
            ae = "Jumping"
        end
        function onClimbing(ah)
            playAnimation("climb", 0.1, k)
            setAnimationSpeed(ah / 2)
            ae = "Climbing"
        end
        function onGettingUp()
            ae = "GettingUp"
        end
        function onFreeFall()
            if ag <= 0 then
                playAnimation("fall", 0.2, k)
            end
            ae = "FreeFall"
        end
        function onFallingDown()
            ae = "FallingDown"
        end
        function onSeated()
            ae = "Seated"
        end
        function onPlatformStanding()
            ae = "PlatformStanding"
        end
        function onSwimming(ai)
            if 0 < ai then
                ae = "Running"
                return
            end
            ae = "Standing"
        end
        function getTool()
            local aj, ak, al = ipairs(j:GetChildren())
            while true do
                local am, an = aj(ak, al)
                if am then
                else
                    break
                end
                al = am
                if an.className == "Tool" then
                    return an
                end
            end
            return nil
        end
        function getToolAnim(ao)
            local ap, aq, ar = ipairs(ao:GetChildren())
            while true do
                local as, at = ap(aq, ar)
                if as then
                else
                    break
                end
                ar = as
                if at.Name == "toolanim" then
                    if at.className == "StringValue" then
                        return at
                    end
                end
            end
            return nil
        end
        local au = "None"
        function animateTool()
            if au == "None" then
                playToolAnimation("toolnone", 0.1, k)
                return
            end
            if au == "Slash" then
                playToolAnimation("toolslash", 0, k)
                return
            end
            if au == "Lunge" then
            else
                return
            end
            playToolAnimation("toollunge", 0, k)
        end
        function moveSit()
            RightShoulder.MaxVelocity = 0.15
            LeftShoulder.MaxVelocity = 0.15
            RightShoulder:SetDesiredAngle(1.57)
            LeftShoulder:SetDesiredAngle(-1.57)
            RightHip:SetDesiredAngle(1.57)
            LeftHip:SetDesiredAngle(-1.57)
        end
        local av = 0
        local aw = 0
        function move(ax)
            av = ax
            if 0 < ag then
                ag = ag - (ax - av)
            end
            if ae == "FreeFall" then
                if ag <= 0 then
                    playAnimation("fall", 0.2, k)
                else
                    if ae == "Seated" then
                        playAnimation("sit", 0.5, k)
                        return
                    end
                    if ae == "Running" then
                        playAnimation("walk", 0.1, k)
                    elseif ae ~= "Dead" then
                        if ae ~= "GettingUp" then
                            if ae ~= "FallingDown" then
                                if ae ~= "Seated" then
                                    if ae == "PlatformStanding" then
                                        stopAllAnimations()
                                    end
                                else
                                    stopAllAnimations()
                                end
                            else
                                stopAllAnimations()
                            end
                        else
                            stopAllAnimations()
                        end
                    else
                        stopAllAnimations()
                    end
                end
            else
                if ae == "Seated" then
                    playAnimation("sit", 0.5, k)
                    return
                end
                if ae == "Running" then
                    playAnimation("walk", 0.1, k)
                elseif ae ~= "Dead" then
                    if ae ~= "GettingUp" then
                        if ae ~= "FallingDown" then
                            if ae ~= "Seated" then
                                if ae == "PlatformStanding" then
                                    stopAllAnimations()
                                end
                            else
                                stopAllAnimations()
                            end
                        else
                            stopAllAnimations()
                        end
                    else
                        stopAllAnimations()
                    end
                else
                    stopAllAnimations()
                end
            end
            local ay = getTool()
            if ay then
            else
                stopToolAnimations()
                au = "None"
                a5 = nil
                aw = 0
                return
            end
            animStringValueObject = getToolAnim(ay)
            if animStringValueObject then
                au = animStringValueObject.Value
                animStringValueObject.Parent = nil
                aw = ax + 0.3
            end
            if aw < ax then
                aw = 0
                au = "None"
            end
            animateTool()
        end
        k.Died:connect(onDied)
        k.Running:connect(onRunning)
        k.Jumping:connect(onJumping)
        k.Climbing:connect(onClimbing)
        k.GettingUp:connect(onGettingUp)
        k.FreeFalling:connect(onFreeFall)
        k.FallingDown:connect(onFallingDown)
        k.Seated:connect(onSeated)
        k.PlatformStanding:connect(onPlatformStanding)
        k.Swimming:connect(onSwimming)
        Player.Chatted:connect(
            function(az)
                local aA = ""
                if string.sub(az, 1, 3) == "/e " then
                    aA = string.sub(az, 4)
                elseif string.sub(az, 1, 7) == "/emote " then
                    aA = string.sub(az, 8)
                end
                if ae == "Standing" and P[aA] then
                    playAnimation(aA, 0.1, k)
                end
            end
        )
        local aB = game:service("RunService")
        playAnimation("idle", 0.1, k)
        ae = "Standing"
        while j.Parent do
            local aC, aD = task.wait(0.1)
            move(aD)
        end
    end
    coroutine.wrap(b)()
else
    print("Must be R15.")
end
game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Died:Connect(
    function()
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/2016%20anims"))()
    end
)
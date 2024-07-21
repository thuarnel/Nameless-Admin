if getgenv().prtGrabLoaded then return print'Part Grabber is running already' end
getgenv().prtGrabLoaded=true

local prtGrab = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Container = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local grab = Instance.new("TextButton")
local Found = Instance.new("TextLabel")
local Topbar = Instance.new("Frame")
local Icon = Instance.new("ImageLabel")
local Exit = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local Minimize = Instance.new("TextButton")
local ImageLabel_2 = Instance.new("ImageLabel")
local TopBar = Instance.new("Frame")
local ImageLabel_3 = Instance.new("ImageLabel")
local ImageLabel_4 = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local UIGradient_2 = Instance.new("UIGradient")

prtGrab.Name = "prtGrab"
prtGrab.Parent = (game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"))
prtGrab.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = prtGrab
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 0.140
Main.BorderColor3 = Color3.fromRGB(139, 139, 139)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.307999998, 0, 1.26199996, 0)
Main.Size = UDim2.new(0, 402, 0, 146)

Container.Name = "Container"
Container.Parent = Main
Container.AnchorPoint = Vector2.new(0.5, 1)
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 0.500
Container.BorderColor3 = Color3.fromRGB(255, 255, 255)
Container.BorderSizePixel = 0
Container.ClipsDescendants = true
Container.Position = UDim2.new(0.5, 0, 1.02057612, -5)
Container.Size = UDim2.new(1, -10, 1.0325762, -30)

UICorner.CornerRadius = UDim.new(0, 9)
UICorner.Parent = Container

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 4, 20)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(12, 4, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 4, 20))}
UIGradient.Parent = Container

grab.Name = "grab"
grab.Parent = Container
grab.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
grab.BorderColor3 = Color3.fromRGB(139, 139, 139)
grab.BorderSizePixel = 0
grab.Position = UDim2.new(0.354591846, 0, 0.75548321, 0)
grab.Size = UDim2.new(0, 110, 0, 29)
grab.Font = Enum.Font.SourceSans
grab.Text = "Copy Path"
grab.TextColor3 = Color3.fromRGB(255, 255, 255)
grab.TextScaled = true
grab.TextSize = 14.000
grab.TextWrapped = true

Found.Name = "Found"
Found.Parent = Container
Found.Active = true
Found.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Found.BorderColor3 = Color3.fromRGB(0, 0, 0)
Found.BorderSizePixel = 0
Found.Position = UDim2.new(0.0127551025, 0, 0.183681354, 0)
Found.Size = UDim2.new(0, 376, 0, 29)
Found.Font = Enum.Font.SourceSans
Found.Text = ". . ."
Found.TextColor3 = Color3.fromRGB(255, 255, 255)
Found.TextScaled = true
Found.TextSize = 14.000
Found.TextWrapped = true

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.Size = UDim2.new(1, 0, 0, 25)

Icon.Name = "Icon"
Icon.Parent = Topbar
Icon.AnchorPoint = Vector2.new(0, 0.5)
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.Position = UDim2.new(0, 10, 0.5, 0)
Icon.Size = UDim2.new(0, 13, 0, 13)
Icon.Image = "rbxgameasset://Images/menuIcon"

Exit.Name = "Exit"
Exit.Parent = Topbar
Exit.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
Exit.BackgroundTransparency = 0.500
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.870000005, 0, 0, 0)
Exit.Size = UDim2.new(-0.00899999961, 40, 1.04299998, -10)
Exit.Font = Enum.Font.Gotham
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextSize = 13.000

ImageLabel.Parent = Exit
ImageLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.999998331, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 9, 0, 16)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8650484523"
ImageLabel.ImageColor3 = Color3.fromRGB(12, 4, 20)
ImageLabel.ImageTransparency = 0.500

Minimize.Name = "Minimize"
Minimize.Parent = Topbar
Minimize.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
Minimize.BackgroundTransparency = 0.500
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.804174006, 0, 0, 0)
Minimize.Size = UDim2.new(0.00100000005, 27, 1.04299998, -10)
Minimize.Font = Enum.Font.Gotham
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 18.000

ImageLabel_2.Parent = Minimize
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.Position = UDim2.new(-0.441000015, 0, 0, 0)
ImageLabel_2.Size = UDim2.new(0, 12, 0, 16)
ImageLabel_2.Image = "http://www.roblox.com/asset/?id=10555881849"
ImageLabel_2.ImageColor3 = Color3.fromRGB(12, 4, 20)
ImageLabel_2.ImageTransparency = 0.500

TopBar.Name = "TopBar"
TopBar.Parent = Topbar
TopBar.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
TopBar.BackgroundTransparency = 0.500
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.265715331, 0, -0.00352294743, 0)
TopBar.Size = UDim2.new(0, 186, 0, 16)

ImageLabel_3.Parent = TopBar
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.Position = UDim2.new(1, 0, 0.0590000004, 0)
ImageLabel_3.Size = UDim2.new(0, 12, 0, 15)
ImageLabel_3.Image = "http://www.roblox.com/asset/?id=8650484523"
ImageLabel_3.ImageColor3 = Color3.fromRGB(12, 4, 20)
ImageLabel_3.ImageTransparency = 0.500

ImageLabel_4.Parent = TopBar
ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_4.BackgroundTransparency = 1.000
ImageLabel_4.Position = UDim2.new(-0.0817726701, 0, 0, 0)
ImageLabel_4.Size = UDim2.new(0, 16, 0, 16)
ImageLabel_4.Image = "http://www.roblox.com/asset/?id=10555881849"
ImageLabel_4.ImageColor3 = Color3.fromRGB(12, 4, 20)
ImageLabel_4.ImageTransparency = 0.500

Title.Name = "Title"
Title.Parent = TopBar
Title.AnchorPoint = Vector2.new(0, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(-0.150533721, 32, 0.415876389, 0)
Title.Size = UDim2.new(0.522161067, 80, 1.11675644, -7)
Title.Font = Enum.Font.SourceSansLight
Title.Text = "Part Grabber"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17.000
Title.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 9)
UICorner_2.Parent = Main

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 4, 20)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(4, 4, 4)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(4, 4, 4)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(4, 4, 4)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 4, 20))}
UIGradient_2.Parent = Main

local idk=nil


local function BLBPRD_fake_script()
local script = Instance.new('LocalScript', Found)

local players = game:GetService("Players")
local player = players.LocalPlayer
local mouse = player:GetMouse()

local function getFullPath(object)
    local path = {}
    while object.Parent and object.Parent ~= game do
        local name = object.Name
        if name:match("^%d") or name:match("%s") or name:match("[^%w_]") then
            name = '["' .. name .. '"]'
        end
        table.insert(path, 1, name)
        object = object.Parent
    end
    local name = object.Name
    if name:match("^%d") or name:match("%s") or name:match("[^%w_]") then
        name = '["' .. name .. '"]'
    end
    table.insert(path, 1, name)

    return table.concat(path, "."):gsub("%.%[", "[")
end

local function prt()
    if mouse.Target then
        script.Parent.Text = getFullPath(mouse.Target)
    else
        warn("Error while getting path")
    end
end
if idk then idk:Disconnect() idk=nil end
idk=mouse.Button1Down:Connect(prt)
end
coroutine.wrap(BLBPRD_fake_script)()
local function UUVHNZD_fake_script() -- Found.LocalScript 
	local script = Instance.new('LocalScript', Found)

	script.Parent.Parent.grab.MouseButton1Click:Connect(function()
		setclipboard(script.Parent.Text)
	end)
end
coroutine.wrap(UUVHNZD_fake_script)()
local function AUPMILR_fake_script() -- Exit.LocalScript 
	local script = Instance.new('LocalScript', Exit)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Parent:Destroy()
if idk then idk:Disconnect() idk=nil end
getgenv().prtGrabLoaded=false
	end)
end
coroutine.wrap(AUPMILR_fake_script)()
local function XOURFQ_fake_script() -- Minimize.LocalScript 
	local script = Instance.new('LocalScript', Minimize)

			p = false
			script.Parent.MouseButton1Click:Connect(function()
				if not p then
					p = not p
					script.Parent.Parent.Parent:TweenSize(UDim2.new(0, 402, 0, 20), "Out", "Quint", 1, true)
				else
					p = not p
					script.Parent.Parent.Parent:TweenSize(UDim2.new(0, 402, 0, 146), "Out", "Quint", 1, true)
				end
			end)
			
end
coroutine.wrap(XOURFQ_fake_script)()
local function PLFU_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	script.Parent.Active = true
	script.Parent.Parent.ResetOnSpawn = false
	script.Parent.Draggable = true
end
coroutine.wrap(PLFU_fake_script)()
local function BSHNZC_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	script.Parent:TweenPosition(UDim2.new(0.308, 0,0.262, 0), "Out", "Quint",1,true)
end
coroutine.wrap(BSHNZC_fake_script)()

--Notification library
local Notification=nil

repeat 
	local s,r=pcall(function()
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/NamelessAdminNotifications.lua"))()
	end);

	if s then
		Notification=r;
	else
		warn("Couldn't load notification module, retrying...");
		task.wait();
	end
until Notification~=nil --waits for the module to load (cause loadstring takes ages)

local Notify=Notification.Notify;

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		Notify({
			Description = "Copied the link.";
			Duration = 3;

		});
	else
		Notify({
			Description = "Unsuported executor so your link hasnt been copied.";
			Duration = 3;

		});
	end
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainUI = Instance.new("Frame")
local Executor = Instance.new("ImageButton")
local Settings = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local ScriptFinder = Instance.new("ImageButton")
local ButtonUIs = Instance.new("Folder")
local Executor_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TopBar = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Down = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local EditorScroller = Instance.new("ScrollingFrame")
local Editor = Instance.new("TextBox")
local ScriptTab = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Execute = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Clear = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Save = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local Settings_2 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TopBar_2 = Instance.new("TextLabel")
local UICorner_10 = Instance.new("UICorner")
local SomeText = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")
local Down_2 = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local MainFrame = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local TopBarFrame = Instance.new("TextLabel")
local UICorner_14 = Instance.new("UICorner")
local SearchBox = Instance.new("TextBox")
local UICorner_15 = Instance.new("UICorner")
local ClearCacheButton = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Down_3 = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local ScriptListFrame = Instance.new("ScrollingFrame")
local Scripts = Instance.new("Folder")
local ScriptFrame = Instance.new("Frame")
local UICorner_18 = Instance.new("UICorner")
local ScriptTitle = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local InfoButton = Instance.new("TextButton")
local UICorner_20 = Instance.new("UICorner")
local ScriptAuthor = Instance.new("TextLabel")
local ScriptGame = Instance.new("TextLabel")
local VerifiedScriptFrame = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local ScriptTitle_2 = Instance.new("TextLabel")
local ExecuteButton_2 = Instance.new("TextButton")
local UICorner_22 = Instance.new("UICorner")
local InfoButton_2 = Instance.new("TextButton")
local UICorner_23 = Instance.new("UICorner")
local ScriptAuthor_2 = Instance.new("TextLabel")
local ScriptGame_2 = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local UIPadding = Instance.new("UIPadding")
local InfoBox = Instance.new("ScrollingFrame")
local Info = Instance.new("Frame")
local PreviewImage = Instance.new("ImageLabel")
local Author = Instance.new("Frame")
local UICorner_24 = Instance.new("UICorner")
local InfoBoxAuthor = Instance.new("TextLabel")
local ProfilePicture = Instance.new("ImageLabel")
local UICorner_25 = Instance.new("UICorner")
local Title_2 = Instance.new("Frame")
local UICorner_26 = Instance.new("UICorner")
local InfoBoxTitle = Instance.new("TextLabel")
local Game = Instance.new("TextLabel")
local UICorner_27 = Instance.new("UICorner")
local Buttons = Instance.new("Frame")
local Close = Instance.new("TextButton")
local UICorner_28 = Instance.new("UICorner")
local CopyScriptButton = Instance.new("TextButton")
local UICorner_29 = Instance.new("UICorner")
local ExecuteButton_3 = Instance.new("TextButton")
local UICorner_30 = Instance.new("UICorner")
local CopyScriptBloxLink = Instance.new("TextButton")
local UICorner_31 = Instance.new("UICorner")
local UICorner_32 = Instance.new("UICorner")
local InfoBoxDescription = Instance.new("TextLabel")
local Comments = Instance.new("Frame")
local UICorner_33 = Instance.new("UICorner")
local Inner = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner_34 = Instance.new("UICorner")
local UICorner_35 = Instance.new("UICorner")
local Comments_2 = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Comment = Instance.new("Frame")
local Content = Instance.new("TextLabel")
local NoScriptsFound = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = (game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"))
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainUI.Name = "MainUI"
MainUI.Parent = ScreenGui
MainUI.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
MainUI.BackgroundTransparency = 0.140
MainUI.Position = UDim2.new(0, 10,0, 186)
MainUI.Size = UDim2.new(0, 62, 0, 347)
MainUI.Visible = false

Executor.Name = "Executor"
Executor.Parent = MainUI
Executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Executor.BackgroundTransparency = 1.000
Executor.Position = UDim2.new(0.158129051, 0, 0.224383295, 0)
Executor.Size = UDim2.new(0, 48, 0, 44)
Executor.Image = "rbxassetid://11570895459"

Settings.Name = "Settings"
Settings.Parent = MainUI
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.Position = UDim2.new(0.215053767, 0, 0.408221543, 0)
Settings.Size = UDim2.new(0, 39, 0, 39)
Settings.Image = "rbxassetid://9753762469"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = MainUI

ScriptFinder.Name = "ScriptFinder"
ScriptFinder.Parent = MainUI
ScriptFinder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptFinder.BackgroundTransparency = 1.000
ScriptFinder.Position = UDim2.new(0.215053797, 0, 0.598423302, 0)
ScriptFinder.Size = UDim2.new(0, 39, 0, 43)
ScriptFinder.Image = "rbxassetid://4728126418"

ButtonUIs.Name = "ButtonUIs"
ButtonUIs.Parent = ScreenGui

Executor_2.Name = "Executor"
Executor_2.Parent = ButtonUIs
Executor_2.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
Executor_2.BackgroundTransparency = 0.120
Executor_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Executor_2.Position = UDim2.new(0.307999998, 0, 1.26199996, 0)
Executor_2.Size = UDim2.new(0, 481, 0, 287)

UICorner_2.Parent = Executor_2

TopBar.Name = "TopBar"
TopBar.Parent = Executor_2
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BackgroundTransparency = 0.600
TopBar.Size = UDim2.new(0, 481, 0, 35)
TopBar.Font = Enum.Font.SourceSansItalic
TopBar.Text = "Executor"
TopBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBar.TextSize = 25.000

UICorner_3.Parent = TopBar

Down.Name = "Down"
Down.Parent = Executor_2
Down.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Down.BackgroundTransparency = 0.700
Down.Position = UDim2.new(0, 0, 0.979094088, 0)
Down.Size = UDim2.new(0, 480, 0, 6)

UICorner_4.Parent = Down

EditorScroller.Name = "EditorScroller"
EditorScroller.Parent = Executor_2
EditorScroller.Active = true
EditorScroller.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
EditorScroller.BackgroundTransparency = 0.600
EditorScroller.BorderSizePixel = 0
EditorScroller.Position = UDim2.new(0.0187110193, 0, 0.167091295, 0)
EditorScroller.Size = UDim2.new(0, 367, 0, 191)
EditorScroller.ScrollBarThickness = 5
EditorScroller.AutomaticCanvasSize = "XY"

Editor.Name = "Editor"
Editor.Parent = EditorScroller
Editor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Editor.BackgroundTransparency = 1.000
Editor.Size = UDim2.new(0, 366, 0, 191)
Editor.ClearTextOnFocus = false
Editor.Font = Enum.Font.SourceSans
Editor.MultiLine = true
Editor.Text = 'print("Hello World!")'
Editor.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor.TextSize = 20.000
Editor.TextXAlignment = Enum.TextXAlignment.Left
Editor.TextYAlignment = Enum.TextYAlignment.Top
Editor.AutomaticSize = "XY"

ScriptTab.Name = "ScriptTab"
ScriptTab.Parent = Executor_2
ScriptTab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptTab.BackgroundTransparency = 0.600
ScriptTab.Position = UDim2.new(0.802494824, 0, 0.163763061, 0)
ScriptTab.Size = UDim2.new(0, 84, 0, 192)

UICorner_5.Parent = ScriptTab

Execute.Name = "Execute"
Execute.Parent = Executor_2
Execute.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Execute.BackgroundTransparency = 0.600
Execute.Position = UDim2.new(0.147187099, 0, 0.864968538, 0)
Execute.Size = UDim2.new(0, 102, 0, 25)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 20.000

UICorner_6.Parent = Execute

Clear.Name = "Clear"
Clear.Parent = Executor_2
Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Clear.BackgroundTransparency = 0.600
Clear.Position = UDim2.new(0.380093336, 0, 0.864968538, 0)
Clear.Size = UDim2.new(0, 102, 0, 25)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Exit"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 20.000

Clear.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

UICorner_7.Parent = Clear

Save.Name = "Save"
Save.Parent = Executor_2
Save.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Save.BackgroundTransparency = 0.600
Save.Position = UDim2.new(0.61299932, 0, 0.864968538, 0)
Save.Size = UDim2.new(0, 102, 0, 25)
Save.Font = Enum.Font.SourceSans
Save.Text = "Save"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextSize = 20.000

UICorner_8.Parent = Save

Settings_2.Name = "Settings"
Settings_2.Parent = ButtonUIs
Settings_2.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
Settings_2.BackgroundTransparency = 0.120
Settings_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Settings_2.Position = UDim2.new(0.308, 0,1.262, 0)
Settings_2.Size = UDim2.new(0, 481, 0, 287)
Settings_2.Visible = true

UICorner_9.Parent = Settings_2

TopBar_2.Name = "TopBar"
TopBar_2.Parent = Settings_2
TopBar_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar_2.BackgroundTransparency = 0.700
TopBar_2.Size = UDim2.new(0, 481, 0, 35)
TopBar_2.Font = Enum.Font.SourceSansItalic
TopBar_2.Text = "Settings"
TopBar_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBar_2.TextSize = 25.000

UICorner_10.Parent = TopBar_2

SomeText.Name = "SomeText"
SomeText.Parent = Settings_2
SomeText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SomeText.BackgroundTransparency = 0.600
SomeText.Position = UDim2.new(0.0124740126, 0, 0.163763061, 0)
SomeText.Size = UDim2.new(0, 469, 0, 206)
SomeText.Font = Enum.Font.SourceSans
SomeText.Text = "sup so we are still working on this idk ig this will be something like fov walkspeed jumppower etc changer lol not have anything to do with the ui"
SomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
SomeText.TextSize = 30.000
SomeText.TextWrapped = true

UICorner_11.Parent = SomeText

Down_2.Name = "Down"
Down_2.Parent = Settings_2
Down_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Down_2.BackgroundTransparency = 0.650
Down_2.Position = UDim2.new(0, 0, 0.94773519, 0)
Down_2.Size = UDim2.new(0, 480, 0, 15)

UICorner_12.Parent = Down_2

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
MainFrame.BackgroundTransparency = 0.120
MainFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainFrame.Position = UDim2.new(0.308, 0,1.262, 0)
MainFrame.Size = UDim2.new(0, 486, 0, 282)
MainFrame.Visible = false

UICorner_13.Parent = MainFrame

TopBarFrame.Name = "TopBarFrame"
TopBarFrame.Parent = MainFrame
TopBarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBarFrame.BackgroundTransparency = 0.600
TopBarFrame.Position = UDim2.new(0.00411522621, 0, 0, 0)
TopBarFrame.Size = UDim2.new(0, 482, 0, 35)
TopBarFrame.Font = Enum.Font.SourceSansItalic
TopBarFrame.Text = "Script Hub"
TopBarFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBarFrame.TextSize = 25.000
TopBarFrame.TextXAlignment = Enum.TextXAlignment.Left

UICorner_14.Parent = TopBarFrame

SearchBox.Name = "SearchBox"
SearchBox.Parent = TopBarFrame
SearchBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.BackgroundTransparency = 0.500
SearchBox.Position = UDim2.new(0.278586268, 0, 0.142857149, 0)
SearchBox.Size = UDim2.new(0, 200, 0, 24)
SearchBox.Font = Enum.Font.SourceSans
SearchBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderText = "Search here."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 14.000

UICorner_15.CornerRadius = UDim.new(1, 0)
UICorner_15.Parent = SearchBox

ClearCacheButton.Name = "ClearCacheButton"
ClearCacheButton.Parent = TopBarFrame
ClearCacheButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClearCacheButton.BackgroundTransparency = 0.500
ClearCacheButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
ClearCacheButton.Position = UDim2.new(0.73068893, 0, 0.114285715, 0)
ClearCacheButton.Size = UDim2.new(0, 93, 0, 24)
ClearCacheButton.Font = Enum.Font.SourceSans
ClearCacheButton.Text = "Exit"
ClearCacheButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearCacheButton.TextSize = 14.000
ClearCacheButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

UICorner_16.CornerRadius = UDim.new(1, 0)
UICorner_16.Parent = ClearCacheButton

Title.Name = "Title"
Title.Parent = TopBarFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.SourceSans
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 14.000
Title.Text = ""

Down_3.Name = "Down"
Down_3.Parent = MainFrame
Down_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Down_3.BackgroundTransparency = 0.700
Down_3.Position = UDim2.new(0, 0, 0.979094088, 0)
Down_3.Size = UDim2.new(0, 480, 0, 6)

UICorner_17.Parent = Down_3

ScriptListFrame.Name = "ScriptListFrame"
ScriptListFrame.Parent = MainFrame
ScriptListFrame.Active = true
ScriptListFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptListFrame.BackgroundTransparency = 0.550
ScriptListFrame.BorderSizePixel = 0
ScriptListFrame.Position = UDim2.new(0.0246913582, 0, 0.166666672, 0)
ScriptListFrame.Size = UDim2.new(0, 461, 0, 213)

Scripts.Name = "Scripts"
Scripts.Parent = ScriptListFrame

ScriptFrame.Name = "ScriptFrame"
ScriptFrame.Parent = Scripts
ScriptFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptFrame.BackgroundTransparency = 0.500
ScriptFrame.Position = UDim2.new(0.0780911073, 0, 0.0265957452, 0)
ScriptFrame.Size = UDim2.new(0, 389, 0, 109)

UICorner_18.Parent = ScriptFrame

ScriptTitle.Name = "ScriptTitle"
ScriptTitle.Parent = ScriptFrame
ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.BackgroundTransparency = 1.000
ScriptTitle.Position = UDim2.new(0.0347184017, 0, 0.0642201751, 0)
ScriptTitle.Size = UDim2.new(0, 209, 0, 39)
ScriptTitle.Font = Enum.Font.SourceSans
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextScaled = true
ScriptTitle.TextSize = 14.000
ScriptTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.TextWrapped = true

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = ScriptFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
ExecuteButton.BackgroundTransparency = 0.200
ExecuteButton.Position = UDim2.new(0.0205655526, 0, 0.587155938, 0)
ExecuteButton.Size = UDim2.new(0, 179, 0, 36)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 20.000

UICorner_19.Parent = ExecuteButton

InfoButton.Name = "InfoButton"
InfoButton.Parent = ScriptFrame
InfoButton.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
InfoButton.BackgroundTransparency = 0.200
InfoButton.Position = UDim2.new(0.50899744, 0, 0.577981651, 0)
InfoButton.Size = UDim2.new(0, 179, 0, 36)
InfoButton.Font = Enum.Font.SourceSans
InfoButton.Text = "Info"
InfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoButton.TextSize = 20.000

UICorner_20.Parent = InfoButton

ScriptAuthor.Name = "ScriptAuthor"
ScriptAuthor.Parent = ScriptFrame
ScriptAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor.BackgroundTransparency = 1.000
ScriptAuthor.Position = UDim2.new(0.528190911, 0, 0.0642201826, 0)
ScriptAuthor.Size = UDim2.new(0, 160, 0, 21)
ScriptAuthor.Font = Enum.Font.SourceSans
ScriptAuthor.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor.TextScaled = true
ScriptAuthor.TextSize = 14.000
ScriptAuthor.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor.TextWrapped = true

ScriptGame.Name = "ScriptGame"
ScriptGame.Parent = ScriptFrame
ScriptGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame.BackgroundTransparency = 1.000
ScriptGame.Position = UDim2.new(0.528213322, 0, 0.311926633, 0)
ScriptGame.Size = UDim2.new(0, 160, 0, 21)
ScriptGame.Font = Enum.Font.SourceSans
ScriptGame.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame.TextScaled = true
ScriptGame.TextSize = 14.000
ScriptGame.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame.TextWrapped = true

VerifiedScriptFrame.Name = "VerifiedScriptFrame"
VerifiedScriptFrame.Parent = Scripts
VerifiedScriptFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
VerifiedScriptFrame.BackgroundTransparency = 0.500
VerifiedScriptFrame.Position = UDim2.new(0.0780911073, 0, 0.0390070938, 0)
VerifiedScriptFrame.Size = UDim2.new(0, 439, 0, 109)

UICorner_21.Parent = VerifiedScriptFrame

ScriptTitle_2.Name = "ScriptTitle"
ScriptTitle_2.Parent = VerifiedScriptFrame
ScriptTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle_2.BackgroundTransparency = 1.000
ScriptTitle_2.Position = UDim2.new(0.0328213498, 0, 0.183266059, 0)
ScriptTitle_2.Size = UDim2.new(0, 209, 0, 39)
ScriptTitle_2.Font = Enum.Font.SourceSans
ScriptTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle_2.TextScaled = true
ScriptTitle_2.TextSize = 14.000
ScriptTitle_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle_2.TextWrapped = true

ExecuteButton_2.Name = "ExecuteButton"
ExecuteButton_2.Parent = VerifiedScriptFrame
ExecuteButton_2.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
ExecuteButton_2.BackgroundTransparency = 0.200
ExecuteButton_2.Position = UDim2.new(0.0205655526, 0, 0.587155938, 0)
ExecuteButton_2.Size = UDim2.new(0, 179, 0, 36)
ExecuteButton_2.Font = Enum.Font.SourceSans
ExecuteButton_2.Text = "Execute"
ExecuteButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton_2.TextSize = 20.000

UICorner_22.Parent = ExecuteButton_2

InfoButton_2.Name = "InfoButton"
InfoButton_2.Parent = VerifiedScriptFrame
InfoButton_2.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
InfoButton_2.BackgroundTransparency = 0.200
InfoButton_2.Position = UDim2.new(0.50899744, 0, 0.577981651, 0)
InfoButton_2.Size = UDim2.new(0, 179, 0, 36)
InfoButton_2.Font = Enum.Font.SourceSans
InfoButton_2.Text = "Info"
InfoButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoButton_2.TextSize = 20.000

UICorner_23.Parent = InfoButton_2

ScriptAuthor_2.Name = "ScriptAuthor"
ScriptAuthor_2.Parent = VerifiedScriptFrame
ScriptAuthor_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor_2.BackgroundTransparency = 1.000
ScriptAuthor_2.Position = UDim2.new(0.528190851, 0, 0.0733944774, 0)
ScriptAuthor_2.Size = UDim2.new(0, 160, 0, 21)
ScriptAuthor_2.Font = Enum.Font.SourceSans
ScriptAuthor_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor_2.TextScaled = true
ScriptAuthor_2.TextSize = 14.000
ScriptAuthor_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptAuthor_2.TextWrapped = true

ScriptGame_2.Name = "ScriptGame"
ScriptGame_2.Parent = VerifiedScriptFrame
ScriptGame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame_2.BackgroundTransparency = 1.000
ScriptGame_2.Position = UDim2.new(0.528213322, 0, 0.311926603, 0)
ScriptGame_2.Size = UDim2.new(0, 160, 0, 21)
ScriptGame_2.Font = Enum.Font.SourceSans
ScriptGame_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame_2.TextScaled = true
ScriptGame_2.TextSize = 14.000
ScriptGame_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
ScriptGame_2.TextWrapped = true

UIGridLayout.Parent = Scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 20, 0, 20)
UIGridLayout.CellSize = UDim2.new(0, 459, 0, 109)

UIPadding.Parent = ScriptListFrame

InfoBox.Name = "InfoBox"
InfoBox.Parent = MainFrame
InfoBox.Active = true
InfoBox.BackgroundColor3 = Color3.fromRGB(12, 4, 20)
InfoBox.BackgroundTransparency = 0.140
InfoBox.BorderSizePixel = 0
InfoBox.Position = UDim2.new(1.01440322, 0, 0.010638278, 0)
InfoBox.Size = UDim2.new(0, 486, 0, 281)

Info.Name = "Info"
Info.Parent = InfoBox
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.Size = UDim2.new(0, 473, 0, 197)

local PreviewImageCorner = Instance.new("UICorner")

PreviewImage.Name = "PreviewImage"
PreviewImage.Parent = Info
PreviewImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreviewImage.Position = UDim2.new(0.0655391142, 0, 0.177664965, 0)
PreviewImage.Size = UDim2.new(0, 141, 0, 127)
PreviewImage.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

PreviewImageCorner.Parent = PreviewImage

Author.Name = "Author"
Author.Parent = Info
Author.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Author.BackgroundTransparency = 0.700
Author.BorderSizePixel = 0
Author.Position = UDim2.new(0.435517997, 0, 0.573604047, 0)
Author.Size = UDim2.new(0, 193, 0, 40)

UICorner_24.Parent = Author

InfoBoxAuthor.Name = "InfoBoxAuthor"
InfoBoxAuthor.Parent = Author
InfoBoxAuthor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxAuthor.BackgroundTransparency = 1.000
InfoBoxAuthor.Position = UDim2.new(0.28397125, 0, 0.164705649, 0)
InfoBoxAuthor.Size = UDim2.new(0, 135, 0, 25)
InfoBoxAuthor.Font = Enum.Font.SourceSans
InfoBoxAuthor.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxAuthor.TextScaled = true
InfoBoxAuthor.TextSize = 14.000
InfoBoxAuthor.TextWrapped = true

ProfilePicture.Name = "ProfilePicture"
ProfilePicture.Parent = Author
ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProfilePicture.Position = UDim2.new(0.0430107526, 0, 0.075000003, 0)
ProfilePicture.Size = UDim2.new(0, 35, 0, 35)
ProfilePicture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_25.CornerRadius = UDim.new(1, 0)
UICorner_25.Parent = ProfilePicture

Title_2.Name = "Title"
Title_2.Parent = Info
Title_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BackgroundTransparency = 0.700
Title_2.Position = UDim2.new(0.397462994, 0, 0.177664965, 0)
Title_2.Size = UDim2.new(0, 233, 0, 44)

UICorner_26.Parent = Title_2

InfoBoxTitle.Name = "InfoBoxTitle"
InfoBoxTitle.Parent = Title_2
InfoBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxTitle.BackgroundTransparency = 1.000
InfoBoxTitle.Size = UDim2.new(0, 232, 0, 43)
InfoBoxTitle.Font = Enum.Font.SourceSans
InfoBoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxTitle.TextScaled = true
InfoBoxTitle.TextSize = 14.000
InfoBoxTitle.TextWrapped = true

Game.Name = "Game"
Game.Parent = Info
Game.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Game.BackgroundTransparency = 0.600
Game.Position = UDim2.new(0.403805614, 0, 0.431472093, 0)
Game.Size = UDim2.new(0, 224, 0, 21)
Game.Font = Enum.Font.SourceSans
Game.TextColor3 = Color3.fromRGB(255, 255, 255)
Game.TextScaled = true
Game.TextSize = 14.000
Game.TextWrapped = true

UICorner_27.Parent = Game

Buttons.Name = "Buttons"
Buttons.Parent = InfoBox
Buttons.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Buttons.BackgroundTransparency = 0.800
Buttons.Position = UDim2.new(0.0267489702, 0, 0.572198629, 0)
Buttons.Size = UDim2.new(0, 440, 0, 50)

Close.Name = "Close"
Close.Parent = Buttons
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BackgroundTransparency = 0.700
Close.Position = UDim2.new(0.742779672, 0, 0.180000007, 0)
Close.Size = UDim2.new(0, 107, 0, 30)
Close.Font = Enum.Font.SourceSans
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 20.000

UICorner_28.Parent = Close

CopyScriptButton.Name = "CopyScriptButton"
CopyScriptButton.Parent = Buttons
CopyScriptButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyScriptButton.BackgroundTransparency = 0.700
CopyScriptButton.Position = UDim2.new(0.497475505, 0, 0.180000007, 0)
CopyScriptButton.Size = UDim2.new(0, 98, 0, 30)
CopyScriptButton.Font = Enum.Font.SourceSans
CopyScriptButton.Text = "Copy Script"
CopyScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyScriptButton.TextSize = 20.000

UICorner_29.Parent = CopyScriptButton

ExecuteButton_3.Name = "ExecuteButton"
ExecuteButton_3.Parent = Buttons
ExecuteButton_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExecuteButton_3.BackgroundTransparency = 0.700
ExecuteButton_3.Position = UDim2.new(0.0113636358, 0, 0.180000007, 0)
ExecuteButton_3.Size = UDim2.new(0, 98, 0, 30)
ExecuteButton_3.Font = Enum.Font.SourceSans
ExecuteButton_3.Text = "Execute"
ExecuteButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton_3.TextSize = 20.000

UICorner_30.Parent = ExecuteButton_3

CopyScriptBloxLink.Name = "CopyScriptBloxLink"
CopyScriptBloxLink.Parent = Buttons
CopyScriptBloxLink.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyScriptBloxLink.BackgroundTransparency = 0.700
CopyScriptBloxLink.Position = UDim2.new(0.256001711, 0, 0.180000007, 0)
CopyScriptBloxLink.Size = UDim2.new(0, 98, 0, 30)
CopyScriptBloxLink.Font = Enum.Font.SourceSans
CopyScriptBloxLink.Text = "Copy Link"
CopyScriptBloxLink.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyScriptBloxLink.TextSize = 20.000

UICorner_31.Parent = CopyScriptBloxLink

UICorner_32.Parent = Buttons

InfoBoxDescription.Name = "InfoBoxDescription"
InfoBoxDescription.Parent = InfoBox
InfoBoxDescription.Text = ""
InfoBoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxDescription.BackgroundTransparency = 1.000
InfoBoxDescription.Position = UDim2.new(0.0370370373, 0, 0.431536496, 0)
InfoBoxDescription.Size = UDim2.new(0, 450, 0, 97)
InfoBoxDescription.Font = Enum.Font.SourceSans
InfoBoxDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBoxDescription.TextScaled = true
InfoBoxDescription.TextSize = 1.000
InfoBoxDescription.TextWrapped = true
InfoBoxDescription.TextXAlignment = Enum.TextXAlignment.Left
InfoBoxDescription.TextYAlignment = Enum.TextYAlignment.Top

Comments.Name = "Comments"
Comments.Parent = InfoBox
Comments.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Comments.BackgroundTransparency = 1.000
Comments.Position = UDim2.new(0.0205762573, 0.710532486, 0)
Comments.Size = UDim2.new(0, 452, 0, 44)

UICorner_33.Parent = Comments

Inner.Name = "Inner"
Inner.Parent = Comments
Inner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Inner.BackgroundTransparency = 0.700
Inner.Position = UDim2.new(0.00442477874, 0, 1.4545455, 0)
Inner.Size = UDim2.new(0, 455, 0, 152)

TextLabel.Parent = Inner
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 0.700
TextLabel.Position = UDim2.new(0, 0, -0.328321189, 0)
TextLabel.Size = UDim2.new(0, 452, 0, 38)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Comments"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000
TextLabel.TextWrapped = true

UICorner_34.Parent = TextLabel

UICorner_35.Parent = Inner

Comments_2.Name = "Comments"
Comments_2.Parent = Inner
Comments_2.Active = true
Comments_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comments_2.BackgroundTransparency = 1.000
Comments_2.BorderSizePixel = 0
Comments_2.Position = UDim2.new(0.0153846154, 0, 0.046052631, 0)
Comments_2.Size = UDim2.new(0, 438, 0, 140)
Comments_2.ScrollBarThickness = 6

UIListLayout.Parent = Comments_2
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Comment.Name = "Comment"
Comment.Parent = Comments_2
Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comment.BackgroundTransparency = 1.000
Comment.Size = UDim2.new(0, 427, 0, 83)

Content.Name = "Content"
Content.Parent = Comment
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.Position = UDim2.new(0.0163934417, 0, 0.036144577, 0)
Content.Size = UDim2.new(0, 426, 0, 40)
Content.Font = Enum.Font.SourceSans
Content.TextColor3 = Color3.fromRGB(255, 255, 255)
Content.TextScaled = true
Content.TextSize = 14.000
Content.TextWrapped = true

NoScriptsFound.Name = "No Scripts Found"
NoScriptsFound.Parent = MainFrame
NoScriptsFound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoScriptsFound.BackgroundTransparency = 1.000
NoScriptsFound.Position = UDim2.new(0.0390946493, 0, 0.202127665, 0)
NoScriptsFound.Size = UDim2.new(0, 438, 0, 50)
NoScriptsFound.Visible = false
NoScriptsFound.Font = Enum.Font.SourceSansBold
NoScriptsFound.Text = "No scripts found."
NoScriptsFound.TextColor3 = Color3.fromRGB(255, 255, 255)
NoScriptsFound.TextSize = 20.000

-- Scripts:

local function ODBXNA_fake_script() -- Executor.LocalScript 
	opened = false

	Executor.MouseButton1Click:Connect(function()
		if opened == false then
			Executor.Parent.Parent.ButtonUIs.Executor.Visible = true
			Executor.Parent.Parent.ButtonUIs.Executor:TweenPosition(UDim2.new(0.308, 0,0.262, 0), "Out", "Quint",1,true)
			opened = true
		else
			Executor.Parent.Parent.ButtonUIs.Executor:TweenPosition(UDim2.new(0.308, 0,1.262, 0), "Out", "Quint",1,true)
			wait(0.4)
			Executor.Parent.Parent.ButtonUIs.Executor.Visible = false
			opened = false
		end
	end)
end
coroutine.wrap(ODBXNA_fake_script)()
local function ZEEKHZC_fake_script()
	Execute.MouseButton1Click:Connect(
		function()
			assert(loadstring(Editor.Text))()
		end)
end
coroutine.wrap(ZEEKHZC_fake_script)()
local function EHTST_fake_script() -- Clear.LocalScript 
	Clear.MouseButton1Click:Connect(function()
		Editor.Text = ""
	end)
end
coroutine.wrap(EHTST_fake_script)()
local function VMPJDEN_fake_script() -- Executor_2.LocalScript 
	Executor_2.Active = true
	Executor_2.Draggable = true
	ScreenGui.ResetOnSpawn = false
end
coroutine.wrap(VMPJDEN_fake_script)()

-- search

assert(assert, "Assert couldn't assert itself! I think your computer might be broken.")

function createfolders(path)
	local pathtbl = string.split(path, "/")
	for i, v in pairs(pathtbl) do
		if i == 1 then
			if not isfolder(v) then
				makefolder(v)
			end
		else
			local newpath = pathtbl[1]
			for i2=2, i-1 do
				newpath = newpath.. "/" ..pathtbl[i2]
			end
			newpath = newpath.. "/" ..v
			if not isfolder(newpath) then
				makefolder(newpath)
			end
		end
	end
end

if not isfile("ScriptBlox/Searcher/Cache.json") and isfolder("ScriptBlox") then
	delfolder("ScriptBlox")
end

createfolders("ScriptBlox/Searcher/ImageCache/Scripts")
createfolders("ScriptBlox/Searcher/ImageCache/ProfilePictures")

if not isfile("ScriptBlox/Searcher/Cache.json") then
	writefile("ScriptBlox/Searcher/Cache.json", "{}")
end

ScreenGui.MainFrame.InfoBox.Visible = false

local getfakeasset = getcustomasset or getsynasset

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")

local cache = HttpService:JSONDecode(readfile("ScriptBlox/Searcher/Cache.json"))

local page = 1
local gquery = ""

function tableConcat(t1,t2)
	for i, v in pairs(t2) do
		table.insert(t1, v)
	end
	return t1
end

-- UI Conversion Fixes
ScreenGui.MainFrame.TopBarFrame.Title.RichText = true
ScreenGui.MainFrame.ScriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScreenGui.MainFrame.InfoBox.InfoBoxDescription.AutomaticSize = Enum.AutomaticSize.Y
ScreenGui.MainFrame.ScriptListFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.MainFrame.InfoBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments.ScrollBarImageColor3 = Color3.new(0, 0, 0)
ScreenGui.MainFrame.InfoBox.ScrollBarImageColor3 = Color3.new(0, 0, 0)

-- Templates
local VerifiedScript = ScreenGui.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Clone()
local Script = ScreenGui.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Clone()
ScreenGui.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Destroy()
ScreenGui.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Destroy()

local Comment = ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Clone()
ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Destroy()

-- Hover transition function
function setHoverTransition(from, to, obj)
	from = from or obj.BackgroundColor3

	obj.MouseEnter:Connect(function()

		TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
			BackgroundColor3 = to
		}):Play()

	end)

	obj.MouseLeave:Connect(function()

		TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
			BackgroundColor3 = from
		}):Play()

	end)
end

-- Info Box Hover Trabsitions
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScreenGui.MainFrame.InfoBox.Buttons.ExecuteButton)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScreenGui.MainFrame.InfoBox.Buttons.Close)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScreenGui.MainFrame.InfoBox.Buttons.CopyScriptBloxLink)
setHoverTransition(nil, Color3.new(0.152941, 0.188235, 0.345098), ScreenGui.MainFrame.InfoBox.Buttons.CopyScriptButton)

function _if(a, b, c)
	if a then return b else return c end
end

function fastmodeExec(func)
	if getgenv().fastmode == true then
		task.spawn(func)
	else
		func()
	end
end

-- fetchScripts function
function fetchScripts(query, page)
    page = page or 1
    query = HttpService:UrlEncode(query)
    local url = _if(query == "", "https://www.scriptblox.com/api/script/fetch?page="..tostring(page), "https://scriptblox.com/api/script/search?q="..query.."&max=100&mode=free&page=".. tostring(page))
    
    -- Add error handling for the HTTP request
    local success, response = pcall(function()
        return game:HttpGetAsync(url)
    end)
    
    if not success then
        warn("HTTP request failed: " .. tostring(response))
        return {}
    end
    
    -- Add error handling for JSON parsing
    local success, result = pcall(function()
        return HttpService:JSONDecode(response)
    end)
    
    if not success then
        warn("Failed to parse JSON: " .. tostring(result))
        return {}
    end
    
    -- Check if result and result.result and result.result.scripts exist
    if not result or not result.result or not result.result.scripts then
        warn("Invalid response structure")
        return {}
    end
    
    return result.result.scripts
end

function fetchComments(scriptId, page)
    page = page or 1    
    local url = "https://scriptblox.com/api/comment/" ..scriptId.. "?page=" ..tostring(page).. "&max=20"
    
    local success, response = pcall(function()
        return game:HttpGetAsync(url)
    end)
    
    if not success then
        warn("HTTP request failed: " .. tostring(response))
        return {}
    end
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(response)
    end)
    
    if not success then
        warn("Failed to parse JSON: " .. tostring(result))
        return {}
    end
    
    if not result or not result.result or not result.result.comments then
        warn("Invalid response structure")
        return {}
    end
    
    return result.result.comments
end

function fetchComments(scriptId, page)
    page = page or 1    
    local url = "https://scriptblox.com/api/comment/" ..scriptId.. "?page=" ..tostring(page).. "&max=20"
    
    -- Add error handling for the HTTP request
    local success, response = pcall(function()
        return game:HttpGetAsync(url)
    end)
    
    if not success then
        warn("HTTP request failed: " .. tostring(response))
        return {}
    end
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(response)
    end)
    
    if not success then
        warn("Failed to parse JSON: " .. tostring(result))
        return {}
    end
    
    if not result or not result.result or not result.result.comments then
        warn("Invalid response structure")
        return {}
    end
    
    return result.result.comments
end


function loadImage(url, id, ispfp)
	ispfp = _if(type(ispfp) == "boolean", ispfp, false)

	local path = "ScriptBlox/Searcher/ImageCache/" .._if(ispfp, "ProfilePictures/", "Scripts/")..id..".png"

	if table.find(string.split(url, "/"), "user-default.png") then
		path = "ScriptBlox/Searcher/ImageCache/ProfilePictures/user-default.png"
	end

	if isfile(path) then
		return getfakeasset(path)
	else
		local img = game:HttpGetAsync(url)
		writefile(path, img)

		return getfakeasset(path)
	end
end

function fixScript(scriptObj)
	if not scriptObj["script"] or not scriptObj["owner"] or not scriptObj["features"] then
		local cacheObj = cache[scriptObj["_id"]]
		if cacheObj then
			scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], cacheObj.script)
			scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], cacheObj.features)
			scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], cacheObj.owner)
		else
			local req = HttpService:JSONDecode(game:HttpGetAsync("https://www.scriptblox.com/api/script/".. scriptObj.slug)).script
			scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], req.script)
			scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], req.features)
			scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], req.owner)

			cache[scriptObj["_id"]] = req
		end
	end
	return scriptObj
end

function updateCache(newCache)
	cache = newCache
	writefile("ScriptBlox/Searcher/Cache.json", HttpService:JSONEncode(cache))
end

function updateInfoBox(scriptObj)
    scriptObj = fixScript(scriptObj)

    ScreenGui.MainFrame.InfoBox.Info.Author.InfoBoxAuthor.Text = scriptObj.owner.username
    ScreenGui.MainFrame.InfoBox.Info.Title.InfoBoxTitle.Text = scriptObj.title
    ScreenGui.MainFrame.InfoBox.Info.Game.Text = scriptObj.game.name

    task.spawn(function()
        ScreenGui.MainFrame.InfoBox.Info.Author.ProfilePicture.Image = loadImage("https://scriptblox.com"..scriptObj.owner.profilePicture, scriptObj["owner"]["_id"], true)
    end)
    task.spawn(function()
        ScreenGui.MainFrame.InfoBox.Info.PreviewImage.Image = loadImage(_if(string.find(scriptObj.game.imageUrl, "rbxcdn.com"), scriptObj.game.imageUrl, "https://scriptblox.com"..scriptObj.game.imageUrl), scriptObj["_id"], false)
    end)

    local ExecuteConnection
    local CopyLinkConnection
    local CopyScriptConnection

    ExecuteConnection = ScreenGui.MainFrame.InfoBox.Buttons.ExecuteButton.MouseButton1Click:Connect(function()
        loadstring(scriptObj.script)()
    end)

    CopyLinkConnection = ScreenGui.MainFrame.InfoBox.Buttons.CopyScriptBloxLink.MouseButton1Click:Connect(function()
        setclipboard("https://scriptblox.com/script/".. scriptObj.slug)
    end)

    CopyScriptConnection = ScreenGui.MainFrame.InfoBox.Buttons.CopyScriptButton.MouseButton1Click:Connect(function()
        toClipboard(scriptObj.script)
    end)

    ScreenGui.MainFrame.InfoBox.Buttons.Close.MouseButton1Click:Connect(function()
        ExecuteConnection:Disconnect()
        CopyLinkConnection:Disconnect()
        CopyScriptConnection:Disconnect()

        ScreenGui.MainFrame.InfoBox.Visible = false
        ScreenGui.MainFrame.ScriptListFrame.Visible = true
    end)

    local commentsUIListLayout = ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments.UIListLayout:Clone()
    ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments:ClearAllChildren()
    commentsUIListLayout.Parent = ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments

    task.spawn(function()
        local success, comments = pcall(function()
            return fetchComments(scriptObj["_id"])
        end)
        
        if not success or not comments then
            warn("Failed to fetch comments: " .. tostring(comments))
            return
        end
        
        for _, v in pairs(comments) do
            if v and v.text and v.commentBy and v.commentBy.username and v.commentBy.profilePicture and v.commentBy["_id"] then
                local newComment = Comment:Clone()
                newComment.Parent = ScreenGui.MainFrame.InfoBox.Comments.Inner.Comments
                newComment.Content.Text = v.text
                newComment.Author.Text = v.commentBy.username

                task.spawn(function()
                    pcall(function()
                        newComment.ProfilePicture.Image = loadImage("https://scriptblox.com"..v.commentBy.profilePicture, v.commentBy["_id"], true)
                    end)
                end)
            end
        end
    end)
    
    if scriptObj.features and scriptObj.features.description then
        ScreenGui.MainFrame.InfoBox.InfoBoxDescription.Text = scriptObj.features.description
    else
        ScreenGui.MainFrame.InfoBox.InfoBoxDescription.Text = "No description available."
    end
end

-- Refresh Scripts Browser with new scripts
function refreshScripts(scriptTbl)
	if #scriptTbl <= 0 then
		ScreenGui.MainFrame["No Scripts Found"].Visible = true
		return
	else
		ScreenGui.MainFrame["No Scripts Found"].Visible = false
	end

	local UIGridLayoutCopy = ScreenGui.MainFrame.ScriptListFrame.Scripts.UIGridLayout:Clone()
	ScreenGui.MainFrame.ScriptListFrame.Scripts:ClearAllChildren()
	UIGridLayoutCopy.Parent = ScreenGui.MainFrame.ScriptListFrame.Scripts

	addScripts(scriptTbl)
end

function addScripts(scriptTbl)
	for i, v in pairs(scriptTbl) do
		fastmodeExec(function()
			local newScript

			v = fixScript(v)

			if v.verified == true then
				newScript = VerifiedScript:Clone()
				newScript.ScriptTitle.Text = v.title
				newScript.ScriptAuthor.Text = "by ".. v.owner.username
				newScript.ScriptGame.Text = v.game.name
				newScript.Parent = ScreenGui.MainFrame.ScriptListFrame.Scripts
			else
				newScript = Script:Clone()
				newScript.ScriptTitle.Text = v.title
				newScript.ScriptAuthor.Text = "by ".. v.owner.username
				newScript.ScriptGame.Text = v.game.name
				newScript.Parent = ScreenGui.MainFrame.ScriptListFrame.Scripts
			end

			-- Execute Button
			newScript.ExecuteButton.MouseButton1Click:Connect(function()
				loadstring(v.script)()
			end)



			-- Info Button
			newScript.InfoButton.MouseButton1Click:Connect(function()
				updateInfoBox(v)
				task.wait()
				ScreenGui.MainFrame.InfoBox.Visible = true
				ScreenGui.MainFrame.ScriptListFrame.Visible = false
			end)


			-- Background

		end)
	end

	updateCache(cache)

	pagefetchrunning = false
end



-- Search Bar
ScreenGui.MainFrame.TopBarFrame.SearchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		gquery = ScreenGui.MainFrame.TopBarFrame.SearchBox.Text
		page = 1
		local scriptsTbl = fetchScripts(ScreenGui.MainFrame.TopBarFrame.SearchBox.Text, 1)
		refreshScripts(scriptsTbl)
	end
end)


-- Clear Cache
ScreenGui.MainFrame.TopBarFrame.ClearCacheButton.MouseButton1Click:Connect(function()
	updateCache({})
	for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/ProfilePictures")) do
		delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/ProfilePictures/"..v))
	end
	for _, v in pairs(listfiles("ScriptBlox/Searcher/ImageCache/Scripts")) do
		delfile(_if(string.find(v, "ScriptBlox"), v, "ScriptBlox/Searcher/ImageCache/Scripts/"..v))
	end
end)
setHoverTransition(nil, Color3.new(0.254902, 0.317647, 0.576471), ScreenGui.MainFrame.TopBarFrame.ClearCacheButton)

-- Dragging
local UserInputService = game:GetService("UserInputService")
local gui = ScreenGui.MainFrame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

ScreenGui.MainFrame.ScriptListFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	if (ScreenGui.MainFrame.ScriptListFrame.CanvasPosition.Y + ScreenGui.MainFrame.ScriptListFrame.AbsoluteSize.Y) >= ScreenGui.MainFrame.ScriptListFrame.AbsoluteCanvasSize.Y -200 and not pagefetchrunning then
		page = page + 1
		pagefetchrunning = true
		addScripts(fetchScripts(gquery, page))
	end
end)

Comments.Position = UDim2.new(0.0205762573, 0, 0.720532486, 0)
Buttons.Position = UDim2.new(0.0267489702, 0, .582198629, 0)

MainFrame.Visible = true
MainFrame:TweenPosition(UDim2.new(0.308, 0,0.262, 0), "Out", "Quint",1,true)

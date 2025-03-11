--[=[
	created by nullified_404
	modified by thuarnel

	nameless admin experimental
]=]--

local env = type(getgenv) == 'function' and getgenv()

if type(env) == 'table' and type(env.stop_nameless_admin) == 'function' then
	print('[PG] Stopping previous instance of Nameless Admin...')
	env.stop_nameless_admin()
end

local insert = table.insert
local instances = {}
local connections = {}
local break_all_loops = false

local function connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(connections, connection)
    return connection
end

local function na_caller(callback)
	local success, response = pcall(callback)
	if success == false and type(response) == 'string' then
		warn('[NA]: Script Error: ' .. response)
	end
end

local na_begin = tick()
na_caller(function() getgenv().RealNamelessLoaded=true end)
na_caller(function() getgenv().NATestingVer=true end)
local current_version = '2.3'
local primary_name = 'Nameless Admin'
local admin_name = 'NA'

if not gethui then
	getgenv().gethui=function()
		local h=(game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui") or game:GetService("CoreGui") or player:FindFirstChild("PlayerGui"))
		return h
	end
end

if identifyexecutor()=="Solara" or not fireproximityprompt then -- proximity prompt fix | Credits: Benomat (https://scriptblox.com/u/benomat)
	getgenv().fireproximityprompt=function(pp)
		local oldenabled=pp.Enabled
		local oldhold=pp.HoldDuration
		local oldrlos=pp.RequiresLineOfSight
		pp.Enabled=true
		pp.HoldDuration=0
		pp.RequiresLineOfSight=false
		wait(.23)
		pp:InputHoldBegin()
		task.wait()
		pp:InputHoldEnd()
		wait(.1)
		pp.Enabled=pp.Enabled
		pp.HoldDuration=pp.HoldDuration
		pp.RequiresLineOfSight=pp.RequiresLineOfSight
	end
end

na_storage = Instance.new("ScreenGui")
table.insert(instances, na_storage)

if not game:IsLoaded() then
	local waiting = Instance.new("Message")
	waiting.Parent = iamcore
	waiting.Text = admin_name..' is waiting for the game to load'
	while not game:IsLoaded() do
		wait()
	end
	waiting:Destroy()
end
local loader=''
if getgenv().NATestingVer then
	loader=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/NA%20testing.lua"))();]]
else
	loader=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))();]]
end
local queueteleport=(syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or function() end

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

local function send_notification(txt,dur,naem)
	if not dur then dur=5 end
	if not naem then naem=admin_name end
	Notify({
		Description=txt;
		Title=naem;
		Duration=dur;
	});
end

wait();--added wait due to the Http being a bit delayed on returning (should fix the issue where Nameless Admin wouldn't load sometimes)

--Custom file functions checker checker
local CustomFunctionSupport=isfile and isfolder and writefile and readfile and listfiles;
local FileSupport=isfile and isfolder and writefile and readfile and makefolder;

--Creates folder & files for Prefix & Plugins
if FileSupport then
	if not isfolder('Nameless-Admin') then
		makefolder('Nameless-Admin')
	else
	end

	if not isfile("Nameless-Admin/Prefix.txt") then
		writefile("Nameless-Admin/Prefix.txt",';')
	else
	end
end
local file_prefix = ';'
if FileSupport then
	file_prefix = readfile("Nameless-Admin/Prefix.txt",';')
	if file_prefix:match("[a-zA-Z0-9]") then
		file_prefix = ';'
		writefile('nameless-admin/prefix.txt', ';')
		send_notification('Prefix reset due to invalid characters')
	end
else
	file_prefix = ';'
	send_notification('Your scripting environment does not support \'readfile\'')
end

local options = { prefix = ';', tuple_separator = ',', ui = {}, binds = {} }
local update_logs = {
	['3/11/2025'] = {'Made some major changes to how the script functions internally.'}
}
local last_updated = '3/11/2025'

--[=[ SERVICES ]=]--

local players = game:GetService('Players')
local coregui = game:GetService('CoreGui')
local runservice = game:GetService('RunService')
local httpservice = game:GetService('HttpService')
local tweenservice = game:GetService('TweenService')
local userinputservice = game:GetService('UserInputService')

--[[ VARIABLES ]]--

local find = table.find
local insert = table.insert

local platform = 'PC'
local pltfm = userinputservice:GetPlatform()
local mobile = {Enum.Platform.IOS, Enum.Platform.Android}
-- local pc = {Enum.Platform.Windows, Enum.Platform.UWP, Enum.Platform.Linux, Enum.Platform.SteamOS, Enum.Platform.OSX, Enum.Platform.Chromecast, Enum.Platform.WebOS}

if find(mobile, pltfm) or userinputservice.TouchEnabled then
	platform = 'mobile'
else
	pltfm = 'pc'
end

local sethiddenproperty = env.sethiddenproperty or env.set_hidden_property or env.set_hidden_prop

local player = players.LocalPlayer
local mouse = player:GetMouse()
local player_gui = player:FindFirstChildWhichIsA('PlayerGui')
local character, humanoid, rootpart

function new_character()
	character = player.Character
	while typeof(humanoid) ~= 'Instance' do
		if break_all_loops then
			break
		end
		humanoid = character and character:FindFirstChildWhichIsA('Humanoid')
		wait()
	end
	while typeof(rootpart) ~= 'Instance' do
		if break_all_loops then
			break
		end
		rootpart = humanoid.RootPart
		wait()
	end
end

new_character()
connect(player.CharacterAdded, new_character)

local Clicked=true
local LegacyChat=game:GetService("TextChatService").ChatVersion==Enum.ChatVersion.LegacyChatService
_G.Spam=false
--[[ FOR LOOP COMMANDS ]]--
local view=false
local control=false
local FakeLag=false
local Loopvoid=false
local loopgrab=false
local Loopstand=false
local Looptornado=false
local Loopmute=false
local Loopglitch=false
local OrgDestroyHeight = game:GetService("Workspace").FallenPartsDestroyHeight
local Watch=false
local Admin={}
_G.NAadminsLol={
	530829101;--Viper
	229501685;--legshot
	817571515;--Aimlock
	144324719;--Cosmic
	1844177730;--glexinator
	2624269701;--Akim
	2502806181; -- null
	1594235217; -- Purple
}

--[[ Some more variables ]]--

local control_module 

pcall(function()
	control_module = require(player:FindFirstChildOfClass("PlayerScripts"):WaitForChild('PlayerModule', 5):WaitForChild("ControlModule", 5))
end)

local bringc = {}
local msg = { 'Hey', 'Hello', 'Hi', 'Greetings', 'Good day', 'What\'s up' }
local goof_msgs = {
	"Egg",
	"i am a goofy goober",
	"mmmm lasagna",
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
	"i am wondering if i even have a life",
	"[REDACTED]",
	"hey guys welcome to another video",
	"⚠️⚠️⚠️",
	":-(",
	"(╯°□°)╯︵ ┻━┻",
	"freaky",
	"unreal",
	"💀💀💀",
	"X_X",
	"not bothered to add a message here",
	"bruh moment",
	"yeet",
	"no cap fr fr",
	"sus",
	"vibing in the ritz car",
	"keyboard go brrrrr",
	"404: brain not found",
	"loading personality.exe",
	"oof size large",
	"this ain't it chief",
	"weird flex but ok",
	"poggers",
	"sheeeesh",
	"i forgor 💀",
	"touch grass"
}

--[[ Prediction ]]--
function levenshtein(s,t)
	local d={}
	local lenS,lenT=#s,#t
	for i=0,lenS do
		d[i]={}
		d[i][0]=i
	end
	for j=0,lenT do
		d[0][j]=j
	end
	for i=1,lenS do
		for j=1,lenT do
			local cost=(s:sub(i,i)==t:sub(j,j)) and 0 or 1
			d[i][j]=math.min(d[i-1][j]+1,d[i][j-1]+1,d[i-1][j-1]+cost)
		end
	end
	return d[lenS][lenT]
end

function correct_argument(arg)
	local closer=nil
	local min=math.huge

	for cmd in pairs(commands) do
		local j=levenshtein(arg,cmd)
		if j<min then
			min=j
			closer=cmd
		end
	end

	for alias in pairs(aliases) do
		local j=levenshtein(arg,alias)
		if j<min then
			min=j
			closer=alias
		end
	end

	return closer
end

function isRelAdmin(Player)
	for _,id in ipairs(_G.NAadminsLol) do
		if id==player.UserId then
			return false
		elseif Player.UserId==id then
			return true
		end
	end
	return false
end

function loadedResults(res)
	if res == nil or type(res) ~= "number" then 
		res = 0 
	end

	local sec = tonumber(res)
	local isNegative = sec < 0

	if isNegative then
		sec = math.abs(sec)
	end

	local days = math.floor(sec / 86400)
	local hr = math.floor((sec % 86400) / 3600)
	local min = math.floor((sec % 3600) / 60)
	local remain = sec % 60
	local ms = math.floor((remain % 1) * 1000)
	remain = math.floor(remain)

	local format = ''

	if days > 0 then
		format = string.format("%d:%02d:%02d:%02d.%03d | Days,Hours,Minutes,Seconds.Milliseconds", 
			days, hr, min, remain, ms)
	elseif hr > 0 then
		format = string.format("%d:%02d:%02d.%03d | Hours,Minutes,Seconds.Milliseconds", 
			hr, min, remain, ms)
	elseif min > 0 then
		format = string.format("%d:%02d.%03d | Minutes,Seconds.Milliseconds", 
			min, remain, ms)
	else
		format = string.format("%d.%03d | Seconds.Milliseconds", 
			remain, ms)
	end

	if isNegative then
		format = "-" .. format
	end

	return format
end


--[[ COMMAND FUNCTIONS ]]--

local commands = {}
local aliases = {}

local command_count = 0
local cmd = {}

function cmd.add(...)
	local aliases, information, callback = unpack({...})
	for x, command in pairs(aliases) do
		if type(command) == 'string' then
			if x == 1 then
				commands[command:lower()] = { callback, information }
			else
				aliases[command:lower()] = { callback, information }
			end
		end
	end
	command_count += 1
end

function cmd.run(arguments)
	local caller, arguments = args[1], args
	table.remove(arguments, 1)
	local success, response = pcall(function()
		local command = commands[caller:lower()] or aliases[caller:lower()]
		if type(command) == 'table' and type(command[1]) == 'function' then
			command[1](unpack(arguments))
		else
			local closest = correct_argument(caller:lower())
			if type(closest) == 'string' then
				send_notification("Command [ "..caller.." ] doesn't exist\nDid you mean [ "..closest.." ]?")
			end
		end
	end)
	if success ~= true then
		warn(admin_name .. ': ' .. msg)
	end
end

function random_string()
	local length = math.random(10, 20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32,126))
	end
	return table.concat(array)
end

function na_protection(inst, var)
	if inst then
		if var then
			inst[var] = '\0'
			inst.Archivable = false
		else
			inst.Name = '\0'
			inst.Archivable = false
		end
	end
end

na_storage.Name = random_string()
na_storage.Parent = iamcore

local lib = {}

function lib.wrap(f)
	return coroutine.wrap(f)()
end

local wrap = lib.wrap
local wait = function(int)
	if type(int) ~= 'number' then
		int = 0
	end
	local t = tick()
	local x = 0
	repeat
		runservice.Heartbeat:Wait()
		x = (tick() - t)
	until x >= int
	return x, t
end

function getRoot(char)
	local rootPart=char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function getChar()
	return player.Character
end

function getPlrChar(plr)
	local isChar=players[plr].Character
	if isChar then
		return isChar
	else
		return false
	end
end

function getBp()
	return player:FindFirstChildOfClass("Backpack")
end

function getHum()
	if player and getChar() and getChar():FindFirstChildOfClass("Humanoid") then
		return getChar():FindFirstChildOfClass("Humanoid")
	else
		return false
	end
end

function getPlrHum(plr)
	if plr and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
		return plr.Character:FindFirstChildOfClass("Humanoid")
	else
		return false
	end
end

function isNumber(str)
	if tonumber(str)~=nil or str=='inf' then
		return true
	end
end

function FindInTable(tbl,val)
	if tbl==nil then return false end
	for _,v in pairs(tbl) do
		if v==val then return true end
	end 
	return false
end

function GetInTable(Table,Name)
	for i=1,#Table do
		if Table[i]==Name then
			return i
		end
	end
	return false
end

--[[ FUNCTION TO GET A PLAYER ]]--
local getPlr=function(Name)
	if Name:lower()=="random" then
		return players:GetPlayers()[math.random(#players:GetPlayers())]
	elseif Name:lower()=="me" then
		return player
	elseif not Name or Name=='' then
		return player
	elseif Name:lower()=="friends" then
		local friends={}
		for _,plr in pairs(players:GetPlayers()) do
			if plr:IsFriendsWith(LocalPlayer.UserId) and plr~=LocalPlayer then
				table.insert(friends,plr)
			end
		end
		return friends
	elseif Name:lower()=="nonfriends" then
		local noFriends={}
		for _,plr in pairs(players:GetPlayers()) do
			if not plr:IsFriendsWith(LocalPlayer.UserId) and plr~=LocalPlayer then
				table.insert(noFriends,plr)
			end
		end
		return noFriends
	elseif Name:lower()=="enemies" then
		local nonTeam={}
		local team=LocalPlayer.Team
		for _,plr in pairs(players:GetPlayers()) do
			if plr.Team~=team then
				table.insert(nonTeam,plr)
			end
		end
		return nonTeam
	elseif Name:lower()=="allies" then
		local teamBuddies={}
		local team=LocalPlayer.Team
		for _,plr in pairs(players:GetPlayers()) do
			if plr.Team==team then
				table.insert(teamBuddies,plr)
			end
		end
		return teamBuddies
	else
		Name=Name:lower():gsub("%s","")
		for _,x in next,players:GetPlayers() do
			if x.Name:lower():match(Name) then
				return x
			elseif x.DisplayName:lower():match("^"..Name) then
				return x
			end
		end
	end
end

local ESPenabled=false


function round(num,numDecimalPlaces)
	local mult=10^(numDecimalPlaces or 0)
	return math.floor(num*mult+0.5) / mult
end

local function placeName()
	local page = game:GetService("AssetService"):GetGamePlacesAsync()
	while true do
		if break_all_loops then
			break
		end
		for _,place in ipairs(page:GetCurrentPage()) do
			if place.PlaceId==PlaceId then
				return place.Name
			end
		end
		if page.IsFinished then
			break
		end
		page:AdvanceToNextPageAsync()
	end
	return 'unknown'
end

function removeESP()
	for i,c in pairs(COREGUI:GetChildren()) do
		if string.sub(c.Name,-4)=='_ESP' then
			c:Destroy()
		end
	end
end

function ESP(plr)
	task.spawn(function()
		for i,v in pairs(COREGUI:GetChildren()) do
			if v.Name==plr.Name..'_ESP' then
				v:Destroy()
			end
		end
		wait()

		local function makeESP()
			if plr.Character and plr.Name~=player.Name and not COREGUI:FindFirstChild(plr.Name..'_ESP') then
				local ESPholder=Instance.new("Folder")
				ESPholder.Name=plr.Name..'_ESP'
				ESPholder.Parent=COREGUI
				repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")

				local a=Instance.new("Highlight")
				a.Name=plr.Name
				a.Parent=ESPholder
				a.Adornee=plr.Character
				a.FillTransparency=0.45
				a.FillColor=Color3.fromRGB(0,255,0)

				if plr.Character and plr.Character:FindFirstChild('Head') then
					local BillboardGui=Instance.new("BillboardGui")
					local TextLabel=Instance.new("TextLabel")
					BillboardGui.Adornee=plr.Character:FindFirstChild("Head")
					BillboardGui.Name=plr.Name
					BillboardGui.Parent=ESPholder
					BillboardGui.Size=UDim2.new(0,100,0,150)
					BillboardGui.StudsOffset=Vector3.new(0,1,0)
					BillboardGui.AlwaysOnTop=true
					TextLabel.Parent=BillboardGui
					TextLabel.BackgroundTransparency=1
					TextLabel.Position=UDim2.new(0,0,0,-50)
					TextLabel.Size=UDim2.new(0,100,0,100)
					TextLabel.Font=Enum.Font.SourceSansSemibold
					TextLabel.TextSize=17
					TextLabel.TextColor3=Color3.new(12,4,20)
					TextLabel.TextStrokeTransparency=0.3
					TextLabel.TextYAlignment=Enum.TextYAlignment.Bottom
					TextLabel.Text='@'..plr.Name..' | '..plr.DisplayName..''
					TextLabel.ZIndex=10

					local espLoopFunc
					espLoopFunc = connect(runservice.RenderStepped, function()
						if COREGUI:FindFirstChild(plr.Name..'_ESP') then
							if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and player.Character and getRoot(player.Character) and player.Character:FindFirstChildOfClass("Humanoid") then
								local pos=math.floor((getRoot(player.Character).Position-getRoot(plr.Character).Position).magnitude)
								TextLabel.Text='@'..plr.Name..' | '..plr.DisplayName ..' | Studs: '..pos
								a.Adornee=plr.Character
								BillboardGui.Adornee=plr.Character:FindFirstChild("Head")
							end
						else
							espLoopFunc:Disconnect()
						end
					end)

					ESPholder:SetAttribute("LoopConnection", true)
				end
			end
		end

		makeESP()

		local addedConnection
		addedConnection = connect(plr.CharacterAdded, function()
			if not ESPenabled then
				addedConnection:Disconnect()
				return
			end

			for i,v in pairs(COREGUI:GetChildren()) do
				if v.Name==plr.Name..'_ESP' then
					v:Destroy()
				end
			end

			task.wait(1)

			makeESP()
		end)

		if COREGUI:FindFirstChild(plr.Name..'_ESP') then
			COREGUI:FindFirstChild(plr.Name..'_ESP'):SetAttribute("AddedConnection", true)
		end
	end)
end



local Signal1,Signal2=nil,nil
local flyMobile=nil
local MobileWeld=nil

function x(v)
	if v then
		for _,i in pairs(game:GetService("Workspace"):GetDescendants()) do
			if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
				i.LocalTransparencyModifier=0.5
			end
		end
	else
		for _,i in pairs(game:GetService("Workspace"):GetDescendants()) do
			if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
				i.LocalTransparencyModifier=0
			end
		end
	end
end

local cmdlp=player

plr=cmdlp

local cmdm=plr:GetMouse()
local goofyFLY=nil
function sFLY(vfly)
	while not cmdlp or not cmdlp.Character or not cmdlp.Character:FindFirstChild('HumanoidRootPart') or not cmdlp.Character:FindFirstChild('Humanoid') or not cmdm do
		wait()
	end 
	if goofyFLY then goofyFLY:Destroy() end
	goofyFLY=Instance.new("Part",game:GetService("Workspace"))
	goofyFLY.Name=random_string()
	goofyFLY.Size, goofyFLY.CanCollide = Vector3.new(0.05, 0.05, 0.05), false
	local CONTROL={F=0,B=0,L=0,R=0,Q=0,E=0}
	local lCONTROL={F=0,B=0,L=0,R=0,Q=0,E=0}
	local SPEED=0
	function FLY()
		FLYING=true
		local BG=Instance.new('BodyGyro',goofyFLY)
		local BV=Instance.new('BodyVelocity',goofyFLY)
		local Weld=Instance.new("Weld",goofyFLY)
		BG.Name=random_string()
		BV.Name=random_string()
		Weld.Name=random_string()
		Weld.Part0, Weld.Part1, Weld.C0 = goofyFLY, cmdlp.Character:FindFirstChildWhichIsA("Humanoid").RootPart, CFrame.new(0, 0, 0)
		BG.P=9e4
		BG.maxTorque=Vector3.new(9e9,9e9,9e9)
		BG.cframe=goofyFLY.CFrame
		BV.velocity=Vector3.new(0,0,0)
		BV.maxForce=Vector3.new(9e9,9e9,9e9)
		spawn(function()
			while FLYING do
				if not vfly then
					cmdlp.Character:FindFirstChild("Humanoid").PlatformStand=true
				end
				if CONTROL.L+CONTROL.R~=0 or CONTROL.F+CONTROL.B~=0 or CONTROL.Q+CONTROL.E~=0 then
					SPEED=50
				elseif not (CONTROL.L+CONTROL.R~=0 or CONTROL.F+CONTROL.B~=0 or CONTROL.Q+CONTROL.E~=0) and SPEED~=0 then
					SPEED=0
				end
				if (CONTROL.L+CONTROL.R)~=0 or (CONTROL.F+CONTROL.B)~=0 or (CONTROL.Q+CONTROL.E)~=0 then
					BV.velocity=((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector*(CONTROL.F+CONTROL.B))+((game:GetService("Workspace").CurrentCamera.CoordinateFrame*CFrame.new(CONTROL.L+CONTROL.R,(CONTROL.F+CONTROL.B+CONTROL.Q+CONTROL.E)*0.2,0).p)-game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*SPEED
					lCONTROL={F=CONTROL.F,B=CONTROL.B,L=CONTROL.L,R=CONTROL.R}
				elseif (CONTROL.L+CONTROL.R)==0 and (CONTROL.F+CONTROL.B)==0 and (CONTROL.Q+CONTROL.E)==0 and SPEED~=0 then
					BV.velocity=((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector*(lCONTROL.F+lCONTROL.B))+((game:GetService("Workspace").CurrentCamera.CoordinateFrame*CFrame.new(lCONTROL.L+lCONTROL.R,(lCONTROL.F+lCONTROL.B+CONTROL.Q+CONTROL.E)*0.2,0).p)-game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*SPEED
				else
					BV.velocity=Vector3.new(0,0,0)
				end
				BG.cframe=game:GetService("Workspace").CurrentCamera.CoordinateFrame
				wait()
			end
			CONTROL={F=0,B=0,L=0,R=0,Q=0,E=0}
			lCONTROL={F=0,B=0,L=0,R=0,Q=0,E=0}
			SPEED=0
			BG:destroy()
			BV:destroy()
			cmdlp.Character.Humanoid.PlatformStand=false
		end)
	end
	cmdm.KeyDown:connect(function(KEY)
		if KEY:lower()=='w' then
			if vfly then
				CONTROL.F=speedofthevfly
			else
				CONTROL.F=speedofthefly
			end
		elseif KEY:lower()=='s' then
			if vfly then
				CONTROL.B=-speedofthevfly
			else
				CONTROL.B=-speedofthefly
			end
		elseif KEY:lower()=='a' then
			if vfly then
				CONTROL.L=-speedofthevfly
			else
				CONTROL.L=-speedofthefly
			end
		elseif KEY:lower()=='d' then
			if vfly then
				CONTROL.R=speedofthevfly
			else
				CONTROL.R=speedofthefly
			end
		elseif KEY:lower()=='y' then
			if vfly then
				CONTROL.Q=speedofthevfly*2
			else
				CONTROL.Q=speedofthefly*2
			end
		elseif KEY:lower()=='t' then
			if vfly then
				CONTROL.E=-speedofthevfly*2
			else
				CONTROL.E=-speedofthefly*2
			end
		end
	end)
	cmdm.KeyUp:connect(function(KEY)
		if KEY:lower()=='w' then
			CONTROL.F=0
		elseif KEY:lower()=='s' then
			CONTROL.B=0
		elseif KEY:lower()=='a' then
			CONTROL.L=0
		elseif KEY:lower()=='d' then
			CONTROL.R=0
		elseif KEY:lower()=='y' then
			CONTROL.Q=0
		elseif KEY:lower()=='t' then
			CONTROL.E=0
		end
	end)
	FLY()
end


local tool=nil
spawn(function()
	repeat wait() until getChar()
	tool=getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool") or nil
end)

function attachTool(tool,cf)
	for i,v in pairs(tool:GetDescendants()) do
		if not (v:IsA("BasePart") or v:IsA("Mesh") or v:IsA("SpecialMesh")) then
			v:Destroy()
		end
	end
	wait()
	getChar().Humanoid.Name=1
	local l=getChar()["1"]:Clone()
	l.Parent=getChar()
	l.Name="Humanoid"

	getChar()["1"]:Destroy()
	game:GetService("Workspace").CurrentCamera.CameraSubject=getChar()
	getChar().Animate.Disabled=true
	wait();
	getChar().Humanoid.DisplayDistanceType="None"

	tool.Parent=getChar()
end

local nc=false
local ncLoop=nil
ncLoop=runservice.Stepped:Connect(function()
	if nc and getChar()~=nil then
		for _,v in pairs(getChar():GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide==true then
				v.CanCollide=false
			end
		end
	end
end)

local netsleepTargets={}
local nsLoop=nil
nsLoop=runservice.Stepped:Connect(function()
	if #netsleepTargets==0 then return end
	for i,v in pairs(netsleepTargets) do
		if v.Character then
			for i,v in pairs(v.Character:GetChildren()) do
				if v:IsA("BasePart")==false and v:IsA("Accessory")==false then continue end
				if v:IsA("BasePart") then
					sethiddenproperty(v,"NetworkIsSleeping",true)
				elseif v:IsA("Accessory") and v:FindFirstChild("Handle") then
					sethiddenproperty(v.Handle,"NetworkIsSleeping",true)
				end
			end
		end
	end
end)

local lp=player


--[[ LIB FUNCTIONS ]]--
chatmsgshooks={}
Playerchats={}

lib.LocalPlayerChat=function(...)
	local args={...} 
	if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
		local sendto=game:GetService("TextChatService").TextChannels.RBXGeneral
		if args[2]~=nil and  args[2]~="All"  then
			if not Playerchats[args[2]] then
				for i,v in pairs(game:GetService("TextChatService").TextChannels:GetChildren()) do
					if string.find(v.Name,"RBXWhisper:") then
						if v:FindFirstChild(args[2]) and v:FindFirstChild(player.Name) then
							if v[player.Name].CanSend==false then
								continue
							end
							sendto=v
							Playerchats[args[2]]=v
							break
						end
					end
				end
			else
				sendto=Playerchats[args[2]]
			end
			if sendto==game:GetService("TextChatService").TextChannels.RBXGeneral then
				chatmsgshooks[args[1]]={args[1],args}
				task.spawn(function()
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/w @"..args[2])
				end)
				return "Hooking"
			end
		end
		sendto:SendAsync(args[1] or "")
	else
		if args[2] and args[2]~="All" then
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..args[2].." "..args[1] or "","All")
		else
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(args[1] or "","All")
		end
	end
end

if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
	game:GetService("TextChatService").TextChannels.ChildAdded:Connect(function(v)
		if string.find(v.Name,"RBXWhisper:") then
			task.wait(1)
			for id,va in pairs(chatmsgshooks) do
				if v:FindFirstChild(va[1]) and v:FindFirstChild(player.Name) then
					if v[player.Name].CanSend==false then
						continue
					end
					Playerchats[va[1]]=v
					chatmsgshooks[id]=nil
					lib.LocalPlayerChat(va[2])
					break
				end
			end
		end
	end)
end

lib.lpchat=lib.LocalPlayerChat

lib.lock=function(instance,par)
	locks[instance]=true
	instance.Parent=par or instance.Parent
	instance.Name="RightGrip"
end
local lock=lib.lock
local locks={}

lib.find=function(t,v)	--mmmmmm
	for i,e in pairs(t) do
		if i==v or e==v then
			return i
		end
	end
	return nil
end

lib.parseText=function(text,watch,rPlr)
	local parsed={}
	if not text then return nil end
	local prefix
	if rPlr then
		prefix=isRelAdmin(rPlr) and ";" or watch
		watch=prefix
	else
		prefix=watch
	end
	for arg in text:gmatch("[^"..watch.."]+") do
		arg=arg:gsub("-","%%-")
		local pos=text:find(arg)
		arg=arg:gsub("%%","")
		if pos then
			local find=text:sub(pos-prefix:len(),pos-1)
			if (find==prefix and watch==prefix) or watch~=prefix then
				table.insert(parsed,arg)
			end
		else
			table.insert(parsed,nil)
		end
	end
	return parsed
end

lib.parse_command=function(text,rPlr)
	wrap(function()
		local commands
		if rPlr then
			commands=lib.parseText(text,options.prefix,rPlr)
		else
			commands=lib.parseText(text,options.prefix)
		end
		for _,parsed in pairs(commands) do
			local args={}
			for arg in parsed:gmatch("[^ ]+") do
				table.insert(args,arg)
			end
			cmd.run(args)
		end
	end)
end

local connections={}

lib.connect=function(name,connection)	--no :(
	connections[name..tostring(math.random(1000000,9999999))]=connection
	return connection
end

lib.disconnect=function(name)
	for title,connection in pairs(connections) do
		if title:find(name)==1 then
			connection:Disconnect()
		end
	end
end

local m=math			--prepare for annoying and unnecessary tool grip math
local rad=m.rad
local clamp=m.clamp
local sin=m.sin
local tan=m.tan
local cos=m.cos

--[[ PLAYER FUNCTIONS ]]--
local argument={}
argument.getPlayers=function(str)
	local playerNames,players=lib.parseText(str,options.tuple_separator),{}
	for _,arg in pairs(playerNames or {"me"}) do
		arg=arg:lower()
		local playerList=players:GetPlayers()
		if arg=="me" or arg==nil then
			table.insert(players,player)

		elseif arg=="all" then
			for _,plr in pairs(playerList) do
				table.insert(players,plr)
			end

		elseif arg=="others" then
			for _,plr in pairs(playerList) do
				if plr~=player then
					table.insert(players,plr)
				end
			end

		elseif arg=="random" then
			table.insert(players,playerList[math.random(1,#playerList)])

		elseif arg:find("%%")==1 then
			local teamName=arg:sub(2)
			for _,plr in pairs(playerList) do
				if tostring(plr.Team):lower():find(teamName)==1 then
					table.insert(players,plr)
				end
			end

		else
			for _,plr in pairs(playerList) do
				if plr.Name:lower():find(arg)==1 or (plr.DisplayName and plr.DisplayName:lower():find(arg)==1) or (tostring(plr.UserId):lower():find(arg)==1) then
					table.insert(players,plr)
				end
			end
		end
	end
	return players
end

--[=[ COMMAND LIST ]=]--

cmd.add({ 'resizechat', 'rc' }, { 'resizechat (rc)' }, 'Allows the chat to be resized', function()
	local legacy_chat_service = game:FindService('Chat')

	if legacy_chat_service then
		local chat_settings = select(2, pcall(function()
			return require(legacy_chat_service.ClientChatModules.ChatSettings)
		end))

		if type(chat_settings) == 'table' then
			chat_settings.WindowResizable = true
			chat_settings.WindowDraggable = true
		end
	end
end)

cmd.add({ 'tppos' }, { 'tppos [x] [y] [z] '}, 'Teleport to the given coordinates', function(x, y, z)
	if typeof(rootpart) == 'Instance' and rootpart:IsA('BasePart') then
		local position = rootpart.Position

		local x = tonumber(x) or position.X
		local y = x and tonumber(y) or position.Y
		local z = y and tonumber(z) or position.Z

		rootpart.Position = Vector3.new(x, y, z)
	end
end)

--[[ FUNCTIONALITY ]]--
player.Chatted:Connect(function(str)
	lib.parse_command(str)
end)

--[[ Admin Player]]
function IsAdminAndRun(Message,Player)
	if Admin[Player.UserId] or isRelAdmin(Player) then
		lib.parse_command(Message,Player)
	end
end

function CheckPermissions(Player)
	Player.Chatted:Connect(function(Message)
		IsAdminAndRun(Message,Player)
	end)
end

players.PlayerAdded:Connect(function(plr)
	CheckPermissions(plr)
end)
players.PlayerAdded:Connect(function(plr)
	if ESPenabled then
		repeat wait(1) until plr.Character
		ESP(plr)
	end
end)
for i,v in pairs(players:GetPlayers()) do
	if v~=LocalPlayer then
		CheckPermissions(v)
	end
end

--[[ GUI VARIABLES ]]--
local objects = assert(select(2, pcall(game.GetObjects, game, 'rbxassetid://140418556029404')), 'Failed to get objects.')
local ScreenGui = type(objects) == 'table' and objects[1]
local coreGuiProtection={}

if (get_hidden_gui or gethui) then
	local hiddenUI=(get_hidden_gui or gethui)
	local Main=ScreenGui
	--Main.Name=random_string()
	na_protection(Main)
	Main.Parent=hiddenUI()
elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	local Main=ScreenGui
	--Main.Name=random_string()
	na_protection(Main)
	syn.protect_gui(Main)
	Main.Parent=game:GetService("CoreGui")
elseif game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui") then
	pcall(function()
		for i,v in pairs(ScreenGui:GetDescendants()) do
			coreGuiProtection[v]=player.Name
		end
		ScreenGui.DescendantAdded:Connect(function(v)
			coreGuiProtection[v]=player.Name
		end)
		coreGuiProtection[ScreenGui]=player.Name

		local meta=getrawmetatable(game)
		local tostr=meta.__tostring
		setreadonly(meta,false)
		meta.__tostring=newcclosure(function(t)
			if coreGuiProtection[t] and not checkcaller() then
				return coreGuiProtection[t]
			end
			return tostr(t)
		end)
	end)
	if not runservice:IsStudio() then
		local newGui=game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui")
		newGui.DescendantAdded:Connect(function(v)
			coreGuiProtection[v]=player.Name
		end)
		for i,v in pairs(ScreenGui:GetChildren()) do
			v.Parent=newGui
		end
		ScreenGui=newGui
	end
elseif COREGUI then
	local Main=ScreenGui
	--Main.Name=random_string()
	na_protection(Main)
	Main.Parent=COREGUI
else
	warn'no guis?'
end
if ScreenGui then ScreenGui.DisplayOrder=9999 ScreenGui.ResetOnSpawn=false end

description=ScreenGui:FindFirstChild("Description");
cmdBar=ScreenGui:FindFirstChild("CmdBar");
centerBar=cmdBar:FindFirstChild("CenterBar");
cmdInput=centerBar:FindFirstChild("Input");
cmdAutofill=cmdBar:FindFirstChild("Autofill");
cmdExample=cmdAutofill:FindFirstChild("Cmd");
leftFill=cmdBar:FindFirstChild("LeftFill");
rightFill=cmdBar:FindFirstChild("RightFill");
chatLogsFrame=ScreenGui:FindFirstChild("ChatLogs");
chatLogs=chatLogsFrame:FindFirstChild("Container"):FindFirstChild("Logs");
chatExample=chatLogs:FindFirstChild("TextLabel");
commandsFrame=ScreenGui:FindFirstChild("Commands");
commandsFilter=commandsFrame:FindFirstChild("Container"):FindFirstChild("Filter");
commandsList=commandsFrame:FindFirstChild("Container"):FindFirstChild("List");
commandExample=commandsList:FindFirstChild("TextLabel");
UniverseViewerFrame=ScreenGui:FindFirstChild("UniverseViewer");
UniverseList=UniverseViewerFrame:FindFirstChild("Container"):FindFirstChild("List");
UniverseExample=UniverseList:FindFirstChildOfClass("TextButton");
UpdLogsFrame=ScreenGui:FindFirstChild("UpdLog");
UpdLogsTitle=UpdLogsFrame:FindFirstChild("Topbar"):FindFirstChild("TopBar"):FindFirstChild("Title");
UpdLogsList=UpdLogsFrame:FindFirstChild("Container"):FindFirstChild("List");
UpdLogsLabel=UpdLogsList:FindFirstChildOfClass("TextLabel");
ShiftlockUi=ScreenGui:FindFirstChild("LockButton");
resizeFrame=ScreenGui:FindFirstChild("Resizeable");
resizeXY={
    Top        ={Vector2.new(0,-1),    Vector2.new(0,-1),    "rbxassetid://2911850935"},
    Bottom    ={Vector2.new(0,1),    Vector2.new(0,0),    "rbxassetid://2911850935"},
    Left    ={Vector2.new(-1,0),    Vector2.new(1,0),    "rbxassetid://2911851464"},
    Right    ={Vector2.new(1,0),    Vector2.new(0,0),    "rbxassetid://2911851464"},

    TopLeft        ={Vector2.new(-1,-1),    Vector2.new(1,-1),    "rbxassetid://2911852219"},
    TopRight    ={Vector2.new(1,-1),    Vector2.new(0,-1),    "rbxassetid://2911851859"},
    BottomLeft    ={Vector2.new(-1,1),    Vector2.new(1,0),    "rbxassetid://2911851859"},
    BottomRight    ={Vector2.new(1,1),    Vector2.new(0,0),    "rbxassetid://2911852219"},
}

cmdExample.Parent=nil
chatExample.Parent=nil
commandExample.Parent=nil
UniverseExample.Parent=nil
UpdLogsLabel.Parent=nil
resizeFrame.Parent=nil

	--[[pcall(function()
		for i,v in pairs(ScreenGui:GetDescendants()) do
			coreGuiProtection[v]=player.Name
		end
		ScreenGui.DescendantAdded:Connect(function(v)
			coreGuiProtection[v]=player.Name
		end)
		coreGuiProtection[ScreenGui]=player.Name
	
		local meta=getrawmetatable(game)
		local tostr=meta.__tostring
		setreadonly(meta,false)
		meta.__tostring=newcclosure(function(t)
			if coreGuiProtection[t] and not checkcaller() then
				return coreGuiProtection[t]
			end
			return tostr(t)
		end)
	end)
	if not runservice:IsStudio() then
		local newGui=game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui")
		newGui.DescendantAdded:Connect(function(v)
			coreGuiProtection[v]=player.Name
		end)
		for i,v in pairs(ScreenGui:GetChildren()) do
			v.Parent=newGui
		end
		ScreenGui=newGui
	end]]

--[[ GUI FUNCTIONS ]]--
gui={}
gui.txtSize=function(ui,x,y)
	local textService=game:GetService("TextService")
	return textService:GetTextSize(ui.Text,ui.TextSize,ui.Font,Vector2.new(x,y))
end
gui.commands=function()
	if not commandsFrame.Visible then
		commandsFrame.Visible=true
		commandsList.CanvasSize=UDim2.new(0,0,0,0)
	end
	for i,v in pairs(commandsList:GetChildren()) do
		if v:IsA("TextLabel") then
			v:Remove()
		end
	end
	local i=0
	for cmdName,tbl in pairs(commands) do
		local Cmd=commandExample:Clone()
		Cmd.Parent=commandsList
		Cmd.Name=cmdName
		Cmd.Text=" "..tbl[2][1]
		Cmd.MouseEnter:Connect(function()
			description.Visible=true
			description.Text=tbl[2][2]
		end)
		Cmd.MouseLeave:Connect(function()
			if description.Text==tbl[2][2] then
				description.Visible=false
				description.Text=""
			end
		end)
		i=i+1
	end
	commandsList.CanvasSize=UDim2.new(0,0,0,i*20+10)
	commandsFrame.Position=UDim2.new(0.5,-283/2,0.5,-260/2)
end
gui.chatlogs=function()
	if not chatLogsFrame.Visible then
		chatLogsFrame.Visible=true
	end
	chatLogsFrame.Position=UDim2.new(0.5,-283/2+5,0.5,-260/2+5)
end
gui.universeGui=function()
	if not UniverseViewerFrame.Visible then
		UniverseViewerFrame.Visible=true
	end
	UniverseViewerFrame.Position=UDim2.new(0.5,-283/2+5,0.5,-260/2+5)
end
gui.updateLogs=function()
	if not UpdLogsFrame.Visible and next(updLogs) then
		UpdLogsFrame.Visible=true
	elseif not next(updLogs) then
		send_notification("no upd logs for now...")
	else
		warn("huh?")
	end
	UpdLogsFrame.Position=UDim2.new(0.5,-283/2+5,0.5,-260/2+5)
end
gui.ShiftlockVis=function()
	if not ShiftlockUi.Visible then
		ShiftlockUi.Visible=true
	end
end
gui.ShiftlockInvis=function()
	if ShiftlockUi.Visible then
		ShiftlockUi.Visible=false
	end
end

-- gui.tween(centerBar,"Sine","Out",speed or 0.25,{Size=UDim2.new(0,250,0,0)})

gui.tween=function(obj,style,direction,duration,goal)
	local tweenInfo=TweenInfo.new(duration,Enum.EasingStyle[style],Enum.EasingDirection[direction])
	local tween=tweenservice:Create(obj,tweenInfo,goal)
	tween:Play()
	return tween
end

gui.resizeable = function(ui, min, max)
    min = min or Vector2.new(ui.AbsoluteSize.X, ui.AbsoluteSize.Y)
    max = max or Vector2.new(5000, 5000)
    
    local rgui = resizeFrame:Clone()
    rgui.Parent = ui

    local mode
    local UIPos
    local lastSize
    local lastPos = Vector2.new()
    local dragging = false

    local function updateResize(currentPos)
        if not dragging or not mode then return end
        
        local xy = resizeXY[mode.Name]
        if not xy then return end
        
        local delta = currentPos - lastPos
        
        local resizeDelta = Vector2.new(
            delta.X * xy[1].X,
            delta.Y * xy[1].Y
        )
        
        local newSize = Vector2.new(
            lastSize.X + resizeDelta.X,
            lastSize.Y + resizeDelta.Y
        )
        
        newSize = Vector2.new(
            math.clamp(newSize.X, min.X, max.X),
            math.clamp(newSize.Y, min.Y, max.Y)
        )
        
        ui.Size = UDim2.new(0, newSize.X, 0, newSize.Y)
        
        local newPos = UDim2.new(
            UIPos.X.Scale,
            UIPos.X.Offset,
            UIPos.Y.Scale,
            UIPos.Y.Offset
        )
        
        if xy[1].X < 0 then
            newPos = UDim2.new(
                newPos.X.Scale,
                UIPos.X.Offset + (lastSize.X - newSize.X),
                newPos.Y.Scale,
                newPos.Y.Offset
            )
        end
        
        if xy[1].Y < 0 then
            newPos = UDim2.new(
                newPos.X.Scale,
                newPos.X.Offset,
                newPos.Y.Scale,
                UIPos.Y.Offset + (lastSize.Y - newSize.Y)
            )
        end
        
        ui.Position = newPos
    end

    local connection = runservice.RenderStepped:Connect(function()
        if dragging then
            local currentPos = userinputservice:GetMouseLocation()
            updateResize(Vector2.new(currentPos.X, currentPos.Y))
        end
    end)
    
    for _, button in pairs(rgui:GetChildren()) do
        button.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                mode = button
                dragging = true
                local currentPos = userinputservice:GetMouseLocation()
                lastPos = Vector2.new(currentPos.X, currentPos.Y)
                lastSize = ui.AbsoluteSize
                UIPos = ui.Position
            end
        end)
        
        button.InputEnded:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and mode == button then
                dragging = false
                mode = nil
                if mouse.Icon == resizeXY[button.Name][3] then
                    mouse.Icon = ""
                end
            end
        end)
        
        button.MouseEnter:Connect(function()
            if resizeXY[button.Name] then
                mouse.Icon = resizeXY[button.Name][3]
            end
        end)
        
        button.MouseLeave:Connect(function()
            if not dragging and mouse.Icon == resizeXY[button.Name][3] then
                mouse.Icon = ""
            end
        end)
    end
    
    userinputservice.InputEnded:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            dragging = false
            mode = nil
            mouse.Icon = ""
        end
    end)
    
    return function()
        if connection then
            connection:Disconnect()
        end
    end
end

gui.draggable=function(ui, dragui)
	if not dragui then dragui = ui end
	
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		ui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	dragui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = ui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	dragui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	userinputservice.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	ui.Active=true
end

gui.draggablev2=function(floght)
	floght.Active=true
	floght.Draggable=true
end

gui.menuify=function(menu)
	local exit=menu:FindFirstChild("Exit",true)
	local mini=menu:FindFirstChild("Minimize",true)
	local minimized=false
	local isAnimating = false
	local sizeX,sizeY=Instance.new("IntValue",menu),Instance.new("IntValue",menu)
	mini.MouseButton1Click:Connect(function()
		if isAnimating then return end
	
		minimized = not minimized
		isAnimating = true
	
		if minimized then
			sizeX.Value = menu.Size.X.Offset
			sizeY.Value = menu.Size.Y.Offset
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, sizeX.Value, 0, 25)}).Completed:Connect(function()
				isAnimating = false
			end)
		else
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, sizeX.Value, 0, sizeY.Value)}).Completed:Connect(function()
				isAnimating = false
			end)
		end
	end)
	exit.MouseButton1Click:Connect(function()
		menu.Visible=false
	end)
	gui.draggable(menu,menu.Topbar)
	menu.Visible=false
end
gui.menuifyv2=function(menu)
	local exit=menu:FindFirstChild("Exit",true)
	local mini=menu:FindFirstChild("Minimize",true)
	local clear=menu:FindFirstChild("Clear",true);
	local minimized=false
	local isAnimating = false
	local sizeX,sizeY=Instance.new("IntValue",menu),Instance.new("IntValue",menu)
	mini.MouseButton1Click:Connect(function()
		if isAnimating then return end
	
		minimized = not minimized
		isAnimating = true
	
		if minimized then
			sizeX.Value = menu.Size.X.Offset
			sizeY.Value = menu.Size.Y.Offset
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, sizeX.Value, 0, 25)}).Completed:Connect(function()
				isAnimating = false
			end)
		else
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, sizeX.Value, 0, sizeY.Value)}).Completed:Connect(function()
				isAnimating = false
			end)
		end
	end)
	exit.MouseButton1Click:Connect(function()
		menu.Visible=false
	end)
	if clear then 
		clear.MouseButton1Click:Connect(function()
			local t=menu:FindFirstChild("Container",true):FindFirstChildOfClass("ScrollingFrame"):FindFirstChildOfClass("UIListLayout",true)
			for _,v in ipairs(t.Parent:GetChildren()) do
				if v:IsA("TextLabel") then
					v:Destroy()
				end
			end
		end)
	end
	gui.draggable(menu,menu.Topbar)
	menu.Visible=false
end

gui.shiftlock=function(sLock,lockImg)
	local V=false
	local g=nil
	local GameSettings=UserSettings():GetService("UserGameSettings")
	local J=nil
	lockImg.Active=false

	function ForceShiftLock()
		local i,k=pcall(function()
			return GameSettings.RotationType
		end)
		_=i
		g=k
		J=runservice.RenderStepped:Connect(function()
			pcall(function()
				GameSettings.RotationType=Enum.RotationType.CameraRelative
			end)
		end)
	end

	function EndForceShiftLock()
		if J then
			pcall(function()
				GameSettings.RotationType=g or Enum.RotationType.MovementRelative
			end)
			J:Disconnect()
		end
	end

	sLock.MouseButton1Click:Connect(function()
		V=not V
		lockImg.ImageColor3=V and Color3.fromRGB(0,170,255) or Color3.fromRGB(255,255,255)
		if V then
			ForceShiftLock()
		else
			EndForceShiftLock()
		end
	end)
	gui.draggable(sLock)
end

gui.loadCommands=function()
	for i,v in pairs(cmdAutofill:GetChildren()) do
		if v.Name~="UIListLayout" then
			v:Remove()
		end
	end
	local last=nil
	local i=0
	for name,tbl in pairs(commands) do
		local info=tbl[2]
		local btn=cmdExample:Clone()
		btn.Parent=cmdAutofill
		btn.Name=name
		btn.Input.Text=info[1]
		i += 1
		local size=btn.Size
		btn.Size=UDim2.new(0,0,0,25)
		btn.Size=size
	end
end

gui.loadCommands()
for i,v in ipairs(cmdAutofill:GetChildren()) do
	if v:IsA("Frame") then
		v.Visible=false
	end
end
gui.barSelect=function(speed)
	centerBar.Visible=true
	gui.tween(centerBar,"Sine","Out",speed or 0.25,{Size=UDim2.new(0,250,1,15)})
	gui.tween(leftFill,"Quad","Out",speed or 0.3,{Position=UDim2.new(0,0,0.5,0)})
	gui.tween(rightFill,"Quad","Out",speed or 0.3,{Position=UDim2.new(1,0,0.5,0)})
end
gui.barDeselect=function(speed)
	gui.tween(centerBar,"Sine","Out",speed or 0.25,{Size=UDim2.new(0,250,0,0)})
	gui.tween(leftFill,"Sine","In",speed or 0.3,{Position=UDim2.new(-0.5,100,0.5,0)})
	gui.tween(rightFill,"Sine","In",speed or 0.3,{Position=UDim2.new(1.5,-100,0.5,0)})
	for i,v in ipairs(cmdAutofill:GetChildren()) do
		if v:IsA("Frame") then
			wrap(function()
				wait(math.random(1,200)/2000)
				gui.tween(v,"Back","In",0.35,{Size=UDim2.new(0,0,0,25)})
			end)
		end
	end
end

--[[ AUTOFILL SEARCHER ]]--
gui.searchCommands = function()
    local searchTerm = cmdInput.Text:gsub(";", ""):lower()
    local index = 0
    local lastFramePos
    local results = {}

    for _, frame in ipairs(cmdAutofill:GetChildren()) do
        if frame:IsA("Frame") then
            local cmdName = frame.Name:lower()
            local command = commands[cmdName]
            local displayName = command and command[2][1] or ""
            local displayNameLower = displayName:lower()

            local aliases = {}
            local aliasText = displayName:match("%(([^%)]+)%)")
            if aliasText then
                for alias in aliasText:gmatch("[^,%s]+") do
                    table.insert(aliases, alias:lower())
                end
            end

            local score = 999
            local matchText = displayName

            if cmdName == searchTerm or displayNameLower == searchTerm then
                score = 1
                matchText = cmdName
            else
                for _, alias in ipairs(aliases) do
                    if alias == searchTerm then
                        score = 1
                        matchText = alias
                        break
                    end
                end
            end

            if score == 999 then
                if cmdName:sub(1, #searchTerm) == searchTerm then
                    score = 2
                    matchText = cmdName
                elseif displayNameLower:sub(1, #searchTerm) == searchTerm then
                    score = 3
                    matchText = displayName
                else
                    for _, alias in ipairs(aliases) do
                        if alias:sub(1, #searchTerm) == searchTerm then
                            score = 3
                            matchText = alias
                            break
                        end
                    end
                end
            end

            if score == 999 and #searchTerm >= 2 then
                if cmdName:find(searchTerm, 1, true) ~= nil then
                    score = 4
                    matchText = cmdName
                elseif displayNameLower:find(searchTerm, 1, true) ~= nil then
                    score = 5
                    matchText = displayName
                else
                    for _, alias in ipairs(aliases) do
                        if alias:find(searchTerm, 1, true) ~= nil then
                            score = 5
                            matchText = alias
                            break
                        end
                    end
                end
            end

            if score == 999 and #searchTerm >= 2 then
                local cmdDistance = levenshtein(searchTerm, cmdName)
                local displayDistance = levenshtein(searchTerm, displayNameLower)

                local bestAliasDistance = math.huge
                for _, alias in ipairs(aliases) do
                    local aliasDistance = levenshtein(searchTerm, alias)
                    bestAliasDistance = math.min(bestAliasDistance, aliasDistance)
                end

                if cmdDistance <= math.min(2, #searchTerm - 1) then
                    score = 6 + cmdDistance
                    matchText = cmdName
                elseif bestAliasDistance <= math.min(2, #searchTerm - 1) then
                    score = 6 + bestAliasDistance
                    matchText = alias
                elseif displayDistance <= math.min(2, #searchTerm - 1) then
                    score = 9 + displayDistance
                    matchText = displayName
                end
            end

            if score < 999 then
                table.insert(results, {
                    frame = frame,
                    score = score,
                    text = matchText,
                    name = cmdName
                })
            end
        end
    end

    table.sort(results, function(a, b)
        if a.score == b.score then
            return a.name < b.name
        end
        return a.score < b.score
    end)

    for _, frame in ipairs(cmdAutofill:GetChildren()) do
        if frame:IsA("Frame") then
            frame.Visible = false
        end
    end

    for i, result in ipairs(results) do
        if i <= 5 then
            local frame = result.frame
            if result.text and result.text ~= "" then
                frame.Input.Text = result.text
                frame.Visible = true

                local newSize = UDim2.new(0.5, math.sqrt(i) * 125, 0, 25)
                local newYPos = (i - 1) * 28
                local newPosition = UDim2.new(0.5, 0, 0, newYPos)

                gui.tween(frame, "Quint", "Out", 0.3, {
                    Size = newSize,
                    Position = lastFramePos and newPosition or UDim2.new(0.5, 0, 0, newYPos),
                })

                lastFramePos = newPosition
                index = i
            else
                frame.Visible = false
            end
        end
    end
end

connect(mouse.KeyDown, function(name)
	name = name:lower()
	if name == options.prefix then
		gui.barSelect()
		cmdInput.Text = ''
		cmdInput:CaptureFocus()
		wait()
		cmdInput.Text = ''
	end
end)

--[[ CLOSE THE COMMAND BAR ]]--
connect(cmdInput.FocusLost, function(ep)
	coroutine.resume(coroutine.create(lib.parse_command), options.prefix .. cmdInput.Text)
	gui.barDeselect()
end)

connect(cmdInput:GetPropertyChangedSignal('Text'), function()
	gui.searchCommands()
end)

gui.barDeselect(0)

cmdBar.Visible = true

gui.menuifyv2(chatLogsFrame)
gui.menuify(commandsFrame)
gui.menuify(UniverseViewerFrame)
gui.menuify(UpdLogsFrame)
gui.shiftlock(ShiftlockUi,ShiftlockUi.btnIcon)

--[[ GUI RESIZE FUNCTION ]]--

--table.find({Enum.Platform.IOS,Enum.Platform.Android},game:GetService("userinputservice"):GetPlatform()) | searches if the player is on mobile.
gui.resizeable(chatLogsFrame)
gui.resizeable(commandsFrame)
gui.resizeable(UniverseViewerFrame)
gui.resizeable(UpdLogsFrame)

--[[ CMDS COMMANDS SEARCH FUNCTION ]]--
connect(commandsFilter.Changed, function(p)
    if p ~= "Text" then return end

    local searchQuery = commandsFilter.Text:lower():gsub("%s+", "")
    if searchQuery == "" then
        for _, v in pairs(commandsList:GetChildren()) do
            if v:IsA("TextLabel") then
                v.Visible = true
            end
        end
        return
    end
    
    local results = {}

    for _, v in pairs(commandsList:GetChildren()) do
        if v:IsA("TextLabel") then
            local commandName = v.Name:lower()
            local command = commands[commandName]
            local displayName = command and command[2][1] or ""
            local displayNameLower = displayName:lower()
            
            local aliases = {}
            local aliasText = displayName:match("%(([^%)]+)%)")
            if aliasText then
                for alias in aliasText:gmatch("[^,%s]+") do
                    table.insert(aliases, alias:lower())
                end
            end
            
            local score = 999
            
            if commandName == searchQuery or displayNameLower == searchQuery then
                score = 1
            else
                for _, alias in ipairs(aliases) do
                    if alias == searchQuery then
                        score = 1
                        break
                    end
                end
            end
            
            if score == 999 then
                if commandName:sub(1, #searchQuery) == searchQuery then
                    score = 2
                elseif displayNameLower:sub(1, #searchQuery) == searchQuery then
                    score = 3
                else
                    for _, alias in ipairs(aliases) do
                        if alias:sub(1, #searchQuery) == searchQuery then
                            score = 3
                            break
                        end
                    end
                end
            end
            
            if score == 999 and #searchQuery >= 2 then
                if commandName:find(searchQuery, 1, true) ~= nil then
                    score = 4
                elseif displayNameLower:find(searchQuery, 1, true) ~= nil then
                    score = 5
                else
                    for _, alias in ipairs(aliases) do
                        if alias:find(searchQuery, 1, true) ~= nil then
                            score = 5
                            break
                        end
                    end
                end
            end
            
            if score == 999 and #searchQuery >= 2 then
                local cmdDistance = levenshtein(searchQuery, commandName)
                local displayDistance = levenshtein(searchQuery, displayNameLower)
                
                local bestAliasDistance = math.huge
                for _, alias in ipairs(aliases) do
                    local aliasDistance = levenshtein(searchQuery, alias)
                    bestAliasDistance = math.min(bestAliasDistance, aliasDistance)
                end
                
                if cmdDistance <= math.min(2, #searchQuery - 1) then
                    score = 6 + cmdDistance
                elseif bestAliasDistance <= math.min(2, #searchQuery - 1) then
                    score = 6 + bestAliasDistance
                elseif displayDistance <= math.min(2, #searchQuery - 1) then
                    score = 9 + displayDistance
                end
            end
            
            if score < 999 then
                table.insert(results, {
                    label = v, 
                    score = score,
                    name = commandName
                })
            end
        end
    end

    table.sort(results, function(a, b)
        if a.score == b.score then
            return a.name < b.name
        end
        return a.score < b.score
    end)

    for _, v in pairs(commandsList:GetChildren()) do
        if v:IsA("TextLabel") then
            v.Visible = false
        end
    end

    for _, result in ipairs(results) do
        result.label.Visible = true
    end
end)

function bindToChat(plr, msg)
    local chatMsg = chatExample:Clone()
    
    for i, v in pairs(chatLogs:GetChildren()) do
        if v:IsA("TextLabel") then
            v.LayoutOrder = v.LayoutOrder + 1
        end
    end
    
    chatMsg.Parent = chatLogs
    
    local displayName = plr.DisplayName or "Unknown"
    local userName = plr.Name or "Unknown"
    
    if displayName == userName then
        chatMsg.Text = ("@%s: %s"):format(userName, msg)
    else
        chatMsg.Text = ("%s [@%s]: %s"):format(displayName, userName, msg)
    end
    
    local txtSize = gui.txtSize(chatMsg, chatMsg.AbsoluteSize.X, 100)
    chatMsg.Size = UDim2.new(1, -5, 0, txtSize.Y)
end

for _, player in pairs(players:GetPlayers()) do
	connect(player.Chatted, function(msg)
		bindToChat(plr, msg)
	end)
end

connect(players.PlayerAdded, function(plr)
	connect(plr.Chatted, function(msg)
		bindToChat(plr, msg)
	end)
end)

connect(mouse.Move, function()
	description.Position = UDim2.fromOffset(mouse.X, mouse.Y)
	size = gui.txtSize(description, 200, 100)
	description.Size = UDim2.fromOffset(size.X, size.Y)
end)

connect(runservice.Stepped, function()
	chatLogs.CanvasSize = UDim2.fromOffset(0, chatLogs:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y)
	commandsList.CanvasSize = UDim2.fromOffset(0, commandsList:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y)
	UniverseList.CanvasSize = UDim2.fromOffset(0, UniverseList:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y)
	UpdLogsList.CanvasSize = UDim2.fromOffset(0, UpdLogsList:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y)
end)

na_caller(function()
	local page=AssetService:GetGamePlacesAsync()
	while true do
		local template=UniverseExample
		local list=UniverseList
		for _,place in page:GetCurrentPage() do
			local btn=template:Clone()
			btn.Parent=list
			btn.Name=place.Name
			btn.Text=place.Name.." ("..place.PlaceId..")"
			btn.MouseButton1Click:Connect(function()
				TeleportService:Teleport(place.PlaceId)
				send_notification("Teleporting To Place: "..place.Name)
			end)
		end
		if page.IsFinished then
			break
		end
		page:AdvanceToNextPageAsync()
	end
end)

na_caller(function()
	template=UpdLogsLabel
	list=UpdLogsList

	UpdLogsTitle.Text=UpdLogsTitle.Text.." "..last_updated

	if next(update_logs) then
		for name,txt in pairs(update_logs) do
			local btn=template:Clone()
			btn.Parent=list
			btn.Name=name
			btn.Text="-"..txt
		end
	else
		-- do something
	end
end)

watermark_label = Instance.new("TextLabel")
UICorner = Instance.new("UICorner")
ImageButton = Instance.new("ImageButton")
UICorner2 = Instance.new("UICorner")

na_protection(watermark_label)
watermark_label.Parent=ScreenGui
watermark_label.BackgroundColor3=Color3.fromRGB(4,4,4)
watermark_label.BackgroundTransparency=1.000
watermark_label.AnchorPoint=Vector2.new(0.5,0.5)
watermark_label.Position=UDim2.new(0.5,0,0.5,0)
watermark_label.Size=UDim2.new(0,2,0,33)
watermark_label.Font=Enum.Font.SourceSansBold
watermark_label.Text = admin_name.." V"..current_version
watermark_label.TextColor3=Color3.fromRGB(255,255,255)
watermark_label.TextSize=20.000
watermark_label.TextWrapped=true
watermark_label.ZIndex=9999

na_protection(ImageButton)
ImageButton.Parent = ScreenGui
ImageButton.AnchorPoint = Vector2.new(0.5, 0)
ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.fromScale(0.5, -1)
ImageButton.Size = UDim2.new(0,32,0,33)
ImageButton.Image = "rbxassetid://18567102564"
ImageButton.ZIndex = 9999

UICorner.CornerRadius=UDim.new(1,0)
UICorner.Parent=ImageButton
UICorner2.CornerRadius=UDim.new(1,0)
UICorner2.Parent=watermark_label

function Swoosh()
	local imagebutton=ImageButton
	imagebutton.Size=UDim2.new(0,32,0,33)
	imagebutton.BackgroundTransparency=0
	imagebutton:TweenPosition(UDim2.new(0.5,0,0,0),"Out","Quint",1,true)
	gui.draggable(imagebutton)
end

spawn(function()
	watermark_label.Size=UDim2.new(0,2,0,33)
	watermark_label.BackgroundTransparency=0.14

	textWidth=game:GetService("TextService"):GetTextSize(watermark_label.Text,watermark_label.TextSize,watermark_label.Font,Vector2.new(math.huge,math.huge)).X
	newSize=UDim2.new(0,textWidth+69,0,33)

	watermark_label:TweenSize(newSize,"Out","Quint",1,true)
	if platform == 'mobile' then
		Swoosh()
	else
		ImageButton:Destroy()
	end
	wait(2)
	tweenservice:Create(watermark_label,TweenInfo.new(.7,Enum.EasingStyle.Sine),{BackgroundTransparency=1}):Play()
	h=tweenservice:Create(watermark_label,TweenInfo.new(.7,Enum.EasingStyle.Sine),{TextTransparency=1})
	h:Play()
	h.Completed:Connect(function()
		watermark_label:Destroy()
	end)
end)

if platform == 'mobile' then
	connect(ImageButton.MouseButton1Click, function()
		gui.barSelect()
		cmdInput.Text = ''
		cmdInput:CaptureFocus()
	end)
end

na_caller(function()
	local display = player.DisplayName
	local name = player.Name
	local NAresult = tick() - na_begin
	local hh
	
	if display:lower() == name:lower() then
		hh = ('@%s'):format(name)
	else
		hh = ('%s (@%s)'):format(display, name)
	end

	delay(0.3,function()
		if identifyexecutor then
			local executor_name = identifyexecutor()
			local full_message = "Welcome to " .. admin_name .. " V" .. current_version ..
								"\nExecutor: " .. executor_name ..
								"\nUpdated On: " .. last_updated ..
								"\nTime Taken To Load: " .. loadedResults(NAresult)
			send_notification(full_message, 6,"Hello, " .. hh)
		else
			local full_message = "Welcome to " .. admin_name .. " V" .. current_version ..
								"\nUpdated On: " .. last_updated ..
								"\nTime Taken To Load: " .. loadedResults(NAresult)
			send_notification(full_message, 6, "Hello, " .. hh)
		end
		Notify({
			Title = "Would you like to enable QueueOnTeleport?",
			Description = "With QueueOnTeleport "..admin_name.." will automatically execute itself upon teleporting to a game or place.",
			Duration = 3,
			Buttons = {
				{Text = "Yes", Callback = function() queueteleport(loader) end},
				{Text = "No", Callback = function() end}
			}
		})
		task.wait(5)
		send_notification('Prefix: ' .. options.prefix, 10, admin_name .. ' Bound Prefix')
	end)

	cmdInput.PlaceholderText=admin_name.." V"..current_version
end)

function env.stop_nameless_admin()
    break_all_loops = true
    for _, instance in pairs(instances) do
        if typeof(instance) == 'Instance' then
            instance:Destroy()
        end
    end
    for _, connection in pairs(connections) do
        if typeof(connection) == 'RBXScriptConnection' and connection.Connected then
            connection:Disconnect()
        end
    end
end

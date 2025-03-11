--- edited by thuarnel
--- 
--- @diagnostic disable: undefined-global

local env = type(getgenv) == 'function' and getgenv()

if type(env) == 'table' and type(env.stop_rc7_scripteditor) == 'function' then
    print('[PG] Stopping previous instance of RC7 Script Editor...')
    env.stop_rc7_scripteditor()
end

local insert = table.insert
local instances = {}
local connections = {}
local break_all_loops = false

local function connect(signal, callback)
    local connection = signal:Connect(callback)
    insert(connections, connection)
    return connection
end

local ui = Instance.new("ScreenGui")
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
insert(instances, ui)
local hui = type(gethui) == 'function' and gethui()
local core_gui = hui or game:GetService('CoreGui')
ui.Parent = core_gui

local open_button = Instance.new("TextButton")
local main_image = Instance.new("ImageLabel")
local editor_scrolling_frame = Instance.new("ScrollingFrame")
local source_field = Instance.new("TextBox")
local __tokens = Instance.new("TextLabel")
local __strings = Instance.new("TextLabel")
local __remotehl = Instance.new("TextLabel")
local __numbers = Instance.new("TextLabel")
local __keywords = Instance.new("TextLabel")
local __globals = Instance.new("TextLabel")
local __comments = Instance.new("TextLabel")
local open_button_2 = Instance.new("TextButton")
local clear_button = Instance.new("TextButton")
local execute_button = Instance.new("TextButton")
local exit_button = Instance.new("TextButton")
local line_label = Instance.new("TextLabel")
local main_scrolling = Instance.new("ScrollingFrame")

open_button.Name = "open_button"
open_button.Parent = ui
open_button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
open_button.BorderSizePixel = 0
open_button.Position = UDim2.new(0, 0, 0.976239681, 0)
open_button.Size = UDim2.new(0, 24, 0, 14)
open_button.Visible = false
open_button.Font = Enum.Font.SourceSans
open_button.Text = ""
open_button.TextColor3 = Color3.fromRGB(0, 0, 0)
open_button.TextSize = 14.000

main_image.Name = "main_image"
main_image.Parent = ui
main_image.Active = true
main_image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main_image.BorderSizePixel = 0
main_image.Position = UDim2.new(0.649910629, 0, 0.389118433, 0)
main_image.Size = UDim2.new(0, 337, 0, 341)
main_image.Image = "http://www.roblox.com/asset/?id=12263991723"

editor_scrolling_frame.Name = "editor_scrolling_frame"
editor_scrolling_frame.Parent = main_image
editor_scrolling_frame.Active = true
editor_scrolling_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
editor_scrolling_frame.BorderSizePixel = 0
editor_scrolling_frame.Position = UDim2.new(0.0339522101, 0, 0.102768078, 0)
editor_scrolling_frame.Size = UDim2.new(0, 284, 0, 224)
editor_scrolling_frame.CanvasSize = UDim2.new(0, 0, 1000, 0)
editor_scrolling_frame.ScrollBarThickness = 0

source_field.Name = "source_field"
source_field.Parent = editor_scrolling_frame
source_field.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
source_field.BorderSizePixel = 0
source_field.Position = UDim2.new(0.0021330067, 0, 0, 0)
source_field.Size = UDim2.new(0, 283, 0, 9999999)
source_field.Font = Enum.Font.SourceSans
source_field.MultiLine = true
source_field.Text = ""
source_field.TextColor3 = Color3.fromRGB(0, 0, 0)
source_field.TextSize = 19.000
source_field.TextWrapped = true
source_field.TextXAlignment = Enum.TextXAlignment.Left
source_field.TextYAlignment = Enum.TextYAlignment.Top

__tokens.Name = "__tokens"
__tokens.Parent = source_field
__tokens.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__tokens.BackgroundTransparency = 1.000
__tokens.Size = UDim2.new(0, 200, 0, 50)
__tokens.Font = Enum.Font.SourceSans
__tokens.TextColor3 = Color3.fromRGB(0, 0, 0)
__tokens.TextSize = 14.000
__tokens.TextTransparency = 1.000

__strings.Name = "__strings"
__strings.Parent = source_field
__strings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__strings.BackgroundTransparency = 1.000
__strings.Size = UDim2.new(0, 200, 0, 50)
__strings.Font = Enum.Font.SourceSans
__strings.TextColor3 = Color3.fromRGB(0, 0, 0)
__strings.TextSize = 14.000
__strings.TextTransparency = 1.000

__remotehl.Name = "__remotehl"
__remotehl.Parent = source_field
__remotehl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__remotehl.BackgroundTransparency = 1.000
__remotehl.Size = UDim2.new(0, 200, 0, 50)
__remotehl.Font = Enum.Font.SourceSans
__remotehl.TextColor3 = Color3.fromRGB(0, 0, 0)
__remotehl.TextSize = 14.000
__remotehl.TextTransparency = 1.000

__numbers.Name = "__numbers"
__numbers.Parent = source_field
__numbers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__numbers.BackgroundTransparency = 1.000
__numbers.Size = UDim2.new(0, 200, 0, 50)
__numbers.Font = Enum.Font.SourceSans
__numbers.TextColor3 = Color3.fromRGB(0, 0, 0)
__numbers.TextSize = 14.000
__numbers.TextTransparency = 1.000

__keywords.Name = "__keywords"
__keywords.Parent = source_field
__keywords.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__keywords.BackgroundTransparency = 1.000
__keywords.Size = UDim2.new(0, 200, 0, 50)
__keywords.Font = Enum.Font.SourceSans
__keywords.TextColor3 = Color3.fromRGB(0, 0, 0)
__keywords.TextSize = 14.000
__keywords.TextTransparency = 1.000

__globals.Name = "__globals"
__globals.Parent = source_field
__globals.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__globals.BackgroundTransparency = 1.000
__globals.Size = UDim2.new(0, 200, 0, 50)
__globals.Font = Enum.Font.SourceSans
__globals.TextColor3 = Color3.fromRGB(0, 0, 0)
__globals.TextSize = 14.000
__globals.TextTransparency = 1.000

__comments.Name = "__comments"
__comments.Parent = source_field
__comments.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
__comments.BackgroundTransparency = 1.000
__comments.Size = UDim2.new(0, 200, 0, 50)
__comments.Font = Enum.Font.SourceSans
__comments.TextColor3 = Color3.fromRGB(0, 0, 0)
__comments.TextSize = 14.000
__comments.TextTransparency = 1.000

open_button_2.Name = "open_button"
open_button_2.Parent = main_image
open_button_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
open_button_2.BackgroundTransparency = 1.000
open_button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
open_button_2.BorderSizePixel = 0
open_button_2.Position = UDim2.new(0.0339522101, 0, 0.760739207, 0)
open_button_2.Size = UDim2.new(0, 92, 0, 27)
open_button_2.Font = Enum.Font.SourceSansBold
open_button_2.Text = "open_button"
open_button_2.TextColor3 = Color3.fromRGB(20, 74, 110)
open_button_2.TextSize = 19.000
open_button_2.TextWrapped = true

clear_button.Name = "clear_button"
clear_button.Parent = main_image
clear_button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
clear_button.BackgroundTransparency = 1.000
clear_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear_button.BorderSizePixel = 0
clear_button.Position = UDim2.new(0.595106542, 0, 0.760739207, 0)
clear_button.Size = UDim2.new(0, 95, 0, 26)
clear_button.Font = Enum.Font.SourceSansBold
clear_button.Text = "Clear"
clear_button.TextColor3 = Color3.fromRGB(20, 74, 110)
clear_button.TextSize = 19.000
clear_button.TextWrapped = true

execute_button.Name = "execute_button"
execute_button.Parent = main_image
execute_button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
execute_button.BackgroundTransparency = 1.000
execute_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
execute_button.BorderSizePixel = 0
execute_button.Position = UDim2.new(0.310228467, 0, 0.760739207, 0)
execute_button.Size = UDim2.new(0, 95, 0, 27)
execute_button.Font = Enum.Font.SourceSansBold
execute_button.Text = "Execute"
execute_button.TextColor3 = Color3.fromRGB(20, 74, 110)
execute_button.TextSize = 19.000
execute_button.TextWrapped = true

exit_button.Name = "exit_button"
exit_button.Parent = main_image
exit_button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
exit_button.BackgroundTransparency = 1.000
exit_button.BorderSizePixel = 0
exit_button.Position = UDim2.new(0.877005637, 0, 0, 0)
exit_button.Size = UDim2.new(0, 40, 0, 22)
exit_button.Font = Enum.Font.SourceSans
exit_button.Text = ""
exit_button.TextColor3 = Color3.fromRGB(0, 0, 0)
exit_button.TextSize = 14.000

line_label.Name = "line_label"
line_label.Parent = main_image
line_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line_label.BackgroundTransparency = 1.000
line_label.Size = UDim2.new(0, 200, 0, 50)
line_label.Font = Enum.Font.SourceSans
line_label.TextColor3 = Color3.fromRGB(0, 0, 0)
line_label.TextSize = 14.000
line_label.TextTransparency = 1.000

main_scrolling.Parent = main_image
main_scrolling.Active = true
main_scrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main_scrolling.BorderSizePixel = 0
main_scrolling.Position = UDim2.new(0.0358030051, 0, 0.842850685, 0)
main_scrolling.Size = UDim2.new(0, 268, 0, 50)
main_scrolling.ScrollBarThickness = 0

-- Scripts:

local function THTBRH_fake_script() -- open_button.LocalScript 
	open_button.MouseButton1Click:Connect(function()
		open_button.Parent.main_image.Visible = true
		wait()
		open_button.Visible = false
	end)
end
coroutine.wrap(THTBRH_fake_script)()
local function HTAP_fake_script() -- open_button_2.LocalScript 
	open_button_2.MouseButton1Click:Connect(function()
	open_button_2.Parent.Parent.ScriptHub.Visible = true
	end)
end
coroutine.wrap(HTAP_fake_script)()
local function GUBCKAL_fake_script() -- exit_button.LocalScript 
	exit_button.MouseButton1Click:Connect(function()
		exit_button.Parent.Parent.main_image.Visible = false
		wait()
		exit_button.Parent.Parent.open_button.Visible = true
	end)
end
coroutine.wrap(GUBCKAL_fake_script)()
local function PLHW_fake_script() -- main_image.LocalScript 
	main_image.Draggable = true
end
coroutine.wrap(PLHW_fake_script)()

local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while", "is_synapse_function","is_protosmasher_caller", "execute","foreach","foreachi","insert","syn","HttpGet","HttpPost","__index","__namecall","__add","__call","__tostring","__tonumber","__div"}
local global_env = {"getrawmetatable", "game", "Workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16","run_secure_function","create_secure_function","hookfunc","hookfunction","newcclosure","replaceclosure","islclosure","getgc","gcinfo","rconsolewarn","rconsoleprint","rconsoleinfo","rconsoleinput","rconsoleinputasync","rconsoleclear","rconsoleerr",}

local src = source_field
local lin = line_label

local Highlight = function(string, keywords)
local K = {}
local S = string
local Token = {
	["="] = true,
	["."] = true,
	[","] = true,
	["("] = true,
	[")"] = true,
	["["] = true,
	["]"] = true,
	["{"] = true,
	["}"] = true,
	[":"] = true,
	["*"] = true,
	["/"] = true,
	["+"] = true,
	["-"] = true,
	["%"] = true,
	[";"] = true,
	["~"] = true
}
for i, v in pairs(keywords) do
K[v] = true
end
S = S:gsub(".", function(c)
if Token[c] ~= nil then
return "\32"
else
return c
end
end)
S = S:gsub("%S+", function(c)
if K[c] ~= nil then
return c
else
return (" "):rep(#c)
end
end)

return S
end

local hTokens = function(string)
local Token =
{
["="] = true,
["."] = true,
[","] = true,
["("] = true,
[")"] = true,
["["] = true,
["]"] = true,
["{"] = true,
["}"] = true,
[":"] = true,
["*"] = true,
["/"] = true,
["+"] = true,
["-"] = true,
["%"] = true,
[";"] = true,
["~"] = true
}
local A = ""
local B = [[]]
string:gsub(".", function(c)
if Token[c] ~= nil then
A = A .. c
elseif c == "\n" then
A = A .. "\n"
elseif c == "\t" then
A = A .. "\t"
else
A = A .. "\32"
end
end)
return A
end


local strings = function(string)
	local highlight = ""
	local quote = false
	string:gsub(".", function(c)
		if quote == false and c == "\"" then
			quote = true
		elseif quote == true and c == "\"" then
			quote = false
		end
		if quote == false and c == "\"" then
			highlight = highlight .. "\""
		elseif c == "\n" then
			highlight = highlight .. "\n"
		elseif c == "\t" then
			highlight = highlight .. "\t"
		elseif quote == true then
			highlight = highlight .. c
		elseif quote == false then
			highlight = highlight .. "\32"
		end
	end)
	return highlight
end

local comments = function(string)
local ret = ""
string:gsub("[^\r\n]+", function(c)
local comm = false
local i = 0
c:gsub(".", function(n)
i = i + 1
if c:sub(i, i + 1) == "--" then
comm = true
end
if comm == true then
ret = ret .. n
else
ret = ret .. "\32"
end
end)
ret = ret
end)

return ret
end

local numbers = function(string)
local A = ""
string:gsub(".", function(c)
if tonumber(c) ~= nil then
A = A .. c
elseif c == "\n" then
A = A .. "\n"
elseif c == "\t" then
A = A .. "\t"
else
A = A .. "\32"
end
end)

return A
end

local highlight_source = function(type)
if type == "Text" then
src.Text = source_field.Text:gsub("\13", "")
src.Text = source_field.Text:gsub("\t", "      ")
local s = src.Text
src.__keywords.Text = Highlight(s, lua_keywords)
src.__globals.Text = Highlight(s, global_env)
src.__remotehl.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
src.__tokens.Text = hTokens(s)
src.__numbers.Text = numbers(s)
src.__strings.Text = strings(s)
local lin = 1
s:gsub("\n", function()
lin = lin + 1
end)
line_label.Text = ""
for i = 1, lin do
line_label.Text = line_label.Text .. i .. "\n"
end
end
end

highlight_source("Text")

src.Changed:Connect(highlight_source)

execute_button.MouseButton1Click:Connect(function()
	assert(loadstring(source_field.Text))()
end)

clear_button.MouseButton1Click:Connect(function()
   source_field.Text = ""
end)

main_image.Active = true
main_image.Draggable = true

function env.stop_rc7_scripteditor()
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

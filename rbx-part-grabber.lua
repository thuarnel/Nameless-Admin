--- made by thuarnel
--- part grabber optimized
--- 3/11/2025

local env = type(getgenv) == 'function' and getgenv()

if type(env) == 'table' and type(env.stop_part_grabber) == 'function' then
    print('[PG] Stopping previous instance of Part Grabber...')
    env.stop_part_grabber()
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
insert(instances, ui)
local hui = type(gethui) == 'function' and gethui()
local core_gui = hui or game:GetService('CoreGui')
ui.Parent = core_gui

local players = game:GetService('Players')
local local_player = players.LocalPlayer
local player_mouse = local_player:GetMouse()

local main = Instance.new("Frame")
local container = Instance.new("Frame")
local ui_corner = Instance.new("UICorner")
local ui_gradient = Instance.new("UIGradient")
local grab_button = Instance.new("TextButton")
local found_label = Instance.new("TextLabel")
local delete_button = Instance.new("TextButton")
local topbar = Instance.new("Frame")
local icon = Instance.new("ImageLabel")
local exit_button = Instance.new("TextButton")
local minimize_button = Instance.new("TextButton")
local title = Instance.new("TextLabel")
local ui_corner_2 = Instance.new("UICorner")
local ui_gradient_2 = Instance.new("UIGradient")

ui.Name = "ui"
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ui.ResetOnSpawn = false

main.Name = 'main'
main.Active = true
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 0.140
main.BorderColor3 = Color3.fromRGB(139, 139, 139)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Draggable = true
main.Position = UDim2.new(0.5, 0, 3, 0)
main.Size = UDim2.new(0, 402, 0, 146)

container.Name = "container"
container.Parent = main
container.AnchorPoint = Vector2.new(0.5, 1)
container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
container.BackgroundTransparency = 0.500
container.BorderColor3 = Color3.fromRGB(255, 255, 255)
container.BorderSizePixel = 0
container.ClipsDescendants = true
container.Position = UDim2.new(0.5, 0, 1.02057612, -5)
container.Size = UDim2.new(1, -10, 1.0325762, -30)

ui_corner.CornerRadius = UDim.new(0, 9)
ui_corner.Parent = container

ui_gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 4, 20)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 4, 20))
}
ui_gradient.Parent = container

grab_button.Name = "grab_button"
grab_button.Parent = container
grab_button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
grab_button.Position = UDim2.new(0.5306, 0, 0.755, 0)
grab_button.Size = UDim2.new(0, 110, 0, 29)
grab_button.Font = Enum.Font.SourceSans
grab_button.Text = "Copy Path"
grab_button.TextColor3 = Color3.fromRGB(255, 255, 255)
grab_button.TextScaled = true

delete_button.Name = "delete_button"
delete_button.Parent = container
delete_button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
delete_button.Position = UDim2.new(0.219, 0, 0.755, 0)
delete_button.Size = UDim2.new(0, 110, 0, 29)
delete_button.Font = Enum.Font.SourceSans
delete_button.Text = "Delete Part"
delete_button.TextColor3 = Color3.fromRGB(255, 255, 255)
delete_button.TextScaled = true

topbar.Name = "topbar"
topbar.Parent = main
topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
topbar.BackgroundTransparency = 1.000
topbar.Size = UDim2.new(1, 0, 0, 25)

exit_button.Name = "exit_button"
exit_button.Parent = topbar
exit_button.Position = UDim2.new(0.87, 0, 0, 0)
exit_button.Size = UDim2.new(0, 40, 1, -10)
exit_button.Font = Enum.Font.Gotham
exit_button.Text = "X"
exit_button.TextColor3 = Color3.fromRGB(255, 255, 255)
exit_button.TextSize = 13

local function get_instance_path(obj)
    local path = {}
    while obj and obj.Parent do
        table.insert(path, 1, '.' .. obj.Name)
        obj = obj.Parent
    end
    return table.concat(path, ''):gsub('^%.', '')
end

local function on_part_selected()
    if player_mouse.Target then
        found_label.Text = get_instance_path(player_mouse.Target)
    else
        warn("Error while getting path")
    end
end

local part_selected_connection = player_mouse.Button1Down:Connect(on_part_selected)

local function copy_path()
    if type(setclipboard) == 'function' then
        setclipboard(found_label.Text)
    end
end
grab_button.MouseButton1Click:Connect(copy_path)

delete_button.MouseButton1Click:Connect(function()
    if player_mouse.Target then
        player_mouse.Target:Destroy()
    end
end)

exit_button.MouseButton1Click:Connect(function()
    main:Destroy()
    if part_selected_connection then part_selected_connection:Disconnect() end
end)

function env.stop_part_grabber()
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

--[[
    空白脚本中心
    作者: 空白
    版本: 2.9
    QQ群:  823938617
    最后更新: 2026-3-4
    功能: 速度控制 | 无限跳 | 穿墙 | 飞行 | 缝合中心
]]

local repo = 'https://raw.githubusercontent.com/mstudio45/Obsidian/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local player = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local notifysound = 4590657391
local PlayingSound = true

function Sound()
    local sound = Instance.new("Sound", SoundService)
    sound.Volume = 2.5
    sound.SoundId = "rbxassetid://" .. notifysound
    sound.Playing = PlayingSound and true or false
    Debris:AddItem(sound, 2)
end

Sound()

getgenv().NoClipSpeed = {
    Enabled = false,
    Speed = 16,
    Method = "CFrame",
    Smooth = true,
    MinSpeed = 1,
    MaxSpeed = 500
}

getgenv().InfiniteJump = {
    Enabled = false
}

getgenv().Noclip = {
    Enabled = false
}

getgenv().AutoPrompt = {
    Enabled = false
}

local Window = Library:CreateWindow({
    Title = '空白脚本中心 v2.9',
    Center = true,
    ToggleKeybind = Enum.KeyCode.RightControl,
    AutoShow = true
})

local MainTab = Window:AddTab('主要')
local StitchCenterTab = Window:AddTab('缝合中心')
local AboutTab = Window:AddTab('关于')

-- 关于选项卡内容
local AboutGroup = AboutTab:AddLeftGroupbox('脚本信息')

AboutGroup:AddLabel('脚本名称: 空白脚本中心', false)
AboutGroup:AddLabel('作者: 空白', false)
AboutGroup:AddLabel('版本: 2.9', false)
AboutGroup:AddLabel('QQ群: 823938617 )', false)
AboutGroup:AddLabel('最后更新: 2026-3-4', false)

local CreditGroup = AboutTab:AddRightGroupbox('致谢')

CreditGroup:AddLabel('感谢使用空白脚本中心', false)
CreditGroup:AddLabel(' ', false)
CreditGroup:AddLabel('特别感谢:', true)
CreditGroup:AddLabel('• Obsidian UI 库', false)
CreditGroup:AddLabel('• 所有脚本原作者', false)
CreditGroup:AddLabel('• 测试人员', false)
CreditGroup:AddLabel(' ', false)
CreditGroup:AddLabel('© 2026 空白脚本中心', false)
CreditGroup:AddLabel('本脚本仅供学习交流使用', false)

-- 添加一个按钮来显示欢迎信息
CreditGroup:AddButton({
    Text = '显示欢迎信息',
    Func = function()
        Library:Notify('欢迎使用空白脚本中心 v2.7.0', 3)
        Library:Notify('作者: 空白 | QQ群: 123456789', 3)
        if PlayingSound then Sound() end
    end
})

-- 添加服务器操作Groupbox
local ServerGroup = AboutTab:AddRightGroupbox('服务器操作')

ServerGroup:AddButton({
    Text = '重进服务器',
    Func = function()
        -- 确认对话框
        Library:Notify('正在重进服务器...', 2)
        if PlayingSound then Sound() end
        
        -- 延迟执行重进操作
        task.wait(0.5)
        
        -- 方法1：使用 TeleportService 重进当前服务器
        local success = pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local placeId = game.PlaceId
            local jobId = game.JobId
            
            -- 重进当前服务器
            TeleportService:Teleport(placeId, nil, nil, jobId)
        end)
        
        -- 如果上面的方法失败，使用备用方法
        if not success then
            pcall(function()
                -- 方法2：重新加入游戏
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end)
        end
    end
})

ServerGroup:AddButton({
    Text = '重进服务器(新)',
    Func = function()
        Library:Notify('正在加入新服务器...', 2)
        if PlayingSound then Sound() end
        
        task.wait(0.5)
        
        -- 加入新的服务器（不保留当前服务器）
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end)
    end
})

ServerGroup:AddLabel('说明: 重进服务器会重新加载游戏', false)
ServerGroup:AddLabel('警告: 未保存的进度可能会丢失', false)

local StitchGroup = StitchCenterTab:AddLeftGroupbox('功能按钮')

StitchGroup:AddButton({
    Text = 'IY指令',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
        end)
        
        if success then
            Library:Notify('IY指令已加载', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('IY指令加载失败', 2)
        end
    end
})

StitchGroup:AddButton({
    Text = '玩家控制',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbai-script/1/refs/heads/main/script"))()
        end)
        
        if success then
            Library:Notify('玩家控制已加载', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('玩家控制加载失败', 2)
        end
    end
})

StitchGroup:AddButton({
    Text = '阿尔宙斯自瞄',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
        end)
        
        if success then
            Library:Notify('阿尔宙斯自瞄已加载', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('阿尔宙斯自瞄加载失败', 2)
        end
    end
})

StitchGroup:AddButton({
    Text = 'doors橙色中心',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/XxwanhexxX/Scripts/refs/heads/main/OrangeHub'))()
        end)
        
        if success then
            Library:Notify('doors橙色中心已加载', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('doors橙色中心加载失败', 2)
        end
    end
})

StitchGroup:AddButton({
    Text = '快速交互',
    Func = function()
        getgenv().AutoPrompt.Enabled = true
        Library:Notify('快速交互已启用', 2)
        if PlayingSound then Sound() end
    end
})

StitchGroup:AddButton({
    Text = '战争大亨无限子弹',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbai-script/1/refs/heads/main/War%20Tycoon%20Infinite%20Ammo"))()
        end)
        
        if success then
            Library:Notify('战争大亨无限子弹已加载', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('战争大亨无限子弹加载失败', 2)
        end
    end
})

-- 左侧：速度控制和无限跳
local ControlGroup = MainTab:AddLeftGroupbox('速度控制')

ControlGroup:AddLabel('当前速度', true)
local speedLabel = ControlGroup:AddLabel('16', false)

ControlGroup:AddToggle('EnableSpeed', {
    Text = '启用移速效果',
    Default = false,
    Callback = function(value)
        getgenv().NoClipSpeed.Enabled = value
        if value then
            Library:Notify('移速效果已启用: ' .. getgenv().NoClipSpeed.Speed, 2)
        else
            Library:Notify('移速效果已禁用', 2)
        end
    end
})

ControlGroup:AddSlider('SpeedSlider', {
    Text = '速度值',
    Default = 16,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        getgenv().NoClipSpeed.Speed = value
        speedLabel:SetText(tostring(value))
    end
})

ControlGroup:AddDropdown('MethodDropdown', {
    Text = '移动方法',
    Values = {'CFrame传送', '速度向量', '身体速度'},
    Default = 1,
    Callback = function(value)
        if value == 'CFrame传送' then
            getgenv().NoClipSpeed.Method = 'CFrame'
        elseif value == '速度向量' then
            getgenv().NoClipSpeed.Method = 'Velocity'
        elseif value == '身体速度' then
            getgenv().NoClipSpeed.Method = 'BodyVelocity'
        end
    end
})

ControlGroup:AddToggle('SmoothToggle', {
    Text = '平滑移动',
    Default = true,
    Callback = function(value)
        getgenv().NoClipSpeed.Smooth = value
    end
})

local PresetGroup = MainTab:AddLeftGroupbox('快速预设')

PresetGroup:AddButton({
    Text = '步行 (16)',
    Func = function()
        getgenv().NoClipSpeed.Speed = 16
        speedLabel:SetText('16')
        Options.SpeedSlider:SetValue(16)
        Library:Notify('速度设为: 16', 1)
    end
})

PresetGroup:AddButton({
    Text = '跑步 (30)',
    Func = function()
        getgenv().NoClipSpeed.Speed = 30
        speedLabel:SetText('30')
        Options.SpeedSlider:SetValue(30)
        Library:Notify('速度设为: 30', 1)
    end
})

PresetGroup:AddButton({
    Text = '快速 (50)',
    Func = function()
        getgenv().NoClipSpeed.Speed = 50
        speedLabel:SetText('50')
        Options.SpeedSlider:SetValue(50)
        Library:Notify('速度设为: 50', 1)
    end
})

PresetGroup:AddButton({
    Text = '超快 (100)',
    Func = function()
        getgenv().NoClipSpeed.Speed = 100
        speedLabel:SetText('100')
        Options.SpeedSlider:SetValue(100)
        Library:Notify('速度设为: 100', 1)
    end
})

local JumpGroup = MainTab:AddLeftGroupbox('无限跳')

JumpGroup:AddToggle('InfiniteJumpToggle', {
    Text = '启用无限跳',
    Default = false,
    Callback = function(value)
        getgenv().InfiniteJump.Enabled = value
        if value then
            Library:Notify('无限跳已启用', 2)
        else
            Library:Notify('无限跳已禁用', 2)
        end
    end
})

JumpGroup:AddLabel('说明: 在空中可以多次跳跃', false)

-- 右侧：穿墙、飞行、键盘输入、状态信息
local NoclipGroup = MainTab:AddRightGroupbox('穿墙')

NoclipGroup:AddToggle('NoclipToggle', {
    Text = '启用穿墙',
    Default = false,
    Callback = function(value)
        getgenv().Noclip.Enabled = value
        if value then
            Library:Notify('穿墙已启用', 2)
        else
            Library:Notify('穿墙已禁用', 2)
        end
    end
})

NoclipGroup:AddLabel('说明: 可以穿过墙壁和物体', false)

local FlyGUIGroup = MainTab:AddRightGroupbox('飞行 GUI')

FlyGUIGroup:AddButton({
    Text = '启动 Fly GUI V3',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbai-script/1/refs/heads/main/fly%20v3"))()
        end)
        
        if success then
            Library:Notify('Fly GUI V3已启动', 2)
            if PlayingSound then Sound() end
        else
            Library:Notify('Fly GUI V3启动失败', 2)
        end
    end
})

FlyGUIGroup:AddLabel('说明: 点击按钮加载飞行脚本', false)
FlyGUIGroup:AddLabel('来源: 外部脚本', false)

local InputGroup = MainTab:AddRightGroupbox('键盘输入')

InputGroup:AddInput('SpeedInput', {
    Text = '直接输入速度',
    Default = '',
    Placeholder = '输入1-500的数字',
    Numeric = true,
    Finished = true,
    Callback = function(value)
        local num = tonumber(value)
        if num then
            num = math.clamp(num, 1, 500)
            getgenv().NoClipSpeed.Speed = num
            speedLabel:SetText(tostring(num))
            Options.SpeedSlider:SetValue(num)
            Library:Notify('速度设为: ' .. num, 1)
        end
    end
})

local DebugGroup = MainTab:AddRightGroupbox('状态信息')

DebugGroup:AddLabel('移动状态:', true)
local statusLabel = DebugGroup:AddLabel('等待移动...', false)

DebugGroup:AddToggle('PlaySound', {
    Text = '启用提示音',
    Default = true,
    Callback = function(value)
        PlayingSound = value
        if value then
            Sound()
            Library:Notify('提示音已启用', 1)
        else
            Library:Notify('提示音已禁用', 1)
        end
    end
})

userInputService.JumpRequest:Connect(function()
    if getgenv().InfiniteJump.Enabled then
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass('Humanoid')
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

runService.Stepped:Connect(function()
    if getgenv().Noclip.Enabled then
        local character = player.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA('BasePart') then
                    part.CanCollide = false
                end
            end
        end
    end
end)

player.CharacterAdded:Connect(function(character)
    task.wait(0.5)
    
    if getgenv().Noclip.Enabled then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA('BasePart') then
                part.CanCollide = false
            end
        end
    end
end)

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    if getgenv().AutoPrompt.Enabled then
        fireproximityprompt(prompt)
    end
end)

local function moveWithCFrame(character, direction, speed)
    local rootPart = character:FindFirstChild('HumanoidRootPart') or character:FindFirstChild('Torso')
    if not rootPart then return end
    
    local moveAmount = direction * (speed / 60)
    rootPart.CFrame = rootPart.CFrame + moveAmount
end

local function moveWithVelocity(character, direction, speed)
    local rootPart = character:FindFirstChild('HumanoidRootPart') or character:FindFirstChild('Torso')
    if not rootPart then return end
    
    local velocity = direction * (speed * 5)
    rootPart.Velocity = Vector3.new(velocity.X, rootPart.Velocity.Y, velocity.Z)
end

local bodyVelocity = nil
local function moveWithBodyVelocity(character, direction, speed)
    local rootPart = character:FindFirstChild('HumanoidRootPart') or character:FindFirstChild('Torso')
    if not rootPart then return end
    
    if not bodyVelocity or bodyVelocity.Parent ~= rootPart then
        bodyVelocity = Instance.new('BodyVelocity')
        bodyVelocity.MaxForce = Vector3.new(4000, 0, 4000)
        bodyVelocity.P = 1250
        bodyVelocity.Parent = rootPart
    end
    
    bodyVelocity.Velocity = direction * (speed * 5)
end

local function cleanupBodyVelocity()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
end

local currentVelocity = Vector3.new(0, 0, 0)
local lastPosition = nil

runService.RenderStepped:Connect(function()
    if not getgenv().NoClipSpeed.Enabled then
        cleanupBodyVelocity()
        statusLabel:SetText('已禁用')
        return
    end
    
    local character = player.Character
    if not character then
        statusLabel:SetText('未找到角色')
        return
    end
    
    local humanoid = character:FindFirstChildOfClass('Humanoid')
    if not humanoid or humanoid.Health <= 0 then
        statusLabel:SetText('角色死亡')
        return
    end
    
    local moveDirection = humanoid.MoveDirection
    
    if moveDirection.Magnitude > 0.1 then
        local speed = getgenv().NoClipSpeed.Speed
        local method = getgenv().NoClipSpeed.Method
        
        statusLabel:SetText(string.format('移动中 | 速度: %.1f', speed))
        
        if method == 'CFrame' then
            moveWithCFrame(character, moveDirection, speed)
        elseif method == 'Velocity' then
            moveWithVelocity(character, moveDirection, speed)
        elseif method == 'BodyVelocity' then
            moveWithBodyVelocity(character, moveDirection, speed)
        end
    else
        statusLabel:SetText('未移动')
        if getgenv().NoClipSpeed.Method == 'BodyVelocity' and bodyVelocity then
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
    end
end)

player.CharacterAdded:Connect(function()
    cleanupBodyVelocity()
    task.wait(1)
    if PlayingSound then
        Sound()
    end
end)

Library.ToggleKeybind = Options.MenuKeybind

local folder_path = "NoClipSpeed"
local file_path = "Settings"

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder(folder_path)
SaveManager:SetFolder(folder_path .. '/' .. file_path)

SaveManager:BuildConfigSection(MainTab)
ThemeManager:ApplyToTab(MainTab)

SaveManager:LoadAutoloadConfig()

task.wait(0.5)
Sound()

Library:Notify('空白脚本中心 v2.8 已加载', 3)
Library:Notify('作者: 空白 | QQ群: 823938617', 3)

Library:Notify('方法: CFrame传送 (不修改属性)', 3)

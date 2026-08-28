local WindUISuccess, WindUI = pcall(function()    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)

if not WindUISuccess then
    error("WindUI加载失败: "..tostring(WindUI))
    return
end

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        local char = text:sub(i, i)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, char)
    end
    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "缝合脚本",
    Content = "这是"..gradient("XV", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")).."脚本",
    Buttons = {
        { Title = "关闭", Callback = function() end, Variant = "Secondary" },
        { Title = "继续", Icon = "arrow-right", Callback = function() Confirmed = true end, Variant = "Primary" }
    }
})

repeat task.wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "XV脚本V0.1",
    Folder = "XVHub",
    Size = UDim2.fromOffset(580, 600),
    Theme = "Dark",
})

local MainTab = Window:Tab({ Title = "主页", Icon = "zap" })
local AnnouncementTab = Window:Tab({ Title = "公告", Icon = "zap" })
local PlayerTab = Window:Tab({ Title = "通用", Icon = "zap" })
local TeleportTab = Window:Tab({ Title = "传送", Icon = "map-pin" })
local FETab = Window:Tab({ Title = "FE", Icon = "eye" })
local zbgzuiTab = Window:Tab({ Title = "做脚本工具", Icon = "keyboard" })
local deltaUITab = Window:Tab({ Title = "忍者注入器改ui", Icon = "sparkles" })
local skidTab = Window:Tab({ Title = "script kid最爱", Icon = "trash" })
local VRADLTab = Window:Tab({ Title = "VR", Icon = "eye" })
MainTab:Button({
local GameTab = Window:Tab({ Title = "栽赃", Icon = "user" })



local GameTab = Window:Tab({ Title = "最强战场", Icon = "zap" })
    Title = "复制q群1032142349",
    Desc = "复制q群号",
    Callback = function()
        local groupId = "1032142349"
        local success = pcall(function()
            setclipboard(groupId)
        end)
        
        if success then
            WindUI:Notify({
                Title = "复制成功",
                Content = "群号已复制",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "复制失败",
                Content = "1032142349",
                Duration = 5
            })
        end
    end    
})

AnnouncementTab:Paragraph({
    Desc = "windUI",
    Color = "Blue"
})

AnnouncementTab:Paragraph({
    Title = "公告",
    Desc = "禁止倒卖，被骗了就是🐷🧠脚本永久免费因为收费会被大妞打压😂",
    Color = "Red"
})

AnnouncementTab:Paragraph({
    Title = "更新进度",
    Desc = "100%10",
    Color = "Orange"
})

local Speed = 1
local sudu = nil
local autoInteractLoop = nil
local backpackLoop = nil
local NoClipConnection = nil
local GodModeLoop = nil
local AntiFlingLoop = nil


PlayerTab:Input({
    Title = "设置重力",
    Value = tostring(game.Workspace.Gravity),
    Placeholder = "196.2",
    Callback = function(gravity)
        local value = tonumber(gravity) or 196.2
        game.Workspace.Gravity = value
    end    
})

PlayerTab:Input({
    Title = "设置快速跑步速度",
    Value = "0.2",
    Placeholder = "输入数值",
    Callback = function(speedValue)
        Speed = tonumber(speedValue) or 1
    end    
})

PlayerTab:Toggle({
    Title = "开启",
    Value = false,
    Callback = function(enabled)
        if enabled then
            sudu = game:GetService("RunService").Heartbeat:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
                    char:TranslateBy(char.Humanoid.MoveDirection * Speed / 0.5)
                end
            end)
        elseif sudu then
            sudu:Disconnect()
            sudu = nil
        end
    end    
})

PlayerTab:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(enabled)
        if enabled then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end    
})

PlayerTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            NoClipConnection = game:GetService("RunService").Stepped:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if NoClipConnection then
                NoClipConnection:Disconnect()
                NoClipConnection = nil
            end
        end
    end    
})
PlayerTab:Button({
    Title = "FPS优化器",
    Desc = "低画质换高帧率",
    Callback = function()
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local FPSLabel = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local UltraSoonBtn = Instance.new("TextButton")
local DiscordBtn = Instance.new("TextButton")
local YTBtn = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

local GFX_Enabled = false
local OriginalSettings = {}

ScreenGui.Parent = (CoreGui or Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MarkyXploitss_Optimizer"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -105) 
MainFrame.Size = UDim2.new(0, 250, 0, 210)
MainFrame.BackgroundTransparency = 0
MainFrame.Active = true
MainFrame.Draggable = true
Corner.CornerRadius = UDim.new(0, 4)
Corner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local function CreateNotification(msg)
    local NotifFrame = Instance.new("Frame")
    local NotifCorner = Instance.new("UICorner")
    local NotifStroke = Instance.new("UIStroke")
    local NotifText = Instance.new("TextLabel")

    NotifFrame.Size = UDim2.new(0, 160, 0, 30)
    NotifFrame.Position = UDim2.new(1, 20, 1, -45) 
    NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    NotifFrame.Parent = ScreenGui

    NotifCorner.CornerRadius = UDim.new(0, 4)
    NotifCorner.Parent = NotifFrame

    NotifStroke.Parent = NotifFrame
    NotifStroke.Color = Color3.fromRGB(0, 170, 255)
    NotifStroke.Thickness = 1.2

    NotifText.Size = UDim2.new(1, -10, 1, 0)
    NotifText.Position = UDim2.new(0, 5, 0, 0)
    NotifText.BackgroundTransparency = 1
    NotifText.Font = Enum.Font.GothamBold
    NotifText.Text = msg
    NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.TextSize = 8
    NotifText.Parent = NotifFrame

    NotifFrame:TweenPosition(UDim2.new(1, -170, 1, -45), "Out", "Quart", 0.4, true)
    
    task.delay(2.5, function()
        if NotifFrame then
            NotifFrame:TweenPosition(UDim2.new(1, 20, 1, -45), "In", "Quart", 0.4, true)
            task.wait(0.4)
            NotifFrame:Destroy()
        end
    end)
end

local function CleanPart(v)
    if not v:IsA("BasePart") and not v:IsA("Decal") and not v:IsA("Texture") then return end
    if v:IsDescendantOf(Players.LocalPlayer.Character) then return end

    if GFX_Enabled then
        if v:IsA("BasePart") then
            OriginalSettings[v] = {Material = v.Material, Reflectance = v.Reflectance}
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            if v.Name ~= "face" then
                OriginalSettings[v] = {Transparency = v.Transparency}
                v.Transparency = 1
            end
        end
    end
end

game.DescendantAdded:Connect(function(v)
    if GFX_Enabled then task.wait(0.1) CleanPart(v) end
end)

local function ToggleGFX()
    GFX_Enabled = not GFX_Enabled
    if GFX_Enabled then
        settings().Rendering.QualityLevel = 1
        for _, v in pairs(game:GetDescendants()) do CleanPart(v) end
        ToggleBtn.Text = "LOW GFX: ON"
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 127)
        CreateNotification("Graphics Optimized")
    else
        settings().Rendering.QualityLevel = 0
        for obj, props in pairs(OriginalSettings) do
            if obj and obj.Parent then
                for prop, val in pairs(props) do obj[prop] = val end
            end
        end
        OriginalSettings = {}
        ToggleBtn.Text = "LOW GFX: OFF"
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
        CreateNotification("Graphics Restored")
    end
end

local function BuildUI()
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 8)
    Title.Size = UDim2.new(1, 0, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "MarkyXploitss Optimizer"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 11

    FPSLabel.Parent = MainFrame
    FPSLabel.BackgroundTransparency = 1
    FPSLabel.Position = UDim2.new(0, 0, 0, 26) 
    FPSLabel.Size = UDim2.new(1, 0, 0, 25)
    FPSLabel.Font = Enum.Font.GothamBold
    FPSLabel.Text = "FPS: ..."
    FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FPSLabel.TextSize = 14

    local function SetupBtn(btn, text, pos, color, locked)
        btn.Parent = MainFrame
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.Position = pos
        btn.Size = UDim2.new(0.9, 0, 0, 28)
        btn.Font = Enum.Font.GothamBold
        btn.Text = text
        btn.TextColor3 = color
        btn.TextSize = 9
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
        if locked then btn.BackgroundTransparency = 0.6 btn.TextTransparency = 0.5 end
    end

    SetupBtn(ToggleBtn, "LOW GFX: OFF", UDim2.new(0.05, 0, 0.32, 0), Color3.fromRGB(255, 80, 80))
    SetupBtn(UltraSoonBtn, "ULTRA LOW GFX (SOON)", UDim2.new(0.05, 0, 0.48, 0), Color3.fromRGB(150, 150, 150), true)
    SetupBtn(DiscordBtn, "COPY DISCORD", UDim2.new(0.05, 0, 0.64, 0), Color3.fromRGB(200, 200, 200))
    SetupBtn(YTBtn, "COPY YOUTUBE", UDim2.new(0.05, 0, 0.80, 0), Color3.fromRGB(200, 200, 200))
end

task.spawn(function()
    local hue = 0
    while task.wait() do
        hue = hue + 0.005
        if hue > 1 then hue = 0 end
        UIStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

task.spawn(function()
    while task.wait(1) do
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        FPSLabel.Text = "FPS: " .. fps
    end
end)

BuildUI()

ToggleBtn.MouseButton1Click:Connect(ToggleGFX)
UltraSoonBtn.MouseButton1Click:Connect(function() CreateNotification("Coming Soon") end)
DiscordBtn.MouseButton1Click:Connect(function() 
    if setclipboard then setclipboard("🐧group:1032142349") end 
    DiscordBtn.Text = "COPIED" task.wait(1) DiscordBtn.Text = "COPY DISCORD" 
end)
YTBtn.MouseButton1Click:Connect(function() 
    if setclipboard then setclipboard("🐧1032142349") end 
    YTBtn.Text = "COPIED" task.wait(1) YTBtn.Text = "COPY YOUTUBE" 
end)

    end
})

PlayerTab:Button({
    Title = "回满血",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid.Health = 10000
            WindUI:Notify({Title = "皿量", Content = "已满", Duration = 3})
        end
    end    
})

PlayerTab:Button({
    Title = "无限跳跃",
    Callback = function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid:ChangeState("Jumping")
            end
        end)
    end    
})

PlayerTab:Toggle({
    Title = "无敌 (依旧客户端)",
    Value = false,
    Callback = function(state)
        if state then
            GodModeLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char.Humanoid.Health = 10000
                end
            end)
        else
            if GodModeLoop then
                GodModeLoop:Disconnect()
                GodModeLoop = nil
            end
        end
    end    
})

PlayerTab:Button({
    Title = "飞行",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Ansk2xd3"))()
    end    
})
PlayerTab:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
    end    
})
PlayerTab:Button({
    Title = "自动弹钢琴(需解卡)",
    Callback = function()
        pcall(function()
loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/TALENTLESS.lua", true))()
end)
    end    
})
PlayerTab:Button({
    Title = "最垃圾电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
    end    
})

PlayerTab:Button({
    Title = "delta键盘(最好用的键盘)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/pQyDAArb"))()
    end    
})

PlayerTab:Toggle({
    Title = "防甩飞",
    Value = false,
    Callback = function(enabled)
        if enabled then
            AntiFlingLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local localPlayer = game.Players.LocalPlayer
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        for _, part in ipairs(player.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
            WindUI:Notify({Title = "防甩飞", Content = "已开启", Duration = 3})
        else
            if AntiFlingLoop then
                AntiFlingLoop:Disconnect()
                AntiFlingLoop = nil
                WindUI:Notify({Title = "防甩飞", Content = "已关闭", Duration = 3})
            end
        end
    end    
})

PlayerTab:Toggle({
    Title = "获取所有玩家背包",
    Value = false,
    Callback = function(enabled)
        if enabled then
            backpackLoop = game:GetService("RunService").Heartbeat:Connect(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    for _, tool in pairs(player.Backpack:GetChildren()) do
                        tool.Parent = game.Players.LocalPlayer.Backpack
                    end
                end
            end)
        else
            if backpackLoop then
                backpackLoop:Disconnect()
                backpackLoop = nil
            end
        end
    end    
})

PlayerTab:Button({
    Title = "装备全部道具",
    Callback = function()
        local tools = game.Players.LocalPlayer.Backpack:GetChildren()
        if #tools > 0 then
            for i, v in pairs(tools) do
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
    end    
})

PlayerTab:Button({
    Title = "删除所有道具",
    Callback = function()
        local tools = game.Players.LocalPlayer.Backpack:GetChildren()
        for i, v in pairs(tools) do
            v:Destroy()
        end
    end    
})

PlayerTab:Toggle({
    Title = "自动互动",
    Value = false,
    Callback = function(enabled)
        if enabled then
            autoInteractLoop = game:GetService("RunService").Heartbeat:Connect(function()
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
            end)
        else
            if autoInteractLoop then
                autoInteractLoop:Disconnect()
                autoInteractLoop = nil
            end
        end
    end    
})

PlayerTab:Button({
    Title = "快速互动",
    Callback = function()
        game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
    end    
})

PlayerTab:Button({
    Title = "自杀",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid.Health = 0
        end
    end    
})

local PlayerConfig = { playernamedied = "" }
local playerDropdown

local function refreshPlayers()
    local newOptions = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game.Players.LocalPlayer.Name then
            table.insert(newOptions, player.Name)
        end
    end
    
    if playerDropdown then
        playerDropdown:Refresh(newOptions, true)
        PlayerConfig.playernamedied = ""
    end
end

playerDropdown = TeleportTab:Dropdown({
    Title = "选择玩家",
    Values = {},
    Value = nil,
    AllowNone = true,
    Callback = function(selectedPlayer)
        PlayerConfig.playernamedied = selectedPlayer
    end
})

TeleportTab:Button({
    Title = "刷新列表",
    Callback = function()
        refreshPlayers()
    end
})

TeleportTab:Button({
    Title = "传送",
    Callback = function()
        if PlayerConfig.playernamedied ~= "" then
            local localRootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
            
            if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
})

TeleportTab:Button({
    Title = "把玩家传送过来",
    Callback = function()
        if PlayerConfig.playernamedied ~= "" then
            local localRootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
            
            if localRootPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                targetPlayer.Character.HumanoidRootPart.CFrame = localRootPart.CFrame
            end
        end
    end
})

local Animations = {
    { Name = "宇航员", Idle1 = "891621366", Idle2 = "891633237", Walk = "891667138", Run = "891636393", Jump = "891627522", Climb = "891609353", Fall = "891617961" },
    { Name = "泡状", Idle1 = "910004836", Idle2 = "910009958", Walk = "910034870", Run = "910025107", Jump = "910016857", Fall = "910001910" },
    { Name = "卡通", Idle1 = "742637544", Idle2 = "742638445", Walk = "742640026", Run = "742638842", Jump = "742637942", Climb = "742636889", Fall = "742637151" },
    { Name = "老人", Idle1 = "845397899", Idle2 = "845400520", Walk = "845403856", Run = "845386501", Jump = "845398858", Climb = "845392038", Fall = "845396048" },
    { Name = "骑士", Idle1 = "657595757", Idle2 = "657568135", Walk = "657552124", Run = "657564596", Jump = "658409194", Climb = "658360781", Fall = "657600338" },
    { Name = "悬浮", Idle1 = "616006778", Idle2 = "616008087", Walk = "616013216", Run = "616010382", Jump = "616008936", Climb = "616003713", Fall = "616005863" },
    { Name = "法师", Idle1 = "707742142", Idle2 = "707855907", Walk = "707897309", Run = "707861613", Jump = "707853694", Climb = "707826056", Fall = "707829716" },
    { Name = "忍者", Idle1 = "656117400", Idle2 = "656118341", Walk = "656121766", Run = "656118852", Jump = "656117878", Climb = "656114359", Fall = "656115606" },
    { Name = "海盗", Idle1 = "750781874", Idle2 = "750782770", Walk = "750785693", Run = "750783738", Jump = "750782230", Climb = "750779899", Fall = "750780242" },
    { Name = "机器人", Idle1 = "616088211", Idle2 = "616089559", Walk = "616095330", Run = "616091570", Jump = "616090535", Climb = "616086039", Fall = "616087089" },
    { Name = "时尚", Idle1 = "616136790", Idle2 = "616138447", Walk = "616146177", Run = "616140816", Jump = "616139451", Climb = "616133594", Fall = "616134815" },
    { Name = "超级英雄", Idle1 = "616111295", Idle2 = "616113536", Walk = "616122287", Run = "616117076", Jump = "616115533", Climb = "616104706", Fall = "616108001" },
    { Name = "玩具", Idle1 = "782841498", Idle2 = "782845736", Walk = "782843345", Run = "782842708", Jump = "782847020", Climb = "782843869", Fall = "782846423" },
    { Name = "吸血鬼", Idle1 = "1083445855", Idle2 = "1083450166", Walk = "1083473930", Run = "1083462077", Jump = "1083455352", Climb = "1083439238", Fall = "1083443587" },
    { Name = "狼人", Idle1 = "1083195517", Idle2 = "1083214717", Walk = "1083178339", Run = "1083216690", Jump = "1083218792", Climb = "1083182000", Fall = "1083189019" },
    { Name = "僵尸", Idle1 = "616158929", Idle2 = "616160636", Walk = "616168032", Run = "616163682", Jump = "616161997", Climb = "616156119", Fall = "616157476" },
    { Name = "巡逻", Idle1 = "1149612882", Idle2 = "1150842221", Walk = "1151231493", Run = "1150967949", Jump = "1148811837", Climb = "1148811837", Fall = "1148863382" },
    { Name = "自信", Idle1 = "1069977950", Idle2 = "1069987858", Walk = "1070017263", Run = "1070001516", Jump = "1069984524", Climb = "1069946257", Fall = "1069973677" },
    { Name = "明星", Idle1 = "1212900985", Idle2 = "1150842221", Walk = "1212980338", Run = "1212980348", Jump = "1212954642", Climb = "1213044953", Fall = "1212900995" },
    { Name = "牛仔", Idle1 = "1014390418", Idle2 = "1014398616", Walk = "1014421541", Run = "1014401683", Jump = "1014394726", Climb = "1014380606", Fall = "1014384571" },
    { Name = "鬼", Idle1 = "616006778", Idle2 = "616008087", Walk = "616013216", Run = "616013216", Jump = "616008936", Fall = "616005863" },
    { Name = "小偷", Idle1 = "1132473842", Idle2 = "1132477671", Walk = "1132510133", Run = "1132494274", Jump = "1132489853", Climb = "1132461372", Fall = "1132469004" },
    { Name = "公主", Idle1 = "941003647", Idle2 = "941013098", Walk = "941028902", Run = "941015281", Jump = "941008832", Climb = "940996062", Fall = "941000007" },
    { Name = "没有", Idle1 = "0", Idle2 = "0", Walk = "0", Run = "0", Jump = "0", Climb = "0", Fall = "0" },
    { Name = "人类(预设)", Idle1 = "2510196951", Idle2 = "2510197257", Walk = "2510202577", Run = "2510198475", Jump = "2510197830", Climb = "2510192778", Fall = "2510195892" },
}

-- 获取所有动作名称
local animNames = {}
for i, anim in ipairs(Animations) do
    table.insert(animNames, anim.Name)
end

local selectedAnim = ""

-- 动作选择下拉框
FETab:Dropdown({
    Title = "选择动作",
    Values = animNames,
    Value = nil,
    AllowNone = false,
    Callback = function(selected)
        selectedAnim = selected
    end
})

-- 执行动作按钮
FETab:Button({
    Title = "执行动作(只支持R15)",
    Callback = function()
        if selectedAnim ~= "" then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Animate") then
                local Animate = char.Animate
                
                for _, anim in ipairs(Animations) do
                    if anim.Name == selectedAnim then
                        if Animate.idle and Animate.idle.Animation1 then
                            Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Idle1
                        end
                        if Animate.idle and Animate.idle.Animation2 then
                            Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Idle2
                        end
                        if Animate.walk and Animate.walk.WalkAnim then
                            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Walk
                        end
                        if Animate.run and Animate.run.RunAnim then
                            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Run
                        end
                        if Animate.jump and Animate.jump.JumpAnim then
                            Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Jump
                        end
                        if anim.Climb and Animate.climb and Animate.climb.ClimbAnim then
                            Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Climb
                        end
                        if Animate.fall and Animate.fall.FallAnim then
                            Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=" .. anim.Fall
                        end
                        
                        if char:FindFirstChildOfClass("Humanoid") then
                            char.Humanoid.Jump = true
                        end
                        
                        WindUI:Notify({
                            Title = "动作已更改",
                            Content = "已切换到: " .. anim.Name,
                            Duration = 3
                        })
                        break
                    end
                end
            else
                WindUI:Notify({
                    Title = "错误",
                    Content = "无法找到角色动画",
                    Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "提示",
                Content = "请先选择动作",
                Duration = 3
            })
        end
    end
})

FETab:Button({
    Title = "R6导子",
    Desc = "装备后导致子",
    Callback = function()
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")

        local LocalPlayer = Players.LocalPlayer
        local IsActive = false
        local RenderConnections = {}

        local function CreateTool()
            local Tool = Instance.new("Tool")
            Tool.Name = "Jerk Off"
            Tool.RequiresHandle = false
            Tool.Parent = LocalPlayer.Backpack
            return Tool
        end

        local function PlayAnimation(AnimationId, StartTime, EndTime, Index)
            local Character = LocalPlayer.Character
            if not Character then return end

            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if not Humanoid then
                warn("Humanoid not found!")
                return
            end

            local Animation = Instance.new("Animation")
            Animation.AnimationId = "rbxassetid://" .. AnimationId
            local AnimationTrack = Humanoid:LoadAnimation(Animation)

            RenderConnections[Index] = RunService.RenderStepped:Connect(function()
                if IsActive then
                    if EndTime <= AnimationTrack.TimePosition or AnimationTrack.IsPlaying == false then
                        AnimationTrack:Play()
                        AnimationTrack.TimePosition = StartTime
                    end
                else
                    AnimationTrack:Stop()
                end
            end)

            AnimationTrack:Play()
            AnimationTrack.TimePosition = StartTime
        end

        local function StartAnimations()
            PlayAnimation("72042024", 0.5, 0.9, 1)
            PlayAnimation("168268306", 1, 1.001, 2)
            IsActive = true
        end

        local function StopAnimations()
            IsActive = false

            for _, Connection in pairs(RenderConnections) do
                Connection:Disconnect()
            end

            RenderConnections = {}
        end

        local function OnEquipped()
            StartAnimations()
        end

        local function OnUnequipped()
            StopAnimations()
        end

        LocalPlayer.CharacterAdded:Connect(function()
            if LocalPlayer.Backpack:FindFirstChild("Jerk Off") then
                LocalPlayer.Backpack["Jerk Off"]:Destroy()
            end

            local Tool = CreateTool()
            Tool.Equipped:Connect(OnEquipped)
            Tool.Unequipped:Connect(OnUnequipped)
        end)

        local Tool = CreateTool()
        Tool.Equipped:Connect(OnEquipped)
        Tool.Unequipped:Connect(OnUnequipped)
        
        WindUI:Notify({
            Title = "R6导管子",
            Content = "已获得导管子道具",
            Duration = 3
        })
    end
})

FETab:Button({
    Title = "R15导",
    Desc = "装备后导管子",
    Callback = function()
        local AnimationId = "rbxassetid://698251653"
        local LocalPlayer = game.Players.LocalPlayer

        local function CreateTool()
            local Tool = Instance.new("Tool")
            Tool.Name = "Jerk Off R15"
            Tool.RequiresHandle = false
            Tool.Parent = LocalPlayer.Backpack

            local AnimationTrack = nil

            Tool.Equipped:Connect(function()
                local Humanoid = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    local Animation = Instance.new("Animation")
                    Animation.AnimationId = AnimationId
                    AnimationTrack = Humanoid:LoadAnimation(Animation)
                    AnimationTrack.Looped = false
                    AnimationTrack:Play()
                    AnimationTrack.TimePosition = 0.58
                    AnimationTrack:AdjustSpeed(0.4)

                    task.spawn(function()
                        while AnimationTrack and AnimationTrack.IsPlaying do
                            if AnimationTrack.TimePosition >= 0.63 then
                                AnimationTrack.TimePosition = 0.58
                            end
                            task.wait()
                        end
                    end)
                end
            end)

            Tool.Unequipped:Connect(function()
                if AnimationTrack then
                    AnimationTrack:Stop()
                    AnimationTrack = nil
                end
            end)
        end

        CreateTool()

        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            CreateTool()
        end)
        
        WindUI:Notify({
            Title = "R15导管",
            Content = "已获得导管子道具",
            Duration = 3
        })
    end
})



















GameTab:Button({
    Title = "最强战场脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/main/Trashcan%20Man"))()
    end    
})

GameTab:Button({
    Title = "动作",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt"))()
    end    
})

zbgzuiTab:Button({
    Title = "rspy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
    end    
})

zbgzuiTab:Button({
    Title = "cspy",
    Callback = function()
        loadstring(game:HttpGet("https://gitlab.com/upio/cobalt/-/releases/permalink/latest/downloads/Cobalt.luau"))()
    end    
})

zbgzuiTab:Button({
    Title = "Dex",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
    end    
})

zbgzuiTab:Button({
    Title = "mdex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end    
})

deltaUITab:Button({
    Title = "彩虹边框",
    Desc = "让所有悬浮窗边框变彩虹色",
    Callback = function()
        if not _G.StartedRaidowIcon then
            _G.StartedRaidowIcon = true
            local CoreGui = game:GetService("CoreGui")
            local h = 0
            spawn(function()
                while task.wait(0.01) do
                    h = (h + 3) % 360
                    local c = Color3.fromHSV(h/360, 1, 1)
                    for _, v in ipairs(CoreGui:GetDescendants()) do
                        if v:IsA("UIStroke") and v.Parent:IsA("ImageButton") and v.Parent.Parent:IsA("ScreenGui") and v.Parent.Parent.Parent:IsA("Folder") and v.Parent.Parent.Parent.Parent.Name == "CoreGui" then
                            v.Color = c
                        end
                    end
                end
            end)
        end
    end
})

skidTab:Button({
    Title = "LALOL",
    Desc = "后门执行器",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xPbiiwwp"))()
    end    
})

skidTab:Button({
    Title = "AC6放音乐",
    Desc = "服务器漏洞播放音乐",
    Callback = function()
        local loopState = true

        local SafeCloneRef = function(inst)
            local success, cloned = pcall(function()
                return cloneref(inst)
            end)
            return success and cloned or inst
        end

        local Workspace = game:GetService("Workspace")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local UserInputService = SafeCloneRef(game:GetService("UserInputService"))
        local InjectTo = game:GetService("TestService")

        local function findRemoteEvent(name, parent)
            local results = parent:QueryDescendants(">>RemoteEvent#" .. name)
            return results[1]
        end

        local function getRemoteEvent()
            return findRemoteEvent("AC6_FE_Sounds", Workspace) or findRemoteEvent("AC6_FE_Sounds", ReplicatedStorage)
        end

        local function HideAc6Gui()
            local success, result = pcall(function()
                return gethui()
            end)
            if success and result then
                return result
            else
                return game:GetService("CoreGui"):FindFirstChild("RobloxGui")
            end
        end

        local HiddenGuiForAC6 = HideAc6Gui()

        local specialChars = "qwertyuiopasdfghjklzxcvbnm"
        local randomName = nil
        local function generateRandomName()
            local length = math.random(5, 10)
            local name = ""
            for i = 1, length do
                local index = math.random(1, #specialChars)
                name = name .. specialChars:sub(index, index)
            end
            return name
        end

        local folder = Instance.new("Folder", HiddenGuiForAC6)
        folder.Name = generateRandomName()

        local OhNo = Instance.new("Sound", folder)
        OhNo.SoundId = "rbxassetid://9066167010"
        OhNo.Volume = 1

        local ClickySfx = Instance.new("Sound", folder)
        ClickySfx.SoundId = "rbxassetid://156785206"
        ClickySfx.Volume = 1

        local gui = Instance.new("ScreenGui", HiddenGuiForAC6)
        gui.Name = generateRandomName()
        gui.ResetOnSpawn = false

        local main = Instance.new("Frame", gui)
        main.Size = UDim2.new(0, 400, 0, 250)
        main.Position = UDim2.new(0.5, -200, 0.5, -125)
        main.BackgroundColor3 = Color3.new(0, 0, 0)
        Instance.new("UICorner", main)
        Instance.new("UIDragDetector", main)

        local border = Instance.new("Frame", main)
        border.Size = UDim2.new(1, 10, 1, 10)
        border.Position = UDim2.new(0, -5, 0, -5)
        border.BackgroundColor3 = Color3.new(255, 255, 255)
        border.ZIndex = 0
        Instance.new("UICorner", border)

        local grad = Instance.new("UIGradient", border)
        grad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255,255,0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,255,0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,255)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0,0,255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255,0,255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,0))
        }
        grad.Rotation = 0

        task.spawn(function()
            while task.wait(0.03) do
                grad.Rotation = (grad.Rotation + 1) % 360
            end
        end)

        local title = Instance.new("TextLabel", main)
        title.Size = UDim2.new(1, 0, 0, 40)
        title.BackgroundTransparency = 1
        title.Text = "Ac6-Vulnerablity"
        title.Font = Enum.Font.Cartoon
        title.TextSize = 28
        title.TextColor3 = Color3.new(1,1,1)

        local titleGrad = grad:Clone()
        titleGrad.Parent = title
        task.spawn(function()
            while task.wait(0.03) do
                titleGrad.Rotation = (titleGrad.Rotation + 1) % 360
            end
        end)

        local textBox = Instance.new("TextBox", main)
        textBox.Size = UDim2.new(0.8, 0, 0, 40)
        textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
        textBox.BackgroundColor3 = Color3.new(0, 0, 0)
        textBox.TextColor3 = Color3.new(1, 1, 1)
        textBox.PlaceholderText = "输入音乐ID"
        textBox.Text = ""
        textBox.Font = Enum.Font.Cartoon
        textBox.TextSize = 20
        textBox.TextWrap = true
        Instance.new("UICorner", textBox)

        local volumeBox = Instance.new("TextBox", main)
        volumeBox.Size = UDim2.new(0.25, 0, 0, 35)
        volumeBox.Position = UDim2.new(0.1, 0, 0.6, 0)
        volumeBox.BackgroundColor3 = Color3.new(0, 0, 0)
        volumeBox.TextColor3 = Color3.new(1, 1, 1)
        volumeBox.PlaceholderText = "音量"
        volumeBox.Text = ""
        volumeBox.Font = Enum.Font.Cartoon
        volumeBox.TextSize = 18
        volumeBox.ClearTextOnFocus = false
        volumeBox.TextWrap = true
        Instance.new("UICorner", volumeBox)

        local loopBox = Instance.new("TextButton", main)
        loopBox.Size = UDim2.new(0.25, 0, 0, 35)
        loopBox.Position = UDim2.new(0.375, 0, 0.6, 0)
        loopBox.BackgroundColor3 = Color3.new(0, 0, 0)
        loopBox.TextColor3 = Color3.new(1, 1, 1)
        loopBox.Font = Enum.Font.Cartoon
        loopBox.TextSize = 18
        loopBox.RichText = true
        loopBox.Text = "循环? <font color='rgb(0,255,0)'>开</font>"
        Instance.new("UICorner", loopBox)

        local pitchBox = Instance.new("TextBox", main)
        pitchBox.Size = UDim2.new(0.25, 0, 0, 35)
        pitchBox.Position = UDim2.new(0.65, 0, 0.6, 0)
        pitchBox.BackgroundColor3 = Color3.new(0, 0, 0)
        pitchBox.TextColor3 = Color3.new(1, 1, 1)
        pitchBox.PlaceholderText = "音调"
        pitchBox.Text = ""
        pitchBox.Font = Enum.Font.Cartoon
        pitchBox.TextSize = 18
        pitchBox.ClearTextOnFocus = false
        pitchBox.TextWrap = true
        Instance.new("UICorner", pitchBox)

        local button = Instance.new("TextButton", main)
        button.Size = UDim2.new(0.3, 0, 0, 35)
        button.Position = UDim2.new(0.35, 0, 0.8, 0)
        button.BackgroundColor3 = Color3.new(0, 0, 0)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Text = "播放!"
        button.Font = Enum.Font.Cartoon
        button.TextSize = 22
        Instance.new("UICorner", button)

        local closeButton = Instance.new("TextButton", main)
        closeButton.Size = UDim2.new(0, 30, 0, 30)
        closeButton.Position = UDim2.new(1, -35, 0, 5)
        closeButton.BackgroundColor3 = Color3.new(0, 0, 0)
        closeButton.TextColor3 = Color3.new(1, 1, 1)
        closeButton.Text = "X"
        closeButton.Font = Enum.Font.Cartoon
        closeButton.TextSize = 20
        Instance.new("UICorner", closeButton)

        local bubble = Instance.new("TextButton", gui)
        bubble.Size = UDim2.new(0, 70, 0, 70)
        bubble.Position = UDim2.new(0.5, -35, 0.2, 0)
        bubble.BackgroundColor3 = Color3.new(0, 0, 0)
        bubble.TextColor3 = Color3.new(1, 1, 1)
        bubble.Text = "AC6"
        bubble.Font = Enum.Font.Cartoon
        bubble.TextSize = 22
        bubble.Visible = false
        Instance.new("UICorner", bubble)

        local bubbleGrad = titleGrad:Clone()
        bubbleGrad.Parent = bubble
        task.spawn(function()
            while task.wait(0.03) do
                bubbleGrad.Rotation = (bubbleGrad.Rotation + 1) % 360
            end
        end)

        closeButton.MouseButton1Click:Connect(function()
            main.Visible = false
            bubble.Visible = true
            ClickySfx:Play()
        end)

        bubble.MouseButton1Click:Connect(function()
            main.Visible = true
            bubble.Visible = false
            ClickySfx:Play()
        end)

        local dragging = false
        local dragInput, dragStart, startPos

        local function update(input)
            local delta = input.Position - dragStart
            bubble.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        bubble.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = bubble.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        bubble.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)

        loopBox.MouseButton1Click:Connect(function()
            ClickySfx:Play()
            if loopState then
                loopState = false
                loopBox.Text = "循环? <font color='rgb(255,0,0)'>关</font>"
            else
                loopState = true
                loopBox.Text = "循环? <font color='rgb(0,255,0)'>开</font>"
            end
        end)

        button.MouseButton1Click:Connect(function()
            if not randomName then
                randomName = generateRandomName()
            end
            
            local musicId = textBox.Text
            local volume = tonumber(volumeBox.Text) or 1
            local pitch = tonumber(pitchBox.Text) or 1
            
            local assetId
            if string.find(musicId, "^rbxassetid://") then
                assetId = musicId
            else
                assetId = "rbxassetid://" .. musicId
            end

            local success, err = pcall(function()
                local currentRemote = getRemoteEvent()
                if currentRemote then
                    local args = {
                        [1] = "newSound",
                        [2] = randomName,
                        [3] = InjectTo,
                        [4] = assetId,
                        [5] = pitch,
                        [6] = volume,
                        [7] = loopState
                    }
                    currentRemote:FireServer(unpack(args))
                    currentRemote:FireServer("playSound", randomName)
                    WindUI:Notify({Title = "AC6", Content = "播放成功", Duration = 3})
                else
                    OhNo:Play()
                    WindUI:Notify({Title = "AC6", Content = "找不到漏洞", Duration = 5})
                end
            end)

            if not success then
                OhNo:Play()
                WindUI:Notify({Title = "AC6", Content = "连接失败", Duration = 5})
            else
                ClickySfx:Play()
            end
        end)
    end
})

VRADLTab:Button({
    Title = "VR手变vr脚本",
    Callback = function()
do
    local qot = queue_on_teleport or (syn and syn.queue_on_teleport)
    local checks = {
        { "getrawmetatable", getrawmetatable },
        { "setreadonly", setreadonly },
        { "newcclosure", newcclosure },
        { "getnamecallmethod", getnamecallmethod },
        { "getgc", getgc },
        { "queue_on_teleport", qot },
    }
    local missing, report = {}, "[VR Hands No-VR] UNC test:\n"
    for _, c in ipairs(checks) do
        local ok = type(c[2]) == "function"
        report = report .. (" [%s] %s\n"):format(ok and "+" or "-", c[1])
        if not ok then table.insert(missing, c[1]) end
    end
    print(report)
    if #missing > 0 then
        warn("[VR Hands No-VR] Missing functions: " .. table.concat(missing, ", "))
        warn("[VR Hands No-VR] Executor not supported - aborting (no teleport).")
        return
    end
    print("[VR Hands No-VR] UNC test passed - launching.")
end
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local hrs = [==[
local VRService = game:GetService("VRService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local identity = CFrame.identity
do
    local mt = getrawmetatable(game)
    local oldIndex = mt.__index
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, k)
        if k == "VREnabled" and (self == VRService or self == UIS) then return true end
        return oldIndex(self, k)
    end)
    mt.__namecall = newcclosure(function(self, ...)
        if self == VRService then
            local m = getnamecallmethod()
            if m == "GetUserCFrameEnabled" then return true end
            if m == "GetUserCFrame" then return identity end
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(mt, true)
end
task.spawn(function()
    local function ensureFolder(p, n)
        local f = p:FindFirstChild(n)
        if not f then f = Instance.new("Folder"); f.Name = n; f.Parent = p end
        return f
    end
    local function ensurePart(p, n)
        local x = p:FindFirstChild(n)
        if not x then
            x = Instance.new("Part"); x.Name = n
            x.Anchored = true; x.CanCollide = false; x.Transparency = 1
            x.Size = Vector3.new(1,1,1); x.Parent = p
        end
        return x
    end
    local function populate(cam)
        if not cam then return end
        ensurePart(ensureFolder(cam, "VRCoreEffectParts"), "Cursor")
        ensurePart(ensureFolder(cam, "VRCorePanelParts"), "BottomBar_Part")
    end
    populate(workspace.CurrentCamera)
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        populate(workspace.CurrentCamera)
    end)
    local t0 = os.clock()
    while os.clock() - t0 < 30 do
        populate(workspace.CurrentCamera)
        task.wait(0.1)
    end
end)
task.spawn(function()
    local lp = Players.LocalPlayer
    while not lp do task.wait() lp = Players.LocalPlayer end
    local uid = tostring(lp.UserId)
    local vrPlayers = workspace:WaitForChild("VRPlayers", 60)
    if not vrPlayers then warn("[NoVR] no VRPlayers") return end
    local rig = vrPlayers:WaitForChild(uid, 60)
    if not rig then warn("[NoVR] The server did not issue a rig") return end
    rig:WaitForChild("VRHead", 20)
    rig:WaitForChild("LeftHand", 20)
    rig:WaitForChild("RightHand", 20)
    local scaleVal = rig:FindFirstChild("VRScale")
    local cam = workspace.CurrentCamera
    local S = {
        reach = 0.55, spread = 0.34, height = -0.25,
        sens = 0.0025, moveK = 0.16, look = true,
        scale = 10,
        grabRadiusMult = 1,    -- 抓取范围倍率
        toggleGrabMode = false, -- 抓取模式：false=长按 true=切换
        speedMult = 1,         -- 移动速度倍率
    }
    local ok, VRUtils = pcall(function()
        return require(lp.PlayerScripts.ClientLoader.PlayerModule.VRModule.VRUtils)
    end)
    if ok and type(VRUtils) == "table" then
        VRUtils.GetUserCFrame = function(uc, scale)
            scale = scale or cam.HeadScale
            if scale <= 1 then scale = math.max((scaleVal and scaleVal.Value or 1) * 60, 6) end
            if uc == Enum.UserCFrame.LeftHand then
                local c = CFrame.new(-S.spread, S.height, -S.reach)
                return c.Rotation + c.Position * scale
            elseif uc == Enum.UserCFrame.RightHand then
                local c = CFrame.new(S.spread, S.height, -S.reach)
                return c.Rotation + c.Position * scale
            end
            return identity
        end
    else
        warn("[NoVR] failed to intercept VRUtils")
    end
    local vrm, Input
    for _ = 1, 250 do
        for _, o in pairs(getgc(true)) do
            if type(o) == "table"
            and rawget(o,"HeadsetPart") ~= nil and rawget(o,"Input") ~= nil
            and rawget(o,"CharacterScale") ~= nil and rawget(o,"DataManager") ~= nil then
                vrm = o; Input = rawget(o,"Input"); break
            end
        end
        if Input then break end
        for _, o in pairs(getgc(true)) do
            if type(o) == "table" and rawget(o,"directionLateral") ~= nil
            and rawget(o,"rFist") ~= nil and rawget(o,"turnDirection") ~= nil then
                Input = o; break
            end
        end
        if Input then break end
        task.wait(0.1)
    end
    if not Input then warn("[NoVR] Input object not found - grip will not work") end
    task.spawn(function()
        for _ = 1, 100 do
            pcall(function() RunService:UnbindFromRenderStep("Inputs") end)
            task.wait(0.1)
        end
    end)

    -- ========== 修复1：抓取范围体型补偿 + 倍率调节 ==========
    pcall(function()
        local pmMT = getrawmetatable(vrm.PropManager)
        if pmMT and rawget(pmMT, "GetBestGrabPartInRadius") then
            local orig = pmMT.GetBestGrabPartInRadius
            setreadonly(pmMT, false)
            pmMT.GetBestGrabPartInRadius = function(self, root, prox, radius, scale, ...)
                -- 以scale=10为基准，缩小体型时自动补偿抓取半径
                local scaleComp = 10 / math.max(S.scale, 0.1)
                local adjustedRadius = radius * scaleComp * S.grabRadiusMult
                return orig(self, root, prox, adjustedRadius, scale, ...)
            end
            setreadonly(pmMT, true)
        end
        local cmMT = getrawmetatable(vrm.CharacterManager)
        if cmMT and rawget(cmMT, "GetClosestCharacterInRadius") then
            local orig = cmMT.GetClosestCharacterInRadius
            setreadonly(cmMT, false)
            cmMT.GetClosestCharacterInRadius = function(self, pos, radius, ...)
                local scaleComp = 10 / math.max(S.scale, 0.1)
                local adjustedRadius = radius * scaleComp * S.grabRadiusMult
                return orig(self, pos, adjustedRadius, ...)
            end
            setreadonly(cmMT, true)
        end
    end)

    -- 突破体型限制：1-10放宽到0.1-100
    local function setScale(n)
        n = math.clamp(n, 0.1, 100)
        S.scale = n
        if scaleVal then pcall(function() scaleVal.Value = n / 10 end) end
        if vrm and vrm.DataManager and vrm.DataManager.SettingsManager then
            pcall(function() vrm.DataManager.SettingsManager:SetValue("vrscale", n) end)
        end
    end
    setScale(10)
    cam.HeadLocked = true
    local yaw, pitch
    do
        local lv = cam.CFrame.LookVector
        yaw = math.atan2(-lv.X, -lv.Z)
        pitch = math.asin(math.clamp(lv.Y, -1, 1))
    end
    local camPos = cam.CFrame.Position
    local keys = {}
    local function setLook(v)
        S.look = v
        if not UIS.TouchEnabled then
            UIS.MouseBehavior = v and Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default
            UIS.MouseIconEnabled = not v
        end
    end
    setLook(true)

    -- ========== 修复2：输入逻辑适配长按/切换双模式 ==========
    UIS.InputBegan:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.Keyboard then
            keys[io.KeyCode] = true
            if io.KeyCode == Enum.KeyCode.LeftAlt then setLook(not S.look) end
            if io.KeyCode == Enum.KeyCode.Equals then setScale(S.scale + 1) end
            if io.KeyCode == Enum.KeyCode.Minus then setScale(S.scale - 1) end
            -- PC端快捷键：[]调节抓取范围 ;'调节速度 G切换模式
            if io.KeyCode == Enum.KeyCode.LeftBracket then S.grabRadiusMult = math.clamp(S.grabRadiusMult - 0.1, 0.1, 10) end
            if io.KeyCode == Enum.KeyCode.RightBracket then S.grabRadiusMult = math.clamp(S.grabRadiusMult + 0.1, 0.1, 10) end
            if io.KeyCode == Enum.KeyCode.Semicolon then S.speedMult = math.clamp(S.speedMult - 0.1, 0.1, 10) end
            if io.KeyCode == Enum.KeyCode.Quote then S.speedMult = math.clamp(S.speedMult + 0.1, 0.1, 10) end
            if io.KeyCode == Enum.KeyCode.G then S.toggleGrabMode = not S.toggleGrabMode end

            if Input and io.KeyCode == Enum.KeyCode.E then
                if S.toggleGrabMode then
                    Input.rIndex = Input.rIndex == 1 and 0 or 1
                    if Input.rIndex == 1 then Input.rFist = 0; Input.rThumb = 0 end
                else
                    Input.rIndex = 1; Input.rFist = 0; Input.rThumb = 0
                end
            end
            if Input and io.KeyCode == Enum.KeyCode.Q then
                if S.toggleGrabMode then
                    Input.lIndex = Input.lIndex == 1 and 0 or 1
                    if Input.lIndex == 1 then Input.lFist = 0; Input.lThumb = 0 end
                else
                    Input.lIndex = 1; Input.lFist = 0; Input.lThumb = 0
                end
            end
        elseif io.UserInputType == Enum.UserInputType.MouseButton1 then
            if Input then
                if S.toggleGrabMode then
                    Input.rFist = Input.rFist == 1 and 0 or 1
                    Input.rIndex = Input.rIndex == 1 and 0 or 1
                else
                    Input.rFist = 1; Input.rIndex = 1
                end
            end
        elseif io.UserInputType == Enum.UserInputType.MouseButton2 then
            if Input then
                if S.toggleGrabMode then
                    Input.lFist = Input.lFist == 1 and 0 or 1
                    Input.lIndex = Input.lIndex == 1 and 0 or 1
                else
                    Input.lFist = 1; Input.lIndex = 1
                end
            end
        end
    end)
    UIS.InputEnded:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.Keyboard then
            keys[io.KeyCode] = false
            -- 仅长按模式下松开取消
            if Input and io.KeyCode == Enum.KeyCode.E and not S.toggleGrabMode then Input.rIndex = 0 end
            if Input and io.KeyCode == Enum.KeyCode.Q and not S.toggleGrabMode then Input.lIndex = 0 end
        elseif io.UserInputType == Enum.UserInputType.MouseButton1 then
            if Input and not S.toggleGrabMode then Input.rFist = 0; Input.rIndex = 0 end
        elseif io.UserInputType == Enum.UserInputType.MouseButton2 then
            if Input and not S.toggleGrabMode then Input.lFist = 0; Input.lIndex = 0 end
        end
    end)

    -- 突破手长限制：0.15-2.5放宽到0.05-20
    UIS.InputChanged:Connect(function(io)
        if io.UserInputType == Enum.UserInputType.MouseWheel then
            S.reach = math.clamp(S.reach - io.Position.Z * 0.07, 0.05, 20)
        end
    end)

    -- ========== 修复3：速度倍率生效 ==========
    RunService:BindToRenderStep("NoVR_Control", Enum.RenderPriority.Camera.Value + 1, function(dt)
        if S.look and not UIS.TouchEnabled then
            local d = UIS:GetMouseDelta()
            yaw = yaw - d.X * S.sens
            pitch = math.clamp(pitch - d.Y * S.sens, -1.45, 1.45)
            UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
        end
        local rot = CFrame.fromEulerAnglesYXZ(pitch, yaw, 0)
        local hs = cam.HeadScale; if hs <= 1 then hs = S.scale * 6 end
        local spd = (10 + S.scale * 4) * hs * S.moveK * S.speedMult
        local mv = Vector3.zero
        if keys[Enum.KeyCode.W] then mv += Vector3.new(0,0,-1) end
        if keys[Enum.KeyCode.S] then mv += Vector3.new(0,0, 1) end
        if keys[Enum.KeyCode.A] then mv += Vector3.new(-1,0,0) end
        if keys[Enum.KeyCode.D] then mv += Vector3.new( 1,0,0) end
        if keys[Enum.KeyCode.Space] then mv += Vector3.new(0, 1,0) end
        if keys[Enum.KeyCode.LeftShift] then mv += Vector3.new(0,-1,0) end
        if mv.Magnitude > 0 then camPos = camPos + (rot * mv.Unit) * spd * dt end
        cam.CameraType = Enum.CameraType.Scriptable
        cam.CFrame = CFrame.new(camPos) * rot
        if Input then
            Input.directionLateral = Vector2.zero
            Input.directionVertical = 0
            Input.turnDirection = 0
        end
    end)

    -- ========== HUD新增参数显示 ==========
    pcall(function()
        local gui = Instance.new("ScreenGui")
        gui.Name = "NoVR_HUD"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true
        gui.Parent = lp:WaitForChild("PlayerGui")
        local lbl = Instance.new("TextLabel", gui)
        lbl.AnchorPoint = Vector2.new(1, 0)
        lbl.Position = UDim2.new(1, -10, 0, 10)
        lbl.Size = UDim2.new(0, 360, 0, 220)
        lbl.BackgroundColor3 = Color3.fromRGB(0,0,0); lbl.BackgroundTransparency = 0.45
        lbl.TextColor3 = Color3.fromRGB(255,255,255)
        lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextYAlignment = Enum.TextYAlignment.Top
        lbl.Font = Enum.Font.Code; lbl.TextSize = 14
        RunService.Heartbeat:Connect(function()
            lbl.Text = ("[VR Hands :: No-VR]\n"
            .."Mouse - look | WASD - fly\n"
            .."Space/Shift - up / down\n"
            .."LMB/RMB - grab objects (R/L)\n"
            .."E/Q - pinch: grab PLAYERS (R/L)\n"
            .."Wheel - hand reach\n"
            .."+/- - body size: %.1f/100\n"
            .."[/] - grab radius: %.1fx\n"
            ..";/' - move speed: %.1fx\n"
            .."G - grab mode: %s\n"
            .."LeftAlt - free the cursor")
            :format(S.scale, S.grabRadiusMult, S.speedMult, S.toggleGrabMode and "Toggle" or "Hold")
        end)
    end)

    -- ========== 移动端全功能控制UI（新增按钮） ==========
    pcall(function()
        if UIS.TouchEnabled then
            local mobileGui = Instance.new("ScreenGui")
            mobileGui.Name = "NoVR_MobileControls"
            mobileGui.ResetOnSpawn = false
            mobileGui.IgnoreGuiInset = true
            mobileGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            mobileGui.Parent = lp:WaitForChild("PlayerGui")
            local function createBtn(parent, name, pos, size, text, textSize)
                textSize = textSize or 14
                local btn = Instance.new("TextButton")
                btn.Name = name
                btn.Position = pos
                btn.Size = size
                btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                btn.BackgroundTransparency = 0.5
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Text = text
                btn.Font = Enum.Font.SourceSansBold
                btn.TextSize = textSize
                btn.AutoButtonColor = false
                btn.Parent = parent
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
                return btn
            end
            local function bindPress(btn)
                btn.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.Touch then btn.BackgroundTransparency = 0.25 end
                end)
                btn.InputEnded:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.Touch then btn.BackgroundTransparency = 0.5 end
                end)
            end
            -- 1. 左下角方向键
            local dpad = Instance.new("Frame")
            dpad.Size = UDim2.fromScale(0.28, 0.22)
            dpad.Position = UDim2.fromScale(0.03, 0.97)
            dpad.AnchorPoint = Vector2.new(0, 1)
            dpad.BackgroundTransparency = 1
            dpad.Parent = mobileGui
            local up = createBtn(dpad, "Up", UDim2.fromScale(0.5, 0), UDim2.fromScale(0.35, 0.35), "▲", 18)
            up.AnchorPoint = Vector2.new(0.5, 0)
            local down = createBtn(dpad, "Down", UDim2.fromScale(0.5, 1), UDim2.fromScale(0.35, 0.35), "▼", 18)
            down.AnchorPoint = Vector2.new(0.5, 1)
            local left = createBtn(dpad, "Left", UDim2.fromScale(0, 0.5), UDim2.fromScale(0.35, 0.35), "◀", 18)
            left.AnchorPoint = Vector2.new(0, 0.5)
            local right = createBtn(dpad, "Right", UDim2.fromScale(1, 0.5), UDim2.fromScale(0.35, 0.35), "▶", 18)
            right.AnchorPoint = Vector2.new(1, 0.5)
            local function bindKey(btn, key)
                btn.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.Touch then keys[key] = true end
                end)
                btn.InputEnded:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.Touch then keys[key] = false end
                end)
                bindPress(btn)
            end
            bindKey(up, Enum.KeyCode.W)
            bindKey(down, Enum.KeyCode.S)
            bindKey(left, Enum.KeyCode.A)
            bindKey(right, Enum.KeyCode.D)
            -- 2. 左侧升降键
            local vert = Instance.new("Frame")
            vert.Size = UDim2.fromScale(0.09, 0.15)
            vert.Position = UDim2.fromScale(0.03, 0.78)
            vert.AnchorPoint = Vector2.new(0, 1)
            vert.BackgroundTransparency = 1
            vert.Parent = mobileGui
            local ascend = createBtn(vert, "Ascend", UDim2.fromScale(0, 0), UDim2.fromScale(1, 0.45), "↑", 16)
            local descend = createBtn(vert, "Descend", UDim2.fromScale(0, 1), UDim2.fromScale(1, 0.45), "↓", 16)
            descend.AnchorPoint = Vector2.new(0, 1)
            bindKey(ascend, Enum.KeyCode.Space)
            bindKey(descend, Enum.KeyCode.LeftShift)
            -- 3. 右下角：抓取+捏取（适配双模式）
            local grab = Instance.new("Frame")
            grab.Size = UDim2.fromScale(0.3, 0.18)
            grab.Position = UDim2.fromScale(0.97, 0.97)
            grab.AnchorPoint = Vector2.new(1, 1)
            grab.BackgroundTransparency = 1
            grab.Parent = mobileGui
            local grabL = createBtn(grab, "GrabL", UDim2.fromScale(0, 0), UDim2.fromScale(0.45, 0.45), "左抓", 14)
            local grabR = createBtn(grab, "GrabR", UDim2.fromScale(1, 0), UDim2.fromScale(0.45, 0.45), "右抓", 14)
            grabR.AnchorPoint = Vector2.new(1, 0)
            local pinchL = createBtn(grab, "PinchL", UDim2.fromScale(0, 1), UDim2.fromScale(0.45, 0.45), "左捏", 13)
            local pinchR = createBtn(grab, "PinchR", UDim2.fromScale(1, 1), UDim2.fromScale(0.45, 0.45), "右捏", 13)
            pinchL.AnchorPoint = Vector2.new(0, 1)
            pinchR.AnchorPoint = Vector2.new(1, 1)

            -- 左手抓取
            grabL.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input then
                    if S.toggleGrabMode then
                        Input.lFist = Input.lFist == 1 and 0 or 1
                        Input.lIndex = Input.lIndex == 1 and 0 or 1
                    else
                        Input.lFist = 1; Input.lIndex = 1
                    end
                end
            end)
            grabL.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input and not S.toggleGrabMode then
                    Input.lFist = 0; Input.lIndex = 0
                end
            end)
            bindPress(grabL)
            -- 右手抓取
            grabR.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input then
                    if S.toggleGrabMode then
                        Input.rFist = Input.rFist == 1 and 0 or 1
                        Input.rIndex = Input.rIndex == 1 and 0 or 1
                    else
                        Input.rFist = 1; Input.rIndex = 1
                    end
                end
            end)
            grabR.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input and not S.toggleGrabMode then
                    Input.rFist = 0; Input.rIndex = 0
                end
            end)
            bindPress(grabR)
            -- 左手捏取
            pinchL.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input then
                    if S.toggleGrabMode then
                        Input.lIndex = Input.lIndex == 1 and 0 or 1
                        if Input.lIndex == 1 then Input.lFist = 0; Input.lThumb = 0 end
                    else
                        Input.lIndex = 1; Input.lFist = 0; Input.lThumb = 0
                    end
                end
            end)
            pinchL.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input and not S.toggleGrabMode then
                    Input.lIndex = 0
                end
            end)
            bindPress(pinchL)
            -- 右手捏取
            pinchR.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input then
                    if S.toggleGrabMode then
                        Input.rIndex = Input.rIndex == 1 and 0 or 1
                        if Input.rIndex == 1 then Input.rFist = 0; Input.rThumb = 0 end
                    else
                        Input.rIndex = 1; Input.rFist = 0; Input.rThumb = 0
                    end
                end
            end)
            pinchR.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch and Input and not S.toggleGrabMode then
                    Input.rIndex = 0
                end
            end)
            bindPress(pinchR)

            -- 4. 右上角功能区（新增抓距、速度、模式按钮）
            local func = Instance.new("Frame")
            func.Size = UDim2.fromScale(0.28, 0.42)
            func.Position = UDim2.fromScale(0.97, 0.12)
            func.AnchorPoint = Vector2.new(1, 0)
            func.BackgroundTransparency = 1
            func.Parent = mobileGui
            
            -- 体型调节
            local scaleUp = createBtn(func, "ScaleUp", UDim2.fromScale(0, 0), UDim2.fromScale(0.48, 0.14), "变大", 11)
            local scaleDown = createBtn(func, "ScaleDown", UDim2.fromScale(1, 0), UDim2.fromScale(0.48, 0.14), "变小", 11)
            scaleDown.AnchorPoint = Vector2.new(1, 0)
            scaleUp.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then setScale(S.scale + 1) end
            end)
            scaleDown.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then setScale(S.scale - 1) end
            end)
            bindPress(scaleUp)
            bindPress(scaleDown)
            
            -- 手长调节
            local reachUp = createBtn(func, "ReachUp", UDim2.fromScale(0, 0.16), UDim2.fromScale(0.48, 0.14), "伸长", 11)
            local reachDown = createBtn(func, "ReachDown", UDim2.fromScale(1, 0.16), UDim2.fromScale(0.48, 0.14), "缩短", 11)
            reachDown.AnchorPoint = Vector2.new(1, 0)
            reachUp.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.reach = math.clamp(S.reach + 0.1, 0.05, 20)
                end
            end)
            reachDown.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.reach = math.clamp(S.reach - 0.1, 0.05, 20)
                end
            end)
            bindPress(reachUp)
            bindPress(reachDown)
            
            -- 抓取范围调节
            local grabUp = createBtn(func, "GrabUp", UDim2.fromScale(0, 0.32), UDim2.fromScale(0.48, 0.14), "抓距+", 11)
            local grabDown = createBtn(func, "GrabDown", UDim2.fromScale(1, 0.32), UDim2.fromScale(0.48, 0.14), "抓距-", 11)
            grabDown.AnchorPoint = Vector2.new(1, 0)
            grabUp.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.grabRadiusMult = math.clamp(S.grabRadiusMult + 0.1, 0.1, 10)
                end
            end)
            grabDown.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.grabRadiusMult = math.clamp(S.grabRadiusMult - 0.1, 0.1, 10)
                end
            end)
            bindPress(grabUp)
            bindPress(grabDown)
            
            -- 速度调节
            local speedUp = createBtn(func, "SpeedUp", UDim2.fromScale(0, 0.48), UDim2.fromScale(0.48, 0.14), "速度+", 11)
            local speedDown = createBtn(func, "SpeedDown", UDim2.fromScale(1, 0.48), UDim2.fromScale(0.48, 0.14), "速度-", 11)
            speedDown.AnchorPoint = Vector2.new(1, 0)
            speedUp.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.speedMult = math.clamp(S.speedMult + 0.1, 0.1, 10)
                end
            end)
            speedDown.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.speedMult = math.clamp(S.speedMult - 0.1, 0.1, 10)
                end
            end)
            bindPress(speedUp)
            bindPress(speedDown)
            
            -- 抓取模式切换
            local toggleGrab = createBtn(func, "ToggleGrab", UDim2.fromScale(0.5, 0.68), UDim2.fromScale(0.96, 0.14), "模式:长按", 11)
            toggleGrab.AnchorPoint = Vector2.new(0.5, 0)
            toggleGrab.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    S.toggleGrabMode = not S.toggleGrabMode
                    toggleGrab.Text = S.toggleGrabMode and "模式:切换" or "模式:长按"
                end
            end)
            bindPress(toggleGrab)
            
            -- 视角切换
            local toggleLook = createBtn(func, "ToggleLook", UDim2.fromScale(0.5, 0.86), UDim2.fromScale(0.96, 0.14), "解锁视角", 11)
            toggleLook.AnchorPoint = Vector2.new(0.5, 0)
            toggleLook.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then
                    setLook(not S.look)
                    toggleLook.Text = S.look and "解锁视角" or "锁定视角"
                end
            end)
            bindPress(toggleLook)

            -- 5. 右半屏滑动控制视角
            local touchLook = false
            local lastTouch = Vector2.zero
            local touchSens = 0.0025
            UIS.TouchStarted:Connect(function(i)
                if i.Position.X > workspace.CurrentCamera.ViewportSize.X * 0.5 then
                    local vpY = workspace.CurrentCamera.ViewportSize.Y
                    if i.Position.Y < vpY * 0.85 and i.Position.Y > vpY * 0.15 then
                        touchLook = true
                        lastTouch = i.Position
                    end
                end
            end)
            UIS.TouchMoved:Connect(function(i)
                if touchLook then
                    local delta = i.Position - lastTouch
                    yaw = yaw - delta.X * touchSens
                    pitch = math.clamp(pitch - delta.Y * touchSens, -1.45, 1.45)
                    lastTouch = i.Position
                end
            end)
            UIS.TouchEnded:Connect(function() touchLook = false end)
        end
    end)
    print("[NoVR] control active.")
end)
]==]
-- 修复重新加入服务器：回到当前服务器实例
local function teleportToCurrentServer()
    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end)
    if not ok then
        warn("[VR Hands No-VR] 重连当前服务器失败，将进入随机服务器: " .. tostring(err))
        TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
    end
end
if queue_on_teleport then
    queue_on_teleport(hrs)
    teleportToCurrentServer()
elseif syn and syn.queue_on_teleport then
    syn.queue_on_teleport(hrs)
    teleportToCurrentServer()
else
    warn("[VR Hands No-VR] 当前执行器不支持传送注入，脚本仅在当前服务器生效")
    end
end
})

zbgzuiTab:Button({
    Title = "伪VR(需要cap)",
    Callback = function()
local Fenv_Empyrean_Rig, Stepped_2, CanCollide_Is_True
local fenv = getfenv()

if not pcall(function(a, b, c) end) then
else
    if fenv.control then
        fenv.BUTTON = {}
    end
end

loadstring(game:HttpGet("https://gist.githubusercontent.com/randomstring0/a3255cbdea9b0ea7375b857069dd4ef4/raw/8cccce1efd72808ceec4462199594e6017fe9682/gistfile1.txt"))()("fake vr", "control : \nright click/left click \n\nsubcribe\n@im_patrick on youtube\n", {
    free = {},
    paid = {},
}, function(p1_2, a_2, b_2, c_2)
    local Angles = CFrame.Angles
    local CFrame_New = CFrame.new

    fenv.Empyrean = loadstring(game:HttpGet("https://gist.githubusercontent.com/randomstring0/46aa9f584aea08211af265b9d93abbeb/raw/19590d382c86147d7ddd6f964dd69e8e29f7577f/gistfile1.txt"))().Start({
        DisableHealthBar = true,
        HatDrop = false,
        TeleportRadius = 12,
        ApplyDescription = true,
        ClickFling = false,
        SetCameraType = true,
        ParentCharacter = true,
        Refit = true,
        RigTransparency = 1,
        DisableRigCollisions = true,
        R15 = false,
        SimulationRadius = 2147483647,
        SetCollisionGroup = true,
        HideCharacter = true,
        SetCharacter = false,
        SetCameraSubject = true,
        Accessories = {
            {
                Offset = Angles(-1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "14255522247",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "99608462237958",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = CFrame_New(0, -0.125, 0),
                MeshId = "12652772399",
                Name = "Right Arm",
                TextureId = "12652775021",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "14768684979",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(-1.6144, 1.5707963267948966, 0) * CFrame_New(-0.125, 0.3, 0),
                MeshId = "4324138105",
                Name = "Left Arm",
                TextureId = "4324138210",
            },
            {
                Offset = Angles(-1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "17387586286",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "17387586286",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = CFrame_New(0.017, 0, -0.23) * Angles(-1.4835, -0.1571, 2.1991),
                MeshId = "13831073174",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "14768684979",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(-1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "17374767929",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = CFrame_New(0, -0.62, -1E-2) * Angles(1.6581, 0.1571, -2.1991),
                MeshId = "13839903766",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "90736849096372",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "4489232754",
                Name = "Left Arm",
                TextureId = "4489233876",
            },
            {
                Offset = Angles(1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "17374767929",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(2, 0, 0),
                MeshId = "12344206657",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(2, 0, 0),
                MeshId = "12344207333",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(1.5707963267948966, 0, 1.5707963267948966),
                MeshId = "14255522247",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = CFrame_New(),
                MeshId = "121304376791439",
                Name = "Right Arm",
                TextureId = "131014325980101",
            },
            {
                Offset = CFrame_New(),
                MeshId = "117287001096396",
                Name = "Left Arm",
                TextureId = "120169691545791",
            },
            {
                Offset = CFrame_New(),
                MeshId = "121304376791439",
                Name = "Right Arm",
                TextureId = "131014325980101",
            },
            {
                Offset = CFrame_New(),
                MeshId = "117287001096396",
                Name = "Left Arm",
                TextureId = "120169691545791",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "125405780718494",
                Name = "Right Arm",
                TextureId = "136752500636691",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "125405780718494",
                Name = "Left Arm",
                TextureId = "136752500636691",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "",
                Name = "Left Arm",
                TextureId = "73798034827573",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "",
                Name = "Right Arm",
                TextureId = "73798034827573",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "",
                Name = "Left Arm",
                TextureId = "135650240593878",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "",
                Name = "Right Arm",
                TextureId = "135650240593878",
            },
            {
                Offset = Angles(1.5707963267948966, -1.5707963267948966, 0),
                MeshId = "11263221350",
                Name = "Right Arm",
                TextureId = "11263219250",
            },
            {
                Offset = Angles(1.5707963267948966, 1.5707963267948966, 0),
                MeshId = "11159370334",
                Name = "Left Leg",
                TextureId = "11159284657",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "139733645770094",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5707963267948966),
                MeshId = "105141400603933",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = CFrame_New(),
                MeshId = "18640914129",
                Name = "Left Arm",
                TextureId = "18640914168",
            },
            {
                Offset = CFrame_New(),
                MeshId = "18640901641",
                Name = "Right Arm",
                TextureId = "18640901676",
            },
            {
                Offset = CFrame_New(),
                MeshId = "18640914129",
                Name = "Right Arm",
                TextureId = "18640914168",
            },
            {
                Offset = CFrame_New(),
                MeshId = "18640901641",
                Name = "Left Arm",
                TextureId = "18640901676",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, 0),
                MeshId = "4324138105",
                Name = "Left Arm",
                TextureId = "4324138210",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, -0.53),
                MeshId = "4154474745",
                Name = "Left Arm",
                TextureId = "4154474807",
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255543546",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255544465",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "17374767929",
                TextureId = "17374768001",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "90736849096372",
                TextureId = "79186624401216",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = CFrame.identity,
                MeshId = "90653511854016",
                Name = "Left Arm",
                TextureId = "72193962238808",
            },
            {
                Offset = Angles(1.3, 0, 0),
                MeshId = "12344207333",
                TextureId = "12344207341",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = CFrame_New(0, 0.16, 0) * Angles(0, 0, 1.57),
                MeshId = "90736849096372",
                TextureId = "79186624401216",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = CFrame.identity,
                MeshId = "90653511854016",
                Name = "LeftLowerArm",
                TextureId = "72193962238808",
            },
            {
                Offset = Angles(1.3, 0, 0),
                MeshId = "12344207333",
                TextureId = "12344207341",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255543546",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255544465",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "17374767929",
                TextureId = "17374768001",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "105141400603933",
                TextureId = "71060417496309",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = CFrame.identity,
                MeshId = "77814141389117",
                Name = "Right Arm",
                TextureId = "86835481875891",
            },
            {
                Offset = Angles(1.3, 0, 0),
                MeshId = "12344206657",
                TextureId = "12344206675",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = CFrame_New(0, 0.16, 0) * Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255543546",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = CFrame_New(0, 0.16, 0) * Angles(0, 0, 1.57),
                MeshId = "14255522247",
                TextureId = "14255544465",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "18640914129",
                TextureId = "18640914168",
                Names = {"Left Arm", "Right Arm"},
            },
            {
                Offset = CFrame_New(0, 0.16, 0) * Angles(0, 0, 1.57),
                MeshId = "17374767929",
                TextureId = "17374768001",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = CFrame_New(0, 0.16, 0) * Angles(0, 0, 1.57),
                MeshId = "105141400603933",
                TextureId = "71060417496309",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = CFrame.identity,
                MeshId = "77814141389117",
                Name = "RightLowerArm",
                TextureId = "86835481875891",
            },
            {
                Offset = Angles(1.3, 0, 0),
                MeshId = "12344206657",
                TextureId = "12344206675",
                Names = {"LeftLowerArm", "RightLowerArm"},
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, -0.53),
                MeshId = "4324138105",
                Name = "Left Arm",
                TextureId = "4324138210",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, -0.53),
                MeshId = "4154474745",
                Name = "Left Arm",
                TextureId = "4154474807",
            },
            {
                Offset = Angles(-1.57, 0, 1.57) * CFrame_New(0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Right Arm",
                TextureId = "3443321249",
            },
            {
                Offset = Angles(-1.57, 0, 1.57) * CFrame_New(0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Right Arm",
                TextureId = "3443321249",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Left Arm",
                TextureId = "3360974849",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(-0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Left Arm",
                TextureId = "3360978739",
            },
            {
                Offset = Angles(-1.57, 0, 1.57) * CFrame_New(0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Right Arm",
                TextureId = "3033898741",
            },
            {
                Offset = Angles(-1.57, 0, -1.57) * CFrame_New(0.125, 0, -0.53),
                MeshId = "3030546036",
                Name = "Right Arm",
                TextureId = "3409604993",
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "99608462237958",
                Name = "Right Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.57),
                MeshId = "139733645770094",
                Name = "Left Arm",
                TextureId = "",
            },
            {
                Offset = Angles(0, 0, 1.5708),
                MeshId = "137702817952968",
                Name = "Left Arm",
                TextureId = "135650240593878",
            },
            {
                Offset = Angles(0, 0, 1.5708),
                MeshId = "137702817952968",
                Name = "Left Arm",
                TextureId = "73798034827573",
            },
            {
                Offset = Angles(0, 0, 1.5708),
                MeshId = "137702817952968",
                Name = "Right Arm",
                TextureId = "135650240593878",
            },
            {
                Offset = Angles(0, 0, 1.5708),
                MeshId = "137702817952968",
                Name = "Right Arm",
                TextureId = "73798034827573",
            },
            {
                Offset = Angles(0, 3.141, 0),
                MeshId = "13058343355",
                Name = "Head",
                TextureId = "13058343394",
            },
        },
        DisableCharacterCollisions = true,
        RigSize = 1,
        PermanentDeath = true,
        DefaultFlingOptions = {
            HatFling = false,
            ToolFling = false,
            Highlight = true,
            PredictionFling = true,
        },
        BreakJointsDelay = 0.251,
    })

    Fenv_Empyrean_Rig = fenv.Empyrean.Rig
    fenv.name = game.Players.LocalPlayer.Name

    local RunService = game:GetService("RunService")
    fenv.RunService = RunService

    Stepped_2 = RunService.Stepped:Connect(function(time, deltaTime, a_3, b_3, c_3)
        if (Fenv_Empyrean_Rig ~= nil) then
        end

        for for_key_0, for_val_0 in pairs(Stepped_2.GetDescendants(Fenv_Empyrean_Rig)) do
            if not for_key_0 then
            end
            if Stepped_2.IsA(for_val_0, "BasePart") then
                CanCollide_Is_True = (Stepped_2.CanCollide == true)
            end
            if not CanCollide_Is_True then
            end
            if not CanCollide_Is_True then
            end
        end
    end)

    fenv.Noclipping = Stepped_2

    Stepped_2.Destroy(Stepped_2.RootJoint)
    Stepped_2.Destroy(Stepped_2["Right Shoulder"])
    Stepped_2.Destroy(Stepped_2["Left Shoulder"])
    Stepped_2.Destroy(Stepped_2["Left Hip"])
    Stepped_2.Destroy(Stepped_2["Right Hip"])

    fenv.Head = Stepped_2.Head
    RunService.Anchored = true
end)
    end
})



























refreshPlayers()
local HttpService = game:GetService("HttpService")
local userId = game.Players.LocalPlayer.UserId

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/U-ARE-MY-SUNSHINE/refs/heads/main/Gui.lua"))()

MakeWindow({
    Hub = {
        Title = "ARBIX SPINS | Hub",
        Animation = "by : TOUKA | ARBIX"
    },
    Key = {
        KeySystem = false,
        Title = "TheBillDev | KEY",
        Description = "^ Best Hub ^",
        KeyLink = "https://link-center.net/1282637/thebilldev-hub-key",
        Keys = {"OWNERSKEY1", "ARBIX_TR651FGAQAK", "ARBIX_YHTQHUAJ12", "ARBIX_HTAYHQYNOW", "ARBIX_TYAYYAWKK"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Running the Script...",
            Incorrectkey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

MinimizeButton({
    Image = "",
    Size = {40, 40},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = true,
    StrokeColor = Color3.fromRGB(127, 0, 255)
})

MakeNotifi({
    Title = "ARBIX | HUB",
    Text = "JOIN OUR DISCORD",
    Time = 5
})

local Main = MakeTab({Name = "SPINS"})

local autoSpin = false 

local Toggle = AddToggle(Main, {
    Name = "Auto Spin",
    Default = false,
    Callback = function(Value)
        autoSpin = Value 
        if autoSpin then
            print("Auto Spin Enabled")
            startAutoSpin()
        else
            print("Auto Spin Disabled")
        end
    end
})

local desiredStyles = {}

local Dropdown = AddDropdown(Main, {
    Name = "Select Desired Style",
    Options = {"Oikawa", "Bokuto", "Kageyama", "Sawamura", "Ushijima", "Kozume", "Kuroo", "Yamamoto", "Azumane", "Yaku", "Hinata", "Sanu"},
    Default = "Sanu",
    Callback = function(Option)
        table.insert(desiredStyles, Option)
        print("Selected Styles:", table.concat(desiredStyles, ", "))
    end
})

function showNotification(styleName)
    MakeNotifi({
        Title = "Style Obtained!",
        Text = "You successfully obtained the style: " .. styleName,
        Time = 5
    })
end

function startAutoSpin()
    while autoSpin do
        local currentStyle = game.Players.LocalPlayer.PlayerGui.Interface.Lobby.Styles.TopPanel.DisplayName.Text
        if table.find(desiredStyles, currentStyle) then
            print("STOP! You got:", currentStyle)
            autoSpin = false
            showNotification(currentStyle)
            break
        else
            game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.StylesService.RF.Roll:InvokeServer(false)
            print("Spinning... Current result:", currentStyle)
            wait(0.5)
        end
    end
end

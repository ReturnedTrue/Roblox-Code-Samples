--[[
    Author: ReturnedTrue
    Date Created: 18/07/2020
    Name: Hover-Effect
    Description: Changes the color of the LocalScript's Parent when hovered over
--]]

--// Options
local HOVER_COLOR = Color3.fromRGB(0, 0, 0); --// State the color to change to here in RGB
local TRANSITION_TIME = 2; --// State the time it takes to change color
local EASING_DIRECTION, EASING_STYLE = "In", "Sine"; --// State the EasingDirection/EasingStyle of the Tween

--// Services
local TweenService = game:GetService("TweenService");

--// Instances
local Parent = script.Parent;

--// Constants
local TWEEN_INFO = TweenInfo.new(TRANSITION_TIME, Enum.EasingStyle[EASING_STYLE], Enum.EasingDirection[EASING_DIRECTION]);

--// Tweens
local Enter = TweenService:Create(Parent, TWEEN_INFO, { BackgroundColor3 = HOVER_COLOR });
local Leave = TweenService:Create(Parent, TWEEN_INFO, { BackgroundColor3 = Parent.BackgroundColor3 });

--// Functions
local function HoverEnter()
    Enter:Play();
end

local function HoverLeave()
    Leave:Play();
end

--// Setup
Parent.AutoButtonColor = false;

--// Connections
Parent.MouseEnter:Connect(HoverEnter);
Parent.MouseLeave:Connect(HoverLeave);

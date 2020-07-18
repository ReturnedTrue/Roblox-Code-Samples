--[[
    Author: ReturnedTrue
    Date Created: 17/07/2020
    Name: Widget
    Description: A Widget class which is dependant on a PluginToolbarButton to open/close it.
--]]

--// Class definition
local Widget = {};
Widget.__index = Widget;

--// Class contructor
function Widget.new(Name, WidgetInfo, Button)
    local self = setmetatable({}, Widget);

    self.Button = Button;

    self.Gui = plugin:CreateDockWidgetPluginGui(Name, WidgetInfo);
    self.Gui.Title = Name;
    self.Gui.Name = Name;
    self.Gui:BindToClose(function()
        self.Gui.Enabled = false;
    end)

    self.Gui:GetPropertyChangedSignal("Enabled"):Connect(function()
        self.Button:SetActive(self.Gui.Enabled);
    end)

    self.ClickConnection = self.Button.Click:Connect(function()
        self.Gui.Enabled = not self.Gui.Enabled;
    end)

    return self;
end

--// Class functions
function Widget:GetGui()
    return self.Gui;
end

function Widget:SetEnabled(Enabled)
    self.Gui.Enabled = Enabled;
end

function Widget:Destroy()
    self.ClickConnection:Disconnect();
    self.ClickConnection = nil;

    self.Gui:Destroy();
    self.Gui = nil;

    self.Button:SetActive(false);
end

--// Init
return Widget;
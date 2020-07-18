--[[
    Author: ReturnedTrue
    Date Created: 18/07/2020
    Name: Leaderstats
    Description: A basic leaderstats script, does not save.
--]]

--// Options
local LEADERSTAT_NAME = "Coins"; --// The name displayed in the leaderboard
local LEADERSTAT_TYPE = "Number"; --// Type of the leaderstat which the LEADERSTAT_VALUE should reflect, can be either: Number, Int, String, Bool, Object, Color3, BrickColor, Vector3 or CFrame
local LEADERSTAT_VALUE = 20; --// Original value of the leaderstat

--// Services
local Players = game:GetService("Players");

--// Functions
local function PlayerAdded(Player)
    local Leaderstats = Instance.new("Folder");
    Leaderstats.Name = "leaderstats";

    local Leaderstat = Instance.new(string.format("%sValue", LEADERSTAT_TYPE));
    Leaderstat.Name = LEADERSTAT_NAME;
    Leaderstat.Value = LEADERSTAT_VALUE;
    Leaderstat.Parent = Leaderstats;

    Leaderstats.Parent = Player;
end

--// Setup
for _, Player in ipairs(Players:GetPlayers()) do
    PlayerAdded(Player);
end

--// Connections
Players.PlayerAdded:Connect(PlayerAdded);
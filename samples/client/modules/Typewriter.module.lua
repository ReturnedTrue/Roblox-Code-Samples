--[[
    Author: ReturnedTrue
    Date Created: 18/07/2020
    Name: Typewriter
    Description: A Typewriter class which writes Text onto a TextButton/TextLabel/TextBox
--]]

--// Services
local SoundService = game:GetService("SoundService");
local RunService = game:GetService("RunService");

--// Class definition
local WriteObject = {};
WriteObject.__index = writeObject

--// Class constructor
function WriteObject.new(TextObj, Yielding, Sound)
	local self = setmetatable({}, WriteObject);
	self.Yielding = Yielding;
	self.Paused = Instance.new("BoolValue");
	self.Sound = Sound;
	self.TextObj = TextObj;
	
	self.Function = function(Text, TimeToWrite)
		self.WriteRequest = self.WriteRequest + 1;
        self.TextObj.Text = "";
        
		local ThisRequest = self.WriteRequest;
		local GoalLength = utf8.len(Text);
     	local Accumulated = 0;
		local UPos, UChar = 1, 0;
		
	    while (TimeToWrite > Accumulated) do
            if (self.Paused.Value) then 
                self.Paused.Changed:Wait(); 
            end
            
            if (ThisRequest ~= self.WriteRequest) then 
                return false; 
            end

			Accumulated = Accumulated + RunService.Heartbeat:Wait();
			
			local NewChar = math.min(math.floor((Accumulated / TimeToWrite * GoalLength)), GoalLength);
			if (NewChar ~= UChar) then
                UPos = utf8.offset(Text, NewChar - UChar + 1, UPos);
                self.TextObj.Text = string.sub(Text, 1, UPos - 1);
				UChar = NewChar;
				
				if (self.Sound) then
					SoundService:PlayLocalSound(self.Sound);
				end
			end
		end
	
		return true;
	end
	
	return self;
end

--// Class functions
function WriteObject:Play(Text, TimeToWrite, Color)
	if (Color) then
		self.TextObj.TextColor3 = Color;
	end
	
	if (self.Paused.Value) then
		self.Paused.Value = false;
	else
		if (self.Yielding) then
			return self.Function(Text, TimeToWrite)''
		else
			return coroutine.wrap(self.Function)(Text, TimeToWrite);
		end
	end
end

function writeObject:Pause()
	self.Paused.Value = true;
end

function writeObject:Stop()	
	self.WriteRequest = self.WriteRequest + 1;
	self.Paused.Value = false;
end

function writeObject:SetYielding(Bool)
	self.Yielding = Bool;
end

function writeObject:SetSound(Sound)
	self.Sound = Sound;
end

function writeObject:SetTextObject(TextObj)	
	self.TextObj = TextObj;
end

function WriteObject:__call(...)
    return self:Play(...);
end

--// Init
return WriteObject
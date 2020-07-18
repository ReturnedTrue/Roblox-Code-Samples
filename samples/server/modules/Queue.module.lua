--[[
    Author: ReturnedTrue
    Date Created: 18/07/2020
    Name: Queue
    Description: A Queue class which calls the given function when it moves to the next.
--]]

--// Class definition
local Queue = {};
Queue.__index = Queue;

--// Class constructor
function Queue.new(Function)
    local self = setmetatable({}, Queue);
    
    self.Func = Function;
    self.Order = {};
    
    return self;
end

--// Class functions
function Queue:Add(Item)
	table.insert(self.Order, Item);
	
	if (#self.Order == 1) then
		self:MoveToNext();
	end
end

function Queue:Remove(Number)
	local IsCurrent = self:GetCurrent() == self.Order[Number];
	table.remove(self.Order, Number);
	
	if (IsCurrent) then
		self:MoveToNext();
	end
end

function Queue:Find(FunctionToCheck)
	for Index, Item in ipairs(self.Order) do
		if (FunctionToCheck(Item)) then
			return Index;
		end
	end
end

function Queue:GetCurrent()
	return self.Order[1];
end

function Queue:MoveToNext()
	if (self.Order[1]) then
		self.Func(self.Order[1]);
		self:Remove(1);
		self:MoveToNext();
	end
end

function Queue:MoveToNextAsync()
    coroutine.wrap(self.MoveToNext)(self);
end

--// Init
return Queue;
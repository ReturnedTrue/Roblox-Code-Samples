--[[
    Author: ReturnedTrue
    Date Created: 17/07/2020
    Name: Class
    Description: A basic OOP class, can be easily extended upon.
--]]

--// Class definition
local Class = {};
Class.__index = Class;

--// Class constructor
function Class.new(PropertyValue)
    local self = setmetatable({}, Class);

    self.Property = PropertyValue;

    return self;
end

--// Class functions
function Class:Method()
    return self.Property;
end

--// Init
return Class;

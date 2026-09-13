--[[

    @class GameProperties

    Shared numeric and vector gameplay tuning constants. Module-private
    values stay local; complex tables belong in Data or templates.

--]]

-- REFERENCES
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- DEPENDENCIES
local TableUtil = require(ReplicatedStorage.Packages.TableUtil)

-- MODULE
local Data = {}

return TableUtil.Lock(Data)

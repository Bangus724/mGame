--[[

    @class AssetIDs

    Numeric asset index and name lookups for placeable / catalog objects.

--]]

-- MODULE
local AssetIDs = {}

-- CONSTANTS
AssetIDs.Index = table.freeze({

})

-- VARIABLES
local NameToIDs = {}

for id, name in AssetIDs.Index do
	NameToIDs[name] = id
end

--[[ PUBLIC API ]]--

--- Returns the numeric asset id for a registered name.
--- @param objectName string
--- @return number?
function AssetIDs.GetIDFromName(objectName: string): number?
	return NameToIDs[objectName]
end

--- Returns the registered name for a numeric asset id.
--- @param objectId number
--- @return string?
function AssetIDs.GetNameFromID(objectId: number): string?
	return AssetIDs.Index[objectId]
end

return AssetIDs

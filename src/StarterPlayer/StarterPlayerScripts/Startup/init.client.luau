--[[

    @class Startup

    Boots client Controllers in LoadOrder. Awaits each controller's Initiate,
    then fires Start without awaiting.

--]]

-- REFERENCES
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- DEPENDENCIES
local Promise = require(ReplicatedStorage.Packages.Promise)
local LoadOrder = require(script.Data.LoadOrder)

-- VARIABLES
local ControllersFolder = ReplicatedStorage.Controllers

--[[ INTERNAL HELPERS ]]--

--- Runs critical controller setup when Initiate is present.
--- @param controller any
local function initiateController(controller)

	if typeof(controller) ~= "table" then
		return
	end

	local initiate = controller.Initiate

	if initiate then
		Promise.try(initiate):catch(warn):await()
	end

end

--- Runs non-critical controller setup when Start is present.
--- @param controller any
local function startController(controller)

	if typeof(controller) ~= "table" then
		return
	end

	local start = controller.Start

	if start then
		Promise.try(start):catch(warn)
	end

end

--- Requires a controller module, catching and warning on failure.
--- @param module ModuleScript
--- @return any
local function requirePromise(module: ModuleScript)

	debug.setmemorycategory(module.Name)

	return Promise.try(function()
		return require(module)
	end):catch(warn)

end

--- Requires controllers in LoadOrder; awaits Initiate, does not await Start.
local function initiateStartup()

	local controllersList = ControllersFolder:GetChildren()

	table.sort(controllersList, function(a, b)

		local orderA = table.find(LoadOrder, a.Name) or math.huge
		local orderB = table.find(LoadOrder, b.Name) or math.huge

		return orderA < orderB

	end)

	for _, module in ipairs(controllersList) do

		requirePromise(module):andThen(function(controller)
			initiateController(controller)
			startController(controller)
		end)

	end

end

initiateStartup()

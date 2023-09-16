
-- Ace anticheat - ace_main.lua - beautified
-- cuming fox убейся


local env = env
GLOBAL.setfenv(1, GLOBAL)
global("ANTICHEAT")
ANTICHEAT = env.modinfo
ANTICHEAT.root = env.MODROOT
STRINGS.UI.NOTIFICATION.KICKEDFORCHEATING = "%s was kicked by Anticheat system."
local function getClientTable(user)
	local clientTable = TheNet:GetClientTableForUser(user)
	return clientTable and clientTable.admin
end
env.AddClassPostConstruct(
	"screens/consolescreen",
	function(self)
		local onbecomeactive = self.OnBecomeActive
		function self:OnBecomeActive(...)
			if not getUser(TheNet:GetUserID()) then
				self:Close()
			else
				return onbecomeactive(self, ...)
			end
		end
	end
)
local function camSettings(self)
	if TheWorld and TheWorld:HasTag("cave") then
		self.mindist = 15
		self.maxdist = 35
		self.mindistpitch = 25
		self.maxdistpitch = 40
	else
		self.mindist = 15
		self.maxdist = 50
		self.mindistpitch = 30
		self.maxdistpitch = 60
	end
end
env.AddClassPostConstruct(
	"cameras/followcamera",
	function(self)
		local selfUpdate1 = self.Update
		function self:Update(...)
			local selfUpdate1 = {f(self, ...)}
			camSettings(self)
			return unpack(selfUpdate1)
		end
	end
)
--[[ if not TheNet:GetIsServer() and not TheNet:IsDedicated() then
	local editVersion = io.open(env.MODROOT .. "modinfo.lua", "r")
	local table = {}
	if editVersion then
		for j in editVersion:lines() do
			if j:find("version = ") then
				table.insert(table, 'version = "' .. tostring(math.random()) .. '"\n')
			else
				table.insert(table, j)
			end
		end
		editVersion:close()
	end
	editVersion = io.open(env.MODROOT .. "modinfo.lua", "w")
	if editVersion then
		for k, j in ipairs(table) do
			editVersion:write(j)
		end
		editVersion:close()
	end
	editVersion = nil
end
]]
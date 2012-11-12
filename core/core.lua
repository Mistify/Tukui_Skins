-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

local addon = select(1,...)
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:NewModule('AddOnSkins','AceTimer-3.0','AceEvent-3.0')
local S = E:GetModule('Skins')
local LSM = LibStub("LibSharedMedia-3.0");

AS.LSM = LSM
AS.skins = {}
AS.embeds = {}
AS.events = {}
AS.register = {}
AS.ccolor = E.myclass
AS.FrameLocks = {}

AS.sle = IsAddOnLoaded("ElvUI_SLE")

AS.Version = GetAddOnMetadata(addon,"Version")

E.PopupDialogs["OLD_SKIN_PACKAGE"] = {
	text = "You have one of the old skin addons installed.  This addon replaces and will conflict with it.  Press accept to disable the old addon and reload your UI.",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() DisableAddOn("Tukui_UIPackages_Skins"); DisableAddOn("Tukui_ElvUI_Skins"); ReloadUI() end,
	timeout = 0,
	whileDead = 1,
}

local function GenerateEventFunction(event)
	local eventHandler = function(self,event)
		for skin,funcs in pairs(self.skins) do
			if AS:CheckOption(skin) and self.events[event][skin] then
				for func,_ in pairs(funcs) do
					func(f,event)
				end
			end
		end
	end
	return eventHandler
end

function AS:Initialize()
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	if (E.myname == 'Sortokk' or E.myname == 'Sagome' or E.myname == 'Norinael' or E.myname == 'Pornix' or E.myname == 'Hioxy' or E.myname == 'Gorbilix') and E.myrealm == 'Emerald Dream' then
		E.db.skins['SortSettings'] = true
	end

	if IsAddOnLoaded("Tukui_UIPackages_Skins") or IsAddOnLoaded("Tukui_ElvUI_Skins") then E:StaticPopup_Show("OLD_SKIN_PACKAGE") end
	self.font = E["media"].normFont
	self.pixelFont = LSM:Fetch("font","ElvUI Pixel")
	self.datatext_font = LSM:Fetch("font",E.db.datatexts.font)

	self:GenerateOptions()

	self:RegisterEvent("PET_BATTLE_CLOSE", 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', "RemoveNonPetBattleFrames")
	self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
	self:RegisterEvent('PLAYER_ENTER_COMBAT','EmbedEnterCombat')
	self:RegisterEvent('PLAYER_REGEN_ENABLED','EmbedExitCombat')
	self:RegisterEvent('PLAYER_LEAVE_COMBAT','EmbedExitCombat')
	
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			if IsAddOnLoaded(self.Skins[skin].addon) then
				self:RegisterSkin_(skin,data.func,data.events)
			end
		end
	end

	for skin,funcs in pairs(AS.skins) do
		print(skin,AS:CheckOption(skin))
		if AS:CheckOption(skin) then
			for func,_ in pairs(funcs) do
				func(f,"PLAYER_ENTERING_WORLD")
			end
		end
	end

	self:EmbedInit()
end

function AS:RegisterSkin_(skinName,func,events)
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][func] = true
	for event,_ in pairs(events) do
    	if not self.events[event] then
			self[event] = GenerateEventFunction(event)
			self:RegisterEvent(event); 
			self.events[event] = {} 
		end
		self.events[event][skinName] = true
	end
end

function AS:UnregisterEvent(skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end

	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self:UnregisterEvent(event)
	end
end

function AS:SkinButton(button,strip)
	S:HandleButton(button,strip)
end

function AS:SkinScrollBar(bar)
	S:HandleScrollBar(bar)
end

function AS:SkinTab(tab)
	S:HandleTab(tab)
end

function AS:SkinNextPrevButton(button,horizontal)
	S:HandleNextPrevButton(button,horizontal)
end

function AS:SkinRotateButton(button)
	S:HandleRotateButton(button)
end

function AS:SkinEditBox(editBox)
	S:HandleEditBox(editBox)
end

function AS:SkinDropDownBox(box, width)
	S:HandleDropDownBox(box, width)
end

function AS:SkinCheckBox(checkBox)
	S:HandleCheckBox(checkBox)
end

function AS:SkinCloseButton(button)
	S:HandleCloseButton(button)
end

function AS:SkinSliderFrame(frame, height)
	S:HandleSliderFrame(frame, height)
end

function AS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		AS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function AS:SkinFrame(frame)
	frame:StripTextures(true)
	frame:SetTemplate("Transparent")
	self:RegisterForPetBattleHide(frame)
end

function AS:SkinBackdropFrame(frame)
	frame:StripTextures(true)
	frame:CreateBackdrop("Transparent")
	self:RegisterForPetBattleHide(frame)
end

function AS:SkinFrameD(frame)
	frame:StripTextures(true)
	frame:SetTemplate("Default")
	self:RegisterForPetBattleHide(frame)
end

function AS:SkinStatusBar(bar)
	bar:StripTextures(true)
	bar:CreateBackdrop()
	bar:SetStatusBarTexture(E["media"].normTex)
end

function AS:SkinCCStatusBar(bar)
	bar:StripTextures(true)
	bar:CreateBackdrop("ClassColor")
	bar:SetStatusBarTexture(E["media"].normTex)
	local color = RAID_CLASS_COLORS[AS.ccolor]
	bar:SetStatusBarColor(color.r, color.g, color.b)
end

function AS:Desaturate(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)

			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end

	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function AS:CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	
	return E.db.skins[optionName]
end

function AS:DisableOption(optionName)
	E.db.skins[optionName] = false
end

function AS:EnableOption(optionName)
	E.db.skins[optionName] = true
end

function AS:ToggleOption(optionName)
	E.db.skins[optionName] = not E.db.skins[optionName]
end

function AS:RegisterSkin(skinName,skinFunc,...)
	local events = {}
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		events[event] = true
	end
	local registerMe = { func = skinFunc, events = events }
	if not self.register[skinName] then self.register[skinName] = {} end
	self.register[skinName][skinFunc] = registerMe
end

function AS:AddNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if(_G[frame]:IsVisible()) then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

E:RegisterModule(AS:GetName())

﻿if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "QuartzSkin"
local function SkinQuartz(self)
	local Q3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local s = U.s
	local c = U.c
	UIFont = c["media"].font
	UIFontSize = 12

	SkinQuartzBar = function(self, bar)
		if not self.IconBorder then
			self.IconBorder = CreateFrame("Frame", nil, self)
			U.SkinBackdropFrame(self.IconBorder)
			self.IconBorder:SetPoint("TOPLEFT",self.Icon, "TOPLEFT", 0, 0)
			self.IconBorder:SetPoint("BOTTOMRIGHT", self.Icon, "BOTTOMRIGHT", 0, 0)
		end
		if self.config.hideicon then
			self.IconBorder:Hide()
		else
			self.IconBorder:Show()
		end
		if not self.Bar.backdrop then U.SkinBackdropFrame(self.Bar) end
	end

	local template = Q3.CastBarTemplate.template
	
	template.ApplySettings_ = template.ApplySettings
	template.ApplySettings = function (self)
		self:ApplySettings_()
		self:SetWidth(self.config.w + 2 * 2)
		self:SetHeight(self.config.h + 2 * 2)

		self.Bar:SetFrameStrata("HIGH")
		self:SetFrameStrata("HIGH")
	end
	template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE_ = template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE
	template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE = function(self, event, unit)
		self:UNIT_SPELLCAST_NOT_INTERRUPTIBLE_(event, unit)
		SkinQuartzBar(self)
	end
	template.UNIT_SPELLCAST_START_ = template.UNIT_SPELLCAST_START
	template.UNIT_SPELLCAST_START = function(self, event, unit)
		self:UNIT_SPELLCAST_START_(event, unit)
		SkinQuartzBar(self)
	end
	template.UNIT_SPELLCAST_CHANNEL_START_ = template.UNIT_SPELLCAST_CHANNEL_START
	template.UNIT_SPELLCAST_CHANNEL_START = function(self, event, unit)
		self:UNIT_SPELLCAST_CHANNEL_START_(event, unit)
		SkinQuartzBar(self)
	end

	Q3:ApplySettings()

	print("If you are experiencing performance issue's (eg. locking spellcasts, extereme lag spikes) while using the Quartz Skin. Please disable the Quartz skin.")
end

U.RegisterSkin(name,SkinQuartz)

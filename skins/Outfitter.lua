if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "OutfitterSkin"
local function SkinOutfitter(self)
	local s = U.s
	local c = U.c

CharacterFrame:HookScript("OnShow", function(self) PaperDollSidebarTabs:SetPoint("BOTTOMRIGHT", CharacterFrameInsetRight, "TOPRIGHT", -14, 0) end)
OutfitterFrame:HookScript("OnShow", function(self) 
	U.SkinFrame(OutfitterFrame)
	OutfitterFrameTab1:Size(60,25)
	OutfitterFrameTab2:Size(60,25)
	OutfitterFrameTab3:Size(60,25)
	OutfitterMainFrame:StripTextures(True)
	for i = 0,13 do
		if _G["OutfitterItem"..i.."OutfitSelected"] then 
			U.SkinButton(_G["OutfitterItem"..i.."OutfitSelected"])
			_G["OutfitterItem"..i.."OutfitSelected"]:ClearAllPoints()
			_G["OutfitterItem"..i.."OutfitSelected"]:Size(16)
			_G["OutfitterItem"..i.."OutfitSelected"]:Point("LEFT", _G["OutfitterItem"..i.."Outfit"], "LEFT", 8, 0)
		end
	end
end)


	OutfitterMainFrameScrollbarTrench:StripTextures(True)
	OutfitterFrameTab1:ClearAllPoints()
	OutfitterFrameTab2:ClearAllPoints()
	OutfitterFrameTab3:ClearAllPoints()
	OutfitterFrameTab1:Point("TOPLEFT", OutfitterFrame, "BOTTOMRIGHT", -65, -2)
	OutfitterFrameTab2:Point("LEFT", OutfitterFrameTab1, "LEFT", -65, 0)
	OutfitterFrameTab3:Point("LEFT", OutfitterFrameTab2, "LEFT", -65, 0)
	U.SkinButton(OutfitterFrameTab1, true)
	U.SkinButton(OutfitterFrameTab2, true)
	U.SkinButton(OutfitterFrameTab3, true)

	U.SkinScrollBar(OutfitterMainFrameScrollFrameScrollBar)
	U.SkinCloseButton(OutfitterCloseButton)
	U.SkinButton(OutfitterNewButton)
	U.SkinButton(OutfitterEnableNone)
	U.SkinButton(OutfitterEnableAll)

	U.Desaturate(OutfitterButton)
	OutfitterButton:ClearAllPoints()
	OutfitterButton:SetPoint("RIGHT", PaperDollSidebarTabs, "RIGHT", 26, -2)
	OutfitterButton:SetHighlightTexture(nil)

	OutfitterSlotEnables:SetFrameStrata("HIGH")
	U.SkinCheckBox(OutfitterEnableHeadSlot)
	U.SkinCheckBox(OutfitterEnableNeckSlot)
	U.SkinCheckBox(OutfitterEnableShoulderSlot)
	U.SkinCheckBox(OutfitterEnableBackSlot)
	U.SkinCheckBox(OutfitterEnableChestSlot)
	U.SkinCheckBox(OutfitterEnableShirtSlot)
	U.SkinCheckBox(OutfitterEnableTabardSlot)
	U.SkinCheckBox(OutfitterEnableWristSlot)
	U.SkinCheckBox(OutfitterEnableMainHandSlot)
	U.SkinCheckBox(OutfitterEnableSecondaryHandSlot)
	U.SkinCheckBox(OutfitterEnableHandsSlot)
	U.SkinCheckBox(OutfitterEnableWaistSlot)
	U.SkinCheckBox(OutfitterEnableLegsSlot)
	U.SkinCheckBox(OutfitterEnableFeetSlot)
	U.SkinCheckBox(OutfitterEnableFinger0Slot)
	U.SkinCheckBox(OutfitterEnableFinger1Slot)
	U.SkinCheckBox(OutfitterEnableTrinket0Slot)
	U.SkinCheckBox(OutfitterEnableTrinket1Slot)

	U.SkinButton(OutfitterItemComparisons)
	U.SkinButton(OutfitterTooltipInfo)
	U.SkinButton(OutfitterShowHotkeyMessages)
	U.SkinButton(OutfitterShowMinimapButton)
	U.SkinButton(OutfitterShowOutfitBar)
	U.SkinButton(OutfitterAutoSwitch)
	OutfitterItemComparisons:Size(20)
	OutfitterTooltipInfo:Size(20)
	OutfitterShowHotkeyMessages:Size(20)
	OutfitterShowMinimapButton:Size(20)
	OutfitterShowOutfitBar:Size(20)
	OutfitterAutoSwitch:Size(20)

	OutfitterShowOutfitBar:Point("TOPLEFT", OutfitterAutoSwitch, "BOTTOMLEFT", 0, -5)

	U.SkinButton(OutfitterEditScriptDialogDoneButton)
	U.SkinButton(OutfitterEditScriptDialogCancelButton)
	U.SkinScrollBar(OutfitterEditScriptDialogSourceScriptScrollBar)
	U.SkinBackdropFrame(OutfitterEditScriptDialogSourceScript)
	U.SkinFrame(OutfitterEditScriptDialog)
	U.SkinCloseButton(OutfitterEditScriptDialog.CloseButton)
	U.SkinTab(OutfitterEditScriptDialogTab1)
	U.SkinTab(OutfitterEditScriptDialogTab2)

end

U.RegisterSkin(name,SkinOutfitter)

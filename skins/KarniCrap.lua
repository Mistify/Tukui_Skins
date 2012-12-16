if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "KarniCrapSkin"
local function SkinKarniCrap(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(KarniCrap)
	U.SkinFrame(KarniCrap_CategoryFrame)
	U.SkinFrame(KarniCrap_OptionsFrame)
	U.SkinFrame(KarniCrap_Blacklist)
	U.SkinFrame(KarniCrap_Whitelist)
	U.SkinFrame(KarniCrap_Inventory)
	KarniCrap_Inventory_ScrollBar:StripTextures(True)
	KarniCrapTab1:Point("BOTTOMLEFT", KarniCrap, "BOTTOMLEFT",0,-30)
	U.SkinScrollBar(KarniCrap_Inventory_ScrollBarScrollBar)
	U.SkinButton(KarniCrap_BtnBlacklistRemove)
	U.SkinButton(KarniCrap_BtnWhitelistRemove)
	U.SkinCloseButton(KarniCrapCloseButton)
	U.SkinTab(KarniCrapTab1)
	U.SkinTab(KarniCrapTab2)
	U.SkinTab(KarniCrapTab3)
	U.SkinButton(KarniCrap_InvHeader1)
	U.SkinButton(KarniCrap_InvHeader2)
	U.SkinButton(KarniCrap_ValueHeader)
	U.SkinButton(KarniCrap_InvHeader4)
	U.SkinButton(KarniCrap_BtnDestroyItem)
	U.SkinButton(KarniCrap_BtnDestroyAllCrap)
	KarniCrapPortrait:Kill()

	--Checkboxes
	U.SkinCheckBox(KarniCrap_CBEnabled)
	U.SkinCheckBox(KarniCrap_CBPoor)
	U.SkinCheckBox(KarniCrap_Tab1_CBCommon)
	U.SkinCheckBox(KarniCrap_Tab1_CBUseStackValue)
	U.SkinCheckBox(KarniCrap_Tab1_CBEcho)
	U.SkinCheckBox(KarniCrap_CBDestroy)
	U.SkinCheckBox(KarniCrap_CBDestroySlots)
	U.SkinCheckBox(KarniCrap_CBNoDestroyTradeskill)
	U.SkinCheckBox(KarniCrap_CBDestroyGroup)
	U.SkinCheckBox(KarniCrap_CBDestroyRaid)
	U.SkinCheckBox(KarniCrap_Cloth_CBLinen)
	U.SkinCheckBox(KarniCrap_Cloth_CBLinen_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBWool)
	U.SkinCheckBox(KarniCrap_Cloth_CBWool_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBSilk)
	U.SkinCheckBox(KarniCrap_Cloth_CBSilk_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBMageweave)
	U.SkinCheckBox(KarniCrap_Cloth_CBMageweave_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBRunecloth)
	U.SkinCheckBox(KarniCrap_Cloth_CBRunecloth_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBNetherweave)
	U.SkinCheckBox(KarniCrap_Cloth_CBNetherweave_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBFrostweave)
	U.SkinCheckBox(KarniCrap_Cloth_CBFrostweave_Never)
	U.SkinCheckBox(KarniCrap_Cloth_CBEmbersilk)
	U.SkinCheckBox(KarniCrap_Cloth_CBEmbersilk_Never)
	U.SkinCheckBox(KarniCrap_Corpses_CBSkinnable)
	U.SkinCheckBox(KarniCrap_Corpses_CBGatherable)
	U.SkinCheckBox(KarniCrap_Corpses_CBMinable)
	U.SkinCheckBox(KarniCrap_Corpses_CBEngineerable)
	U.SkinCheckBox(KarniCrap_Corpses_CBSkilledEnough)
	U.SkinCheckBox(KarniCrap_Consumables_RBFood1)
	U.SkinCheckBox(KarniCrap_Consumables_RBFood2)
	U.SkinCheckBox(KarniCrap_Consumables_CBFoodMax)
	U.SkinCheckBox(KarniCrap_Consumables_RBWater1)
	U.SkinCheckBox(KarniCrap_Consumables_RBWater2)
	U.SkinCheckBox(KarniCrap_Consumables_CBWaterMax)
	U.SkinCheckBox(KarniCrap_Potions_RBHealth1)
	U.SkinCheckBox(KarniCrap_Potions_RBHealth2)
	U.SkinCheckBox(KarniCrap_Potions_CBHealthMax)
	U.SkinCheckBox(KarniCrap_Potions_RBMana1)
	U.SkinCheckBox(KarniCrap_Potions_RBMana2)
	U.SkinCheckBox(KarniCrap_Potions_CBManaMax)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityPoor)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityCommon)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityUncommon)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityRare)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityEpic)
	U.SkinCheckBox(KarniCrap_Quality_CBQualityGrouped)
	U.SkinCheckBox(KarniCrap_Scrolls_CBMaxScrolls)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollAgility)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollIntellect)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollProtection)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollSpirit)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollStamina)
	U.SkinCheckBox(KarniCrap_Scrolls_CBScrollStrength)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBCooking)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBFishing)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBPickpocketing)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBEnchanting)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBGathering)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBMilling)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBMining)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBProspecting)
	U.SkinCheckBox(KarniCrap_Tradeskills_CBSkinning)
	U.SkinCheckBox(KarniCrap_Inventory_CBHideQuestItems)
	U.SkinCheckBox(KarniCrap_CBOpenAtMerchant)

	for i = 1, 15 do
		U.SkinCloseButton(_G["KarniInvEntry"..i.."_BtnCrap"])
	end

--	U.SkinEditBox(KarniCrap_Poor_GoldInputBox)	
--	U.SkinEditBox(KarniCrap_Poor_SilverInputBox)
--	U.SkinEditBox(KarniCrap_Poor_CopperInputBox)
--	U.SkinEditBox(KarniCrap_Tab1_CBCommonDesc_GoldInputBox)
--	U.SkinEditBox(KarniCrap_Tab1_CBCommonDesc_SilverInputBox)
--	U.SkinEditBox(KarniCrap_Tab1_CBCommonDesc_CopperInputBox)
--	U.SkinEditBox(KarniCrap_EBDestroySlotsNum)
end

U.RegisterSkin(name,SkinKarniCrap)
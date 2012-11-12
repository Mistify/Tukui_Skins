local U = unpack(select(2,...))
local name = "PoisonerSkin"
local function SkinPoisoner(self)

	U.SkinFrame(PoisonerOptions_SettingsFrame)
	U.SkinButton(PoisonerOptions_MenuSortingButton)
	U.SkinButton(PoisonerOptions_SettingsSave)
	U.SkinButton(PoisonerOptions_SettingsClose)
	U.SkinButton(PoisonerOptions_ResetFBPosition)
	U.SkinCheckBox(PoisonerOptions_ChkBox_Enable)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MBShow)
	U.SkinCheckBox(PoisonerOptions_ChkBox_FBShow)
	U.SkinCheckBox(PoisonerOptions_ChkBox_FBLock)
	U.SkinCheckBox(PoisonerOptions_ChkBox_PoisonWeaponChatOuput)
	U.SkinCheckBox(PoisonerOptions_ChkBox_ShowOnMouseover)
	U.SkinCheckBox(PoisonerOptions_ChkBox_AutoHide_inCombat)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MenuParentOwn)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MenuParentMinimap)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPTopLeft)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPTop)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPTopRight)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPLeft)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPRight)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPBottomLeft)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPBottom)
	U.SkinCheckBox(PoisonerOptions_ChkBox_MPBottomRight)
	U.SkinCheckBox(PoisonerOptions_ChkBox_ToolTipFull)
	U.SkinCheckBox(PoisonerOptions_ChkBox_ToolTipName)
	U.SkinCheckBox(PoisonerOptions_ChkBox_OverwritePreset)
	U.SkinCheckBox(PoisonerOptions_ChkBox_ShowTimer)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_IgnoreWhileFishing)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_OnlyInstanced)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_MainHand)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_OffHand)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_ThrowWeapon)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Audio)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Chat)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_ErrorFrame)
	U.SkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura_Lock)
	U.SkinCheckBox(PoisonerOptions_ChkBox_AutoBuy)
	U.SkinCheckBox(PoisonerOptions_ChkBox_AutoBuy_Prompt)
	U.SkinCheckBox(PoisonerOptions_ChkBox_AutoBuy_Check)
	U.SkinCheckBox(PoisonerOptions_ChkBox_QuickButton_Lock)

	PoisonerOptions_SettingsFrameTab1:Point("TOPLEFT", PoisonerOptions_SettingsFrame, "BOTTOMLEFT", 0, 2)

	for i = 1, 5 do
		U.SkinTab(_G["PoisonerOptions_SettingsFrameTab"..i])
	end

end

U.RegisterSkin(name,SkinPoisoner)

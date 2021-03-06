if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "MyRolePlaySkin"
local function SkinMyRolePlay(self)
hooksecurefunc(mrp, "CreateBrowseFrame", function()
	if (U.CheckOption("MyRolePlaySkin")) then 
		local bg = CreateFrame("Frame", nil, MyRolePlayBrowseFrame)
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
		bg:SetFrameLevel(MyRolePlayBrowseFrame:GetFrameLevel()-1)
		U.SkinFrame(bg)

		MyRolePlayBrowseFrame:DisableDrawLayer("BACKGROUND")
		MyRolePlayBrowseFrame:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFramePortraitFrame:Hide()
		MyRolePlayBrowseFrameTopBorder:Hide()
		MyRolePlayBrowseFrameTopRightCorner:Hide()
		MyRolePlayBrowseFrameInset:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFrameInsetBg:Hide()

		U.SkinTab(MyRolePlayBrowseFrameTab1)
		U.SkinTab(MyRolePlayBrowseFrameTab2)

		MyRolePlayBrowseFramePortrait:Hide()

		U.SkinCloseButton(MyRolePlayBrowseFrameCloseButton)
		U.SkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
		U.SkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
	end
end)

hooksecurefunc(mrp, "AddMRPTab", function()
	if (U.CheckOption("MyRolePlaySkin")) then
		U.SkinTab(CharacterFrameTab5)
	end
end)

hooksecurefunc(mrp, "CreateEditFrames", function()
	if (U.CheckOption("MyRolePlaySkin")) then
		MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
		MyRolePlayMultiEditFrameBg:Hide()
		MyRolePlayMultiEditFrameScrollFrameTop:Hide()
		MyRolePlayMultiEditFrameScrollFrameBottom:Hide()

		MyRolePlayCharacterFrame.ver:SetPoint("TOP", CharacterFrameInset, "TOP", -110, 17)
		U.SkinButton(MyRolePlayMultiEditFrameOK)
		U.SkinButton(MyRolePlayMultiEditFrameCancel)
		U.SkinButton(MyRolePlayMultiEditFrameInherit)
		U.SkinButton(MyRolePlayComboEditFrameOK)
		U.SkinButton(MyRolePlayComboEditFrameCancel)
		U.SkinButton(MyRolePlayComboEditFrameInherit)
		U.SkinButton(MyRolePlayCharacterFrame_NewProfileButton)
		U.SkinButton(MyRolePlayCharacterFrame_RenProfileButton)
		U.SkinButton(MyRolePlayCharacterFrame_DelProfileButton)
		U.SkinButton(MyRolePlayEditFrameOK)
		U.SkinButton(MyRolePlayEditFrameCancel)
		U.SkinButton(MyRolePlayEditFrameInherit)
		MyRolePlayCharacterFrame_NewProfileButton:Point("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
		MyRolePlayEditFrame.editbox:Height(25)
		MyRolePlayEditFrame.editbox:SetBackdrop({
			bgFile = "",
			edgeFile = "",
			tile = true,
			tileSize = 0,
			edgeSize = 0,
			insets = { left = 0, right = 0, top = 0, bottom = 0	},
		} )

		U.SkinBackdropFrame(MyRolePlayEditFrame.editbox)
		MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
		MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
		U.SkinNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
		U.SkinBackdropFrame(MyRolePlayCharacterFrame_ProfileComboBox)
		MyRolePlayCharacterFrame_ProfileComboBox:Size(100,20)
		MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
		MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
		U.SkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)
	end
end)

hooksecurefunc(mrp, "CreateOptionsPanel", function()
	if (U.CheckOption("MyRolePlaySkin")) then
		U.SkinCheckBox(MyRolePlayOptionsPanel_Enable)
		U.SkinCheckBox(MyRolePlayOptionsPanel_MRPButton)
		U.SkinCheckBox(MyRolePlayOptionsPanel_RPChatName)
		U.SkinCheckBox(MyRolePlayOptionsPanel_Biog)
		U.SkinCheckBox(MyRolePlayOptionsPanel_FormAC)
		U.SkinCheckBox(MyRolePlayOptionsPanel_EquipAC)
		U.SkinDropDownBox(MyRolePlayOptionsPanel_TTStyle)
		U.SkinDropDownBox(MyRolePlayOptionsPanel_HeightUnit)
		U.SkinDropDownBox(MyRolePlayOptionsPanel_WeightUnit)
	end
end)

local function reskinHeader(c, field)
	if (U.CheckOption("MyRolePlaySkin")) then
		for i = 1, field:GetNumChildren() do
			local f = select(i, field:GetChildren())
			if not f.reskinned then
				local s = U.s
				local z = U.c
				f.h.SetBackdrop = function() end
				f:StripTextures(True)
				U.SkinBackdropFrame(f.h)
				f.h.fs:SetPoint("TOPLEFT", f.h, "TOPLEFT", 0, 1)

			if f.sep then
				f.sep:SetAlpha(0)
			end

			f.reskinned = true
			end
		end
	end
end

hooksecurefunc(mrp, "CreateCFpfield", reskinHeader)
hooksecurefunc(mrp, "CreateBFpfield", reskinHeader)

end

U.RegisterSkin(name,SkinMyRolePlay)
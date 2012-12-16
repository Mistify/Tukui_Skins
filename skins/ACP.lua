if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "ACPSkin"
local function cbResize(self, event, ...)
    for i=1,20,1 do
        local checkbox = _G["ACP_AddonListEntry" .. i .. "Enabled"]
        local collapse = _G["ACP_AddonListEntry" .. i .. "Collapse"]
        local security = _G["ACP_AddonListEntry" .. i .. "Security"]
        local curr_category = ""

            if curr_category == "" then
                checkbox:SetPoint("LEFT", 5, 0)
                    if collapse:IsShown() then
                        checkbox:SetWidth(26)
                        checkbox:SetHeight(26)
                    else
                        checkbox:SetPoint("LEFT", 15, 0)
                        checkbox:SetWidth(20)
                        checkbox:SetHeight(20)
                    end
            end
                    if security:IsShown() then
                        checkbox:SetPoint("LEFT", 5, 0)
                        checkbox:SetWidth(26)
                        checkbox:SetHeight(26)
                    end
   end
end 

local function SkinACP(self)
	U.SkinFrame(ACP_AddonList)
	U.SkinFrame(ACP_AddonList_ScrollFrame)
	
	local buttons = {
        	"ACP_AddonListSetButton",
	        "ACP_AddonListDisableAll",
        	"ACP_AddonListEnableAll",
	        "ACP_AddonList_ReloadUI",
		"ACP_AddonListBottomClose",
		}

	for _, button in pairs(buttons) do
		U.SkinButton(_G[button])
	end	
	for i = 1, 20 do
		U.SkinButton(_G["ACP_AddonListEntry"..i.."LoadNow"])
	end	

	U.SkinCloseButton(ACP_AddonListCloseButton)

	for i=1,20,1 do
		local ACP_OnLoad = _G["ACP_AddonList"]
		ACP_OnLoad:SetScript("OnUpdate", cbResize)
	end

	for i = 1, 20 do
		U.SkinCheckBox(_G["ACP_AddonListEntry"..i.."Enabled"])
	end
	U.SkinCheckBox(ACP_AddonList_NoRecurse)

	U.SkinScrollBar(ACP_AddonList_ScrollFrameScrollBar)
	U.SkinDropDownBox(ACP_AddonListSortDropDown)
	ACP_AddonListSortDropDown:Width(130)

	ACP_AddonList_ScrollFrame:SetWidth(590)
	ACP_AddonList_ScrollFrame:SetHeight(412)
	ACP_AddonList:SetHeight(502)
	ACP_AddonListEntry1:Point("TOPLEFT", ACP_AddonList, "TOPLEFT", 47, -62)
	ACP_AddonList_ScrollFrame:Point("TOPLEFT", ACP_AddonList, "TOPLEFT", 20, -53)
	ACP_AddonListCloseButton:Point("TOPRIGHT", ACP_AddonList, "TOPRIGHT", 4, 5)
	ACP_AddonListSetButton:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 20, 8)
	ACP_AddonListSetButton:SetHeight(25)
	ACP_AddonListDisableAll:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 90, 8)
	ACP_AddonListDisableAll:SetHeight(25)
	ACP_AddonListEnableAll:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 175, 8)
	ACP_AddonListEnableAll:SetHeight(25)
	ACP_AddonList_ReloadUI:Point("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -160, 8)
	ACP_AddonListBottomClose:Point("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -50, 8)
	ACP_AddonListBottomClose:SetHeight(25)
	ACP_AddonList:SetParent(UIParent)
 end

 U.RegisterSkin(name, SkinACP)
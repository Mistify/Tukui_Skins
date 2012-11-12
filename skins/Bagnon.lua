local U = unpack(select(2,...))
local name = 'BagnonSkin'
local function SkinBagnon(self,event)
	local s = U.s
	local c = U.c
	if event == "BANKFRAME_OPENED" then
		if BagnonFramebank then
			if not bagnonbankonce then
				bagnonbankonce = true
				U.SkinFrame(BagnonFramebank)
				U.SkinCloseButton(BagnonFramebankCloseButton)
			end
		end
	elseif event == "GUILDBANKFRAME_OPENED" then
		if BagnonFrameguildbank then
			if not bagnonguildonce then
				bagnonguildonce = true
				U.SkinFrame(BagnonFrameguildbank)
				U.SkinCloseButton(BagnonFrameguildbankCloseButton)
			end
		end
	elseif event == "VOID_STORAGE_OPEN" then
		if BagnonFramevoidstorage then
			if not bagnonvoidonce then
				bagnonvoidonce = true
				U.SkinFrame(BagnonFramevoidstorage)
				U.SkinCloseButton(BagnonFramevoidstorageCloseButton)
			end
		end
	end
	if not BagnonSkinnedOnce then
		BagnonSkinnedOnce = true
		ToggleBackpack()
		U.SkinFrame(BagnonFrameinventory)
		U.SkinCloseButton(BagnonFrameinventoryCloseButton)
		ToggleBackpack()
	end
end
U.RegisterSkin(name,SkinBagnon,"BANKFRAME_OPENED","GUILDBANKFRAME_OPENED","VOID_STORAGE_OPEN")
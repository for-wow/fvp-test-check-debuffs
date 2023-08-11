CreateFrame('FRAME', 'FVPTEST_DebuffList', TargetFrame)
FVPTEST_DebuffList:SetBackdrop({
    bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    tile = true, tileSize = 16, edgeSize = 16, 
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
FVPTEST_DebuffList:SetPoint('CENTER', UIParent)
FVPTEST_DebuffList:SetWidth(300)
FVPTEST_DebuffList:SetHeight(90)
FVPTEST_DebuffList:SetMovable(true)
FVPTEST_DebuffList:EnableMouse(true)
FVPTEST_DebuffList:RegisterForDrag("LeftButton")
FVPTEST_DebuffList:SetScript("OnDragStart", function() this:StartMoving() end)
FVPTEST_DebuffList:SetScript("OnDragStop",  function() this:StopMovingOrSizing() end)
FVPTEST_DebuffList:Show()

FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff15', 'OVERLAY', 'GameFontNormalSmall')
FVPTEST_Debuff15:SetPoint('TOPLEFT', FVPTEST_DebuffList, 4, -8)

FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff16', 'OVERLAY', 'GameFontNormalSmall')
FVPTEST_Debuff16:SetPoint('TOPLEFT', FVPTEST_DebuffList, 4, -28)

FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff17', 'OVERLAY', 'GameFontNormalSmall')
FVPTEST_Debuff17:SetPoint('TOPLEFT', FVPTEST_DebuffList, 4, -48)

FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff18', 'OVERLAY', 'GameFontNormalSmall')
FVPTEST_Debuff18:SetPoint('TOPLEFT', FVPTEST_DebuffList, 4, -68)

local f = CreateFrame('FRAME')
f:RegisterEvent('PLAYER_LOGIN')

f:SetScript('OnEvent', function()
	MAX_TARGET_DEBUFFS = 40
	for i = 17, MAX_TARGET_DEBUFFS do
		local b = CreateFrame("Button", "TargetFrameDebuff" .. i, TargetFrame, "TargetDebuffButtonTemplate")
		b:SetID(i)
		b:SetPoint("LEFT", getglobal("TargetFrameDebuff" .. (i - 1)), "RIGHT", 3, 0)
	end

	local timer = CreateFrame('FRAME')
	timer.start = GetTime()
	timer:SetScript('OnUpdate', function()
		if GetTime() >= (this.start + 1) then
			this.start = this.start + 1
			--SELECTED_CHAT_FRAME:AddMessage(GetTime())
			local debuff, debuffStack, debuffType
			debuff, debuffStack, debuffType = UnitDebuff('target', 15)
			FVPTEST_Debuff15:SetText('15 - ' .. (debuff or ''))
			debuff, debuffStack, debuffType = UnitDebuff('target', 16)
			FVPTEST_Debuff16:SetText('16 - ' .. (debuff or ''))
			debuff, debuffStack, debuffType = UnitDebuff('target', 17)
			FVPTEST_Debuff17:SetText('17 - ' .. (debuff or ''))
			debuff, debuffStack, debuffType = UnitDebuff('target', 18)
			FVPTEST_Debuff18:SetText('18 - ' .. (debuff or ''))
		end
	end)
end)

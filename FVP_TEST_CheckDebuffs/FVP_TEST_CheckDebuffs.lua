CreateFrame('FRAME', 'VPTCD_FrmDebuffs', UIParent)
VPTCD_FrmDebuffs:SetBackdrop({
    bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    tile = true, tileSize = 16, edgeSize = 16, 
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
VPTCD_FrmDebuffs:SetPoint('CENTER', UIParent)
VPTCD_FrmDebuffs:SetWidth(110)
VPTCD_FrmDebuffs:SetHeight(24)
VPTCD_FrmDebuffs:SetMovable(true)
VPTCD_FrmDebuffs:EnableMouse(true)
VPTCD_FrmDebuffs:RegisterForDrag('LeftButton')
VPTCD_FrmDebuffs:SetScript('OnDragStart', function() this:StartMoving() end)
VPTCD_FrmDebuffs:SetScript('OnDragStop',  function() this:StopMovingOrSizing() end)
VPTCD_FrmDebuffs:Show()

VPTCD_FrmDebuffs:CreateFontString('FVPTEST_StrKey', 'OVERLAY', 'GameFontHighlightSmall')
FVPTEST_StrKey:SetPoint('TOPLEFT', VPTCD_FrmDebuffs, 6, -6)
FVPTEST_StrKey:SetText('Debuffs count =')

VPTCD_FrmDebuffs:CreateFontString('FVPTEST_StrVal', 'OVERLAY', 'GameFontHighlightSmall')
FVPTEST_StrVal:SetPoint('LEFT', FVPTEST_StrKey, 'RIGHT')
FVPTEST_StrVal:SetText('0')

local max = 0
local tick = GetTime()
VPTCD_FrmDebuffs:SetScript('OnUpdate', function()
    if GetTime() >= (tick + 1) then
        tick = tick + 1
        for i = 1, 40 do
            local debuff, debuffStack, debuffType = UnitDebuff('target', i)
            if debuff then
                if max < i then
                    max = i
                end
            end
        end
        FVPTEST_StrVal:SetText(max)
    end
end)

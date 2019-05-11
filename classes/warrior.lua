 --[[
order = 5,
row = 2,
ignoreGCD = true,
cost = true,
stack = true,
glow = true,
glowSound = true,
stackFunc = function() return GetSpellCount(228477) end,
charges = true,
showFunc = function()
	return select(4, GetTalentInfo(5, 1, 1))
end,
range = true,
customRange = function()
	if UnitExists('target') then
		return IsSpellInRange('Maul', 'target') == 1
	else
		return true
	end
end,
--]]
local _, iCD = ...
function iCD:WARRIOR(specID)
	local temp = {}
	temp.spec = {}
	temp.all = {}
	temp.all.row1 = {}
	temp.all.row2 = {}
	temp.all.row3 = {}
	temp.all.row4 = {}
	temp.all.row5 = {}
	temp.all.buffsC = {}
	temp.all.buffsI = {}
	local t = temp.spec
	t.row1 = {}
	t.row2 = {}
	t.row3 = {}
	t.row4 = {}
	t.row5 = {}
	t.buffsC = {}
	t.buffsI = {}
	if specID == 71 then--Arms
		iCD.outOfRangeSpells = {
			main = 'Mortal Strike',
			range = 'Heroic Throw',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				local power = UnitPower('player', 1)
				if power >= 85 then
					return iCD.colors.green .. power
				else
					return power
				end
			end,
		}
		t.row1 = {
			[167105] = { -- Colossus Smash
				order = 3,
				range = true,
				glow = true,
				glowSound = true,
				showTimeAfterGCD = true,
				stack = true,
				stackFunc = function()
					local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitDebuff('target', 'Colossus Smash', nil, 'player')
					if name then
						local dura = expirationTime - GetTime()
						if dura > 5 then
							--return string.format('%.0f', dura)
							return dura, '%.0f'
						else
							return dura, '|cffff1a1a%.1f'
						end
					else
						return ''
					end
				end,
			},
			[12294] = { -- Mortal Strike
				order = 5,
				range = true,
				showTimeAfterGCD = true,
				cost = true,
				stack = select(4, GetTalentInfo(5, 2, 1)),
				charges = select(4, GetTalentInfo(5, 2, 1)),
				glow = true,
				glowSound = 'text2',
			},
			[152277] = { -- Ravager
				order = 7,
				showTimeAfterGCD = true,
			},
			[209577] = { -- Warbreaker (artifact)
				order = 8,
				showTimeAfterGCD = true,
			},
			[845] = { -- Cleave
				order = 10,
				range = true,
				showTimeAfterGCD = true,
				cost = true,
			},
			[46968] = { -- Shockwave
				order = 8,
				showFunc = function()
					return select(4, GetTalentInfo(2, 1, 1))
				end,
				showTimeAfterGCD = true,
			},
			[107570] = { -- Stormbolt
				order = 8,
				row = 1,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(2, 2, 1))
				end,
				showTimeAfterGCD = true,
			},
		}
		t.row2 = {
			[1719] = { -- Battle Cry
				order = 3,
				ignoreGCD = true,
			},
			[97462] = { -- Commanding Shout
				order = 12,
				ignoreGCD = true,
			},
			[184364] = { -- Enraged Regeneration
				order = 11,
				ignoreGCD = true,
			},
			[107574] = { -- Avatar
				order = 10,
				row = 2,
				showFunc = function()
					return select(4, GetTalentInfo(3, 3, 1))
				end,
			},
		}
		t.row3 = {
		}
		t.row4 = {
			[18499] = {}, -- Berserker Rage
			--[198304] = {}, -- Intercept
			[355] = {}, -- Taunt
			[100] = { -- charge
				stack = true,
				charges = true,
			},
			[6544] = { -- Heroic Leap
				charges = IsEquippedItem(143728),
				stack = IsEquippedItem(143728),
			},
		}
		t.row5 = {
		}
		t.buffsI = {
			[215570] = { -- Wrecking Ball
				showFunc = function()
					return select(4, GetTalentInfo(3, 1, 1))
				end,
			},
			[206333] = { -- Taste for Blood
				stack = true,
			},
			[184362] = {}, -- Enrage
		}
		t.buffsC = {
			[1719] = {}, -- Battly Cry
			[107574] = {}, -- Avatar
			[18499] = {}, -- Berserker Rage
			[184364] = {}, -- Enraged Regeneration
		}
	elseif specID == 72 then --Fury
		iCD.outOfRangeSpells = {
			main = 'Bloodthirst',
			range = 'Heroic Throw',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				local power = UnitPower('player', 1)
				local isRampageUsable = select(2, IsUsableSpell('Rampage'))
				if not isRampageUsable then
					return iCD.colors.green .. power
				else
					return power
				end
			end,
		}
		t.row1 = {
			[5308] = { -- Execute
				order = 1,
				glow = true,
				range = true,
				glowSound = true,
				cost = true,
				customCost = function()
					local isUsable = IsUsableSpell("Execute")
					if not isUsable then
						return true
					end
				end,
				showTimeAfterGCD = true,
			},
			[184367] = { -- Rampage
				order = 2,
				glow = true,
				range = true,
				glowSound = 'text1',
				cost = true,
			},
			[23881] = { -- Bloodthirst
				order = 3,
				range = true,
				showTimeAfterGCD = true,
			},
			[85288] = { -- Raging Blow
				order = 5,
				range = true,
				charges = true,
				stack = true,
				showTimeAfterGCD = true,
			},
			[118000] = { -- Dragon Roar
				order = 6,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(6, 2, 1))
				end,
				showTimeAfterGCD = true,
			},
			[46924] = { -- Bladestorm
				order = 6,
				showFunc = function()
					return select(4, GetTalentInfo(6, 3, 1))
				end,
				showTimeAfterGCD = true,
			},
			[107570] = { -- Stormbolt
				order = 8,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(2, 3, 1))
				end,
				showTimeAfterGCD = true,
			},
		}
		t.row2 = {
			[1719] = { -- Recklessness
				order = 3,
			},
			[97462] = { -- Commanding Shout
				order = 12,
			},
			[184364] = { -- Enraged Regeneration
				order = 11,
				ignoreGCD = true,
			},
		}
		t.row3 = {
		}
		t.row4 = {
			[18499] = {}, -- Berserker Rage
			[355] = {}, -- Taunt
			[100] = { -- charge
				stack = true,
				charges = true,
			},
			[6544] = {}, -- Heroic Leap
		}
		t.row5 = {
		}
		t.buffsI = {
			[85739] = { -- Whirlind
				stack = true,
			},
			[184362] = {}, -- Enrage
			[32216] = {}, -- Victory Rush
		}
		t.buffsC = {
			[1719] = {}, -- Battly Cry
			[18499] = {}, -- Berserker Rage
			[184364] = {}, -- Enraged Regeneration
		}
	elseif specID == 73 then --Protection
		--gcd = 20243, -- Devastate
		iCD.outOfRangeSpells = {
			main = 'Shield Slam',
			range = 'Heroic Throw',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				local power = UnitPower('player', 1)
				if power >= 60 then
					return iCD.colors.green .. power
				elseif iCD.UnitBuff('player', 'Vengeance: Ignore Pain') and power >= 39 then
					return iCD.colors.green .. power
				else
					return power
				end
			end,
		}
		t.row1 = {
			[23922] = { -- Shield Slam
				order = 3,
				row = 1,
				range = true,
				glow = true,
				glowSound = true,
				stack = true,
				stackFunc = function()
					if iCD.UnitBuff('player', "Kakushan's Stormscale Gauntlets") then
						return iCD.colors.green .. '+'
					else
						return ''
					end
				end,
				showTimeAfterGCD = true,
			},
			[6572] = { -- Revenge
				order = 7,
				row = 1,
				range = true,
				cost = true,
				glow = true,
				glowSound = 'text1',
				stack = true,
				stackFunc = function()
					if iCD.UnitBuff('player', 'Vengeance: Revenge') then
						return iCD.colors.green .. '+'
					elseif iCD.UnitBuff('player', 'Vengeance: Ignore Pain') then
						return iCD.colors.red .. '_'
					else
						return ''
					end
				end,
				customRangeSpell = 'Shield Slam',
				showTimeAfterGCD = true,
			},
			[6343] = { -- Thunder Clap
				order = 5,
				row = 1,
				stack = true,
				stackFunc = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', 'Avatar')

					local start, cd = GetSpellCooldown(6343)
					if expirationTime and (start+cd) < expirationTime+.1 then
						return iCD.colors.green .. '+'
					else
						return ''
					end
				end,
				showTimeAfterGCD = true,
			},
			[46968] = { -- Shockwave
				order = 8,
				row = 1,
				showTimeAfterGCD = true,
			},
			[107570] = { -- Stormbolt
				order = 9,
				row = 1,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(5, 3, 1))
				end,
				showTimeAfterGCD = true,
			},
			[202168] = { -- Impending Victory
				order = 9,
				range = true,
				cost = true,
				showFunc = function()
					return select(4, GetTalentInfo(1, 3, 1))
				end,
				showTimeAfterGCD = true,
			},
			[228920] = { -- Ravager
				order = 10,
				showFunc = function()
					return select(4, GetTalentInfo(7, 3, 1))
				end,
				showTimeAfterGCD = true,
			},
		}
		t.row2 = {
			[1160] = { -- Demoralizing Shout
				order = 4,
			},
			[12975] = { -- Last Stand
				order = 5,
				ignoreGCD = true,
			},
			[871] = { -- Shield Wall
				order = 7,
				ignoreGCD = true,
			},
			[23920] = { -- Spell Reflection
				order = 9,
				ignoreGCD = true,
			},
			[107574] = { -- Avatar
				order = 10,
			},
			[5246] = {  -- Intimidating Shout
				order = 11,
			},
			[97462] = { -- Rallying Cry
				order = 12,
			},
		}
		t.row3 = {
			[2565] = { -- Shield Block
				order = 2,
				stack = true,
				charges = true,
				ignoreGCD = true,
				cost = true,
				AM = function()
					local _, _, ls = iCD.UnitBuff('player', "Last Stand", nil, 'player')
					if ls then return true end
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', 'Shield Block')
					if expirationTime then
						local dura = expirationTime - GetTime()
						if dura + 6 > 18 then
							return true
						end
					end
					return
				end,
			},
			[190456] = { -- Ignore Pain
				order = 1,
				cost = true,
				stack = true,
				stackFunc = function()
					local v = select(5, iCD.UnitBuff('player', 'Ignore Pain'))
					if v then
						return v/1e3, '%.1f'
					else
						 return ''
					end
				end,
				customText = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Ignore Pain", nil, 'player')
					if expirationTime then
						local dura = expirationTime - GetTime()
						if dura > 5 then
							return dura,'%.0f'
						else
							return dura, '|cffff1a1a%.1f'
						end
					else
						return ''
					end
				end,
			},
		}
		t.row4 = {
			[18499] = {}, -- Berserker Rage
			--[198304] = {}, -- Intercept
			[355] = {  -- Taunt
				ignoreGCD = true,
			},
			[198304] = { -- Intercept
				stack = true,
				charges = true,
			},
			[6544] = { -- Heroic Leap
				charges = IsEquippedItem(143728),
				stack = IsEquippedItem(143728),
			},
		}
		t.row5 = {
			[1160] = { -- Demoralizing Shout
				debuff = true,
			},
			[12975] = {}, -- Last Stand
			[227744] = { -- Ravager
				showFunc = function()
					return select(4, GetTalentInfo(7, 3, 1))
				end,
			},
			[871] = {}, -- Shield Wall
			[23920] = {}, -- Spell Reflection
		}
		t.buffsI = {
			[32216] = { -- Victory Rush enabled
				showFunc = function()
					return not select(4, GetTalentInfo(1, 3, 1))
				end,
			},
			[132404] = {}, -- Shield Block
			[204488] = { -- Focused Rage
				stack = true,
			},
			[203581] = {}, -- Dragon Scales
			--[[
			[202573] = { -- Vengeance: Revenge
				showFunc = function()
					return select(4, GetTalentInfo(6, 1, 1))
				end,
				stack = iCD.colors.red .. 'R',
			},
			[202574] = { -- Vengeance: Ignore Pain
				showFunc = function()
					return select(4, GetTalentInfo(6, 1, 1))
				end,
				stack = iCD.colors.green .. 'IP',
			},
			--]]
		}
		t.buffsC = {
			[1719] = {}, -- Battly Cry
			[107574] = {}, -- Avatar
			[18499] = {}, -- Berserker Rage
			[202289] = {  -- Renewed Fury
				showFunc = function()
					return select(4, GetTalentInfo(3, 1, 1))
				end,
			},
			[189064] = { -- Scales of Earth (Artifact)
				stack = '+A',
			},
		}
	end
	return temp
end

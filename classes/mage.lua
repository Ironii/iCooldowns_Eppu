local _, iCD = ...
function iCD:MAGE(specID)
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
	if specID == 62 then -- Arcane
		--gcd = 162243, -- Demon's Bite
		iCD.outOfRangeSpells = {
			main = 'Arcane Blast',
			range = 'Arcane Blast',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				return math.floor((UnitPower('player', 0)/UnitPowerMax('player', 0))*100)
			end,
		}
		t.row1 = {
			[224968] = { -- Mark of Aluneth (artifact)
				order = 2,
				range = true,
			},
			[44425] = { -- Arcane Barrage
				order = 3,
				range = true,
				stack = true,
				stackFunc = function()
					return UnitPower('player', 16)
				end,
			},
			[5143] = { -- Arcane Missiles
				order = 5,
				range = true,
				cost = true,
				customText = function()
					local c = GetSpellCount(5143)
					return c > 0 and c or ''
				end,
				glow = true,
				glowSound = true,
			},
			[153626] = { -- Arcane orb
				order = 7,
				cost = true,
				showFunc = function()
					return select(4, GetTalentInfo(7, 3, 1))
				end,
			},
		}
		t.row2 = {
			[205025] = { -- Precense of Mind
				order = 2,
				ignoreGCD = true,
			},
			[12042] = { -- Arcane Power
				order = 3,
				ignoreGCD = true,
			},
			[205032] = { -- Charged Up
				order = 4,
				ignoreGCD = true,
				showFunc = function()
					return select(4, GetTalentInfo(4, 2, 1))
				end,
			},
			[12051] = { -- Evocation
				order = 7,
			},
			[45438] = { -- Ice Block
				order = 9,
			},
		}

		t.row4 = { -- Blink
			[1953] = {
				showFunc = function()
					return not select(4, GetTalentInfo(2, 1, 1))
				end,
			},
			[212653] = { -- Shimmer
				showFunc = function()
					return select(4, GetTalentInfo(2, 1, 1))
				end,
				charges = true,
				stack = true,
				ignoreGCD = true,
			},
			[195676] = { -- Displacement
			},
			[122] = {}, -- Frost Nova
			[110959] = {}, -- Greater Invisibility
			[80353] = {}, -- Time Warp
			[212801] = {}, --Displacement
			[235450] = {}, --Prismatic Barrier
		}
		t.buffsC = {
			[235450] = {}, -- Prismatic Barrier
			[12042] = { -- Arcane Power
				stack = '+D'
			},
		}
		t.buffsI = {
			[205025] = { -- Precense of Mind
				stack = true,
			},
		}
	elseif specID == 63 then --Fire
		--gcd = 162243, -- Demon's Bite
		iCD.outOfRangeSpells = {
			main = 'Fireball',
			range = 'Fireball',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				return math.floor((UnitPower('player', 0)/UnitPowerMax('player', 0))*100)
			end,
		}
		t.row1 = {
			[11366] = { -- Pyroblast
				order = 3,
				range = true,
				glow = true,
				glowSound = 'text1',
				customText = function()
					--local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitBuff('player', 'Hot Streak!')
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Hot Streak!", nil, 'player')
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
			[194466] = { -- Phoenix's Flames (artifact)
				range = true,
				cost = true,
				charges = true,
				stack = true,
				order = 5,
			},
			[108853] = { -- Fire Blast
				range = true,
				cost = true,
				charges = true,
				stack = true,
				order = 6,
			},
			[198929] = { -- Cinderstorm
				order = 7,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(7, 2, 1))
				end,
			},
			[44457] = { -- Living Bomb
				order = 8,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(6, 1, 1))
				end,
			},

		}
		t.row2 = {
			[190319] = { -- Combustion
				order = 3,
				ignoreGCD = true,
			},
			[235313] = { -- Blazing Barrier
				order = 8,
				cost = true,
			},
			[45438] = { -- Ice Block
				order = 9,
			},
		}

		t.row4 = { -- Blink
			[1953] = {
				showFunc = function()
					return not select(4, GetTalentInfo(2, 1, 1))
				end,
			},
			[212653] = { -- Shimmer
				showFunc = function()
					return select(4, GetTalentInfo(2, 1, 1))
				end,
				charges = true,
				stack = true,
				ignoreGCD = true,
			},
			[31661] = {}, -- Dragon's Breath
			[122] = {}, -- Frost Nova
			[66] = {}, -- Invisibility
			[80353] = {}, -- Time Warp
		}
		t.buffsC = {
			[235313] = {}, -- Blazing Barrier
			[190319] = { -- Combustion
				stack = '+C'
			},
		}
		t.buffsI = {
			[48107] = {}, -- Heating Up
		}
	elseif specID == 64 then --Frost
		--gcd = 162243, -- Demon's Bite
		iCD.outOfRangeSpells = {
			main = 'Frostbolt',
			range = 'Frostbolt',
		}
		t.power = {
			pos = {
				x = -990,
				y = -8,
			},
			func = function()
				return math.floor((UnitPower('player', 0)/UnitPowerMax('player', 0))*100)
			end,
		}
		t.row1 = {
			[30455] = { -- Ice Lance
				order = 3,
				range = true,
				glow = true,
				glowSound = 'text1',
				customText = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Fingers of Frost", nil, 'player')
					if count then
						if count < 2 then
							return count
						else
							return count, '|cffff1a1a%s'
						end
					else
						return ''
					end
				end,
				stack = true,
				stackFunc = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Fingers of Frost", nil, 'player')
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
			[44614] = { -- Flurry
				order = 4,
				range = true,
				glow = true,
				glowSound = true,
				customText = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Brain Freeze", nil, 'player')
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
			[84714] = { -- Frozen orb
				range = true,
				cost = true,
				order = 6,
			},
			[157997] = { -- Ice Nova
				order = 7,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(4, 1, 1))
				end,
			},
			[153595] = { -- Comet Storm
				order = 10,
				cost = true,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(7, 3, 1))
				end,
			},
			[257537] = { -- Bonbolt
				order = 5,
				cost = true,
				range = true,
				showFunc = function()
					return select(4, GetTalentInfo(4, 3, 1))
				end,
			},
			[190356] = { -- Blizzard
				order = 15,
				cost = true,
				glow = true,
				stack = true,
				stackFunc = function()
					local count, duration, expirationTime, value1, value2, value3 = iCD.UnitBuff('player', "Freezing Rain", nil, 'player')
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
		t.row2 = {
			[12472] = { -- Icy Veins
				order = 3,
			},
			[108839] = { -- Ice Floes
				order = 5,
				charges = true,
				ignoreGCD = true,
				stack = true,
				showFunc = function()
					return select(4, GetTalentInfo(2, 2, 1))
				end,
			},
			[11426] = { -- Ice Barrier
				order = 8,
				cost = true,
			},
			[45438] = { -- Ice Block
				order = 9,
			},
			[235219] = { -- Cold Snap
				order = 10,
				ignoreGCD = true,
			},
		}

		t.row4 = { -- Blink
			[1953] = {
				showFunc = function()
					return not select(4, GetTalentInfo(2, 1, 1))
				end,
			},
			[212653] = { -- Shimmer
				showFunc = function()
					return select(4, GetTalentInfo(2, 1, 1))
				end,
				charges = true,
				stack = true,
				ignoreGCD = true,
			},
			[120] = {}, -- Cone of Cold
			[122] = {}, -- Frost Nova
			[66] = {}, -- Invisibility
			[80353] = {}, -- Time Warp
		}
		t.buffsC = {
			[11426] = {}, -- Ice Barrier
			[12472] = { -- Icy Veins
				stack = '+H'
			},
		}
		t.buffsI = {
			[108839] = {}, -- Ice Floes
			[228358] = { -- Winter's Chill
				debuff = true,
			},
		}
	end
	return temp
end

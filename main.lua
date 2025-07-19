--- STEAMODDED HEADER
--- MOD_NAME: BoMod
--- MOD_ID: BoMod
--- MOD_AUTHOR: [BoNoise]
--- MOD_DESCRIPTION: A mod that adds some jokers to the game (my friends profile picture joker, and more)
--- PREFIX: xmpl
----------------------------------------------
------------MOD CODE -------------------------


SMODS.Atlas{
    key = 'Jokers', --atlas key
    path = 'Jokers.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}

SMODS.Atlas{
    key = 'Friends', --atlas key
    path = 'Friends.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}

SMODS.Joker{
    key = 'bonoise', --joker key
    loc_txt = { -- local text
        name = 'BoNoise',
        text = {
          '{X:mult,C:white}X#1#{} Multi',
          'Gana {C:money}4${} al final de la ronda.'
        },
        --[[unlock = {
            'Be {C:legendary}cool{}',
        }]]
    },
    atlas = 'Jokers', --atlas' key
    rarity = 3, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 4, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    config = { 
      extra = {
        Xmult = 35 --configurable value
      }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == 'derek_loves_you' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self,wawa,wawa2)
        --whether or not this card is in the pool, return true if it is, return false if its not
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 4
    end,
}


SMODS.Joker {
	key = 'albuquerque',
	loc_txt = {
		name = 'Albuquerque: THE MOVIE',
		text = {
			"Cada {C:attention}2{}, {C:attention}6 o {C:attention}5{}",
			"jugado da {C:chips}+#1#{} Fichas y",
			"{C:mult}+#2#{} Multi cuando anotan",
			"{C:inactive}Way back when i was just a little bitty boy...{}"
		}
	},
	config = { extra = { chips = 3, mult = 3 } },
	rarity = 1,
	atlas = 'Friends',
	pos = { x = 2, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			-- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
			if context.other_card:get_id() == 2 or context.other_card:get_id() == 6 or context.other_card:get_id() == 5 then
				-- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
				return {
					chips = card.ability.extra.chips,
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
	end
}


-- main.lua

SMODS.Sound({
    key = "xmpl_onsightkanye",
    path = "onsightkanye.ogg"
})

SMODS.Joker{
    key = 'onsight',
    loc_txt = {
        name = 'ON SIGHT',
        text = {
            "{C:dark_edition}YEEZY SEASON APPROACHING{}",
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 4, y = 1},
    config = { 
        extra = {
            Xmult = 4
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                sound = "xmpl_onsightkanye",
                message = "ON SIGHT!"
            }
        end
    end,

    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
}

SMODS.Sound({
    key = "xmpl_klapix23",
    path = "klapix23.ogg"
})



-- Registro del Joker Jimbo You Are The Best Joker
SMODS.Joker{
    key = 'jimbobestjoker',
    loc_txt = {
        name = 'Jimbo eres el mejor Joker!',
        text = {
            '{X:mult,C:white}X3.14{} multi',
            '{C:attention}-5{} dolares al final',
            'de la ronda.',
        },
            },
    atlas = 'Jokers', --atlas' key
    rarity = 3, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 4, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 3, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    config = { 
      extra = {
        Xmult = 3.14 --configurable value
      }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == 'derek_loves_you' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
				sound = "xmpl_klapix23",
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X3.14159265359',
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self,wawa,wawa2)
        --whether or not this card is in the pool, return true if it is, return false if its not
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return -1
    end,
}




-- Registro del asdefrio
SMODS.Joker{
    key = 'asdefrio',
    loc_txt = {
        name = 'AsdefrioGamer',
        text = {
            '{X:mult,C:white}X0.5{} multi',
			'{C:inactive}"Namás ponme que de -1 de multi :fire:"{}',
			'{C:inactive}No es posible pero da x0.5 de multi :){}'
        },
            },
    atlas = 'Friends', --atlas' key
    rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 4, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    config = { 
      extra = {
        Xmult = 0.5 --configurable value
      }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == 'derek_loves_you' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'lol xmulti negativo',
                colour = G.C.MULT
            }
        end
    end,
}

SMODS.Joker {
	key = 'lncvrt',
	loc_txt = {
		name = 'Lncvrt',
		text = {
			"{C:red}+#1#{} descartes",
			"cada ronda,",
			"{C:red}#2#{} tamaño de mano."
		}
	},
	config = { extra = { discard_size = -3, hand_size = 4 } },
	rarity = 2,
	atlas = 'Friends',
	pos = { x = 1, y = 0 },
	cost = 7,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.discard_size, card.ability.extra.hand_size } }
	end,
	-- This function is called when the card is added to deck. from_debuff is true whenever a card gets debuffed and then undebuffed.
	-- Debuffs usually call both of these functions, essentially, when a joker is debuffed, it's simply removed from your jokers, except for the fact that it takes up a slot.
	add_to_deck = function(self, card, from_debuff)
		-- Changes a G.GAME variable, which is usually a global value that's specific to the current run.
		-- These are initialized in game.lua under the Game:init_game_object() function, and you can look through them to get an idea of the things you can change.
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
		G.hand:change_size(card.ability.extra.hand_size)
	end,
	-- Inverse of above function.
	remove_from_deck = function(self, card, from_debuff)
		-- Adds - instead of +, so they get subtracted when this card is removed.
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
		G.hand:change_size(-card.ability.extra.hand_size)
	end
	-- Because all the functionality is in remove_from_deck and add_to deck, calculate is unnecessary.

	--[[
	Extra note, having the config as something like
	config = {d_size = 3, h_size = -1, extra = {whatever variables you put}}
	automatically applies these changes.
	However, these values outside of the extra table are constants, so they aren't good for jokers with values that change.
	You can find a fuller list of them at card.lua:275.
	]]
}

SMODS.Joker {
	key = 'motita',
	loc_txt = {
		name = 'Motita',
		text = {
			"{C:mult}+#1#{} Mult",
			"{C:green}#2# in #3#{} probabilidades de que",
			"explote al final de la ronda"
		}
	},
	-- This searches G.GAME.pool_flags to see if Gros Michel went extinct. If so, no longer shows up in the shop.
	no_pool_flag = 'gros_michel_extinct2',
	config = { extra = { mult = 250, odds = 2 } },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 4, y = 0 },
	cost = 5,
	-- Gros Michel is incompatible with the eternal sticker, so this makes sure it can't be eternal.
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		-- Checks to see if it's end of round, and if context.game_over is false.
		-- Also, not context.repetition ensures it doesn't get called during repetitions.
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			-- Another pseudorandom thing, randomly generates a decimal between 0 and 1, so effectively a random percentage.
			if pseudorandom('gros_michel2') < G.GAME.probabilities.normal / card.ability.extra.odds then
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				-- Sets the pool flag to true, meaning Gros Michel 2 doesn't spawn, and Cavendish 2 does.
				G.GAME.pool_flags.gros_michel_extinct2 = true
				return {
					message = 'ya me cargo el payaso 3:'
				}
			else
				return {
					message = 'jajajajaja :3'
				}
			end
		end
	end
}

SMODS.Joker {
	key = 'ultimorecurso',
	loc_txt = {
		name = 'Ultimo Recurso (NO FUNCIONA)',
		text = {
			"{C:mult}+#1#{} Mult",
			"se {C:red,E:2}auto destruye{} al final",
			"de la {C:attention}ronda.{}",
			"{C:red,E:2}USALO COMO ULTIMO RECURSO!{}"
		}
	},
	-- This searches G.GAME.pool_flags to see if Gros Michel went extinct. If so, no longer shows up in the shop.
	no_pool_flag = 'gros_michel_extinct2',
	config = { extra = { mult = 55000, odds = 1 } },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 4, y = 0 },
	cost = 5,
	-- Gros Michel is incompatible with the eternal sticker, so this makes sure it can't be eternal.
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		-- Checks to see if it's end of round, and if context.game_over is false.
		-- Also, not context.repetition ensures it doesn't get called during repetitions.
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			-- Another pseudorandom thing, randomly generates a decimal between 0 and 1, so effectively a random percentage.
			if pseudorandom('gros_michel2') < G.GAME.probabilities.normal / card.ability.extra.odds then
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				-- Sets the pool flag to true, meaning Gros Michel 2 doesn't spawn, and Cavendish 2 does.
				G.GAME.pool_flags.gros_michel_extinct2 = true
				return {
					message = 'Bye Bye!'
				}
			else
				return {
					message = 'wtf, seriously, wtf just happened?'
				}
			end
		end
	end
}

SMODS.Joker {
	key = 'ittakestwo',
	loc_txt = {
		name = 'It Takes Two',
		text = {
			"Cada {C:attention}2{} jugado",
			"da {C:chips}+#1#{} fichas y",
			"{C:mult}+#2#{} Mult cuando anotan"
		}
	},
	config = { extra = { chips = 22, mult = 2 } },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 0, y = 1 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			-- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
			if context.other_card:get_id() == 2 then
				-- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
				return {
					chips = card.ability.extra.chips,
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
	end
}

SMODS.Joker {
	key = 'jobapplication',
	loc_txt = {
		name = 'Solicitud de Empleo',
		text = {
			"Rejuega 2 veces todos",
			"los {C:attention}Aces{} jugados"
		}
	},
	config = { extra = { repetitions = 2 } },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 1, y = 1 },
	cost = 6,
	calculate = function(self, card, context)
		-- Checks that the current cardarea is G.play, or the cards that have been played, then checks to see if it's time to check for repetition.
		-- The "not context.repetition_only" is there to keep it separate from seals.
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			-- context.other_card is something that's used when either context.individual or context.repetition is true
			-- It is each card 1 by 1, but in other cases, you'd need to iterate over the scoring hand to check which cards are there.
			if context.other_card:get_id() == 14 then
				return {
					message = 'Rechazado!',
					repetitions = card.ability.extra.repetitions,
					-- The card the repetitions are applying to is context.other_card
					card = context.other_card
				}
			end
		end
	end
}

SMODS.Joker {
	key = 'solouno',
	loc_txt = {
		name = 'Una Carta',
		text = {
			"{C:chips}+#2#{} Fichas",
			"si la mano jugada",
			"contiene {C:attention}Carta mas Alta{}",
			"{C:inactive}({C:chips}+#1#{C:inactive} Fichas)"
		}
	},
	config = { extra = { chips = 0, chip_gain = 10 } },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 2, y = 1 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end

		-- context.before checks if context.before == true, and context.before is true when it's before the current hand is scored.
		-- (context.poker_hands['Straight']) checks if the current hand is a 'Straight'.
		-- The 'next()' part makes sure it goes over every option in the table, which the table is context.poker_hands.
		-- context.poker_hands contains every valid hand type in a played hand.
		-- not context.blueprint ensures that Blueprint or Brainstorm don't copy this upgrading part of the joker, but that it'll still copy the added chips.
		if context.before and next(context.poker_hands['High Card']) and not context.blueprint then
			-- Updated variable is equal to current variable, plus the amount of chips in chip gain.
			-- 15 = 0+15, 30 = 15+15, 75 = 60+15.
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				-- The return value, "card", is set to the variable "card", which is the joker.
				-- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
				-- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
				card = card
			}
		end
	end
}

SMODS.Joker {
	key = 'poly',
	loc_txt = {
		name = 'Poly',
		text = {
			"Crea una copia {C:dark_edition}Policromada{} aleatoria",
			"de {C:attention}1{} {C:attention}consumable{} random",
			"en tu posesion al final",
			"de la {C:attention}Tienda{}",
            "{C:attention}DE QUE ME SIRVE UNA POLICROMADA?????{}"
		}
	},
	-- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
	config = { extra = {} },
	rarity = 4,
	atlas = 'Jokers',
	pos = { x = 3, y = 1 },
	-- soul_pos sets the soul sprite, only used in vanilla for legendary jokers and Hologram.
	cost = 20,
	loc_vars = function(self, info_queue, card)
		-- This is the way to add an info_queue, which is extra information about other cards
		-- like Stone Cards on Marble/Stone Jokers, Steel Cards on Steel Joker, and
		-- in this case, information about negative editions on Perkeo.
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
	end,
	calculate = function(self, card, context)
		if context.ending_shop then
			--[[ I very heavily recommend looking through the SMODS wiki
				page that talks about the event manager if you ever need to use it.
				
				For a simple explanation, all the animations and effects happen in a queue.
				A lot of things will be handles automatically, but there are some cases when
				you'll want to use an event manager, usually when things don't run in the order
				you expect them to, or have other edge case things, like ghost cards that still
				exist after you try removing them.
				
				The most common use I've seen is when changing the state of cards, where it
				copies a card and adds it like in this case, or when a card is destroyed or
				when a card is generated. It's daunting, but, it's usually nothing you'll have
				to worry about, and it will make sense if you just take it slow and read the wiki.]]
			G.E_MANAGER:add_event(Event({
				func = function()
					-- pseudorandom_element is a vanilla function that chooses a single random value from a table of values, which in this case, is your consumables.
					-- pseudoseed('perkeo2') could be replaced with any text string at all - It's simply a way to make sure that it's affected by the game seed, because if you use math.random(), a base Lua function, then it'll generate things truly randomly, and can't be reproduced with the same Balatro seed. LocalThunk likes to have the joker names in the pseudoseed string, so you'll often find people do the same.
					local card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo2')), nil)

					-- Vanilla function, it's (edition, immediate, silent), so this is ({edition = 'e_negative'}, immediate = true, silent = nil)
					card:set_edition('e_polychrome', true)
					card:add_to_deck()
					-- card:emplace puts a card in a cardarea, this one is G.consumeables, but G.jokers works, and custom card areas could also work.
					-- I think playing cards use "create_playing_card()" and are separate.
					G.consumeables:emplace(card)
					return true
				end
			}))
			--[[ card_eval_status_text lets you send status text, those pop-up messages, outside
				of when you return from a calculate function. It's good for things like this which
				don't have any reason to have a return, as there's no chips/mult/whatever, but
				there is still an effect that you should notify a player about, creating a duplicate.
					
				I recommend looking at the function itself in common_events.lua to see what all you can give it,
				but, this one is saying, on the joker, 'card', send a custom effect, 'extra', nil, nil, nil, 'the effect has this information',
				and that last one is a table, surrounded by {}, and can contain stuff like the message itself and the colour and other various things.]]
			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
				{ message = localize('k_duplicated_ex') })
		end
	end
}








SMODS.Back{
    name = "Asestatos",
    key = "aces",
    pos = {x = 1, y = 0},
    config = {only_one_rank = '14'},
    loc_txt = {
        name ="Asestatos",
        text={
            "Inicia con solo",
            "{C:attention}Aces{}",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    assert(SMODS.change_base(card, Spades, self.config.only_one_rank))
                end
                return true
            end
        }))
    end
}


  
----------------------------------------------
------------MOD CODE END----------------------
    

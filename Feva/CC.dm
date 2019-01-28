mob
	var
		Stunned
		StunImmune
		Slow=0
		Slow_Duration=0

		Bonus_Speed=0
		Speed_Duration=0
	verb
		Hit_Self()
			Stun(usr)
		Shlow()
			Slow(usr)
		RUN()
			Speed(usr)
proc
	Stun(mob/m,amount=5)  // STUN LIES HERE ON THE CC TAB 'CROWD CONTROL' rofl
		if(m.InUBW&&m.MadeOfSwords)
			return
		if(m.Oozaru)
			return
		if(m.StunImmune)
			return
		if(m.Boss)
			return
		if(m.HitBy["Battle_Ready"])
			amount*=2
		var/Stun_Amount=world.time+(amount*10)
		if(m.Stunned)
			if(m.Stunned<Stun_Amount)
				m.Stunned=Stun_Amount
		else
			m.Stunned=world.time+(amount*10)
			m.overlays+=/obj/Effects/Stun
	StunCheck(mob/mob)
		if(mob.Stunned)
			if(mob.Stunned<world.time)
				mob.overlays-=/obj/Effects/Stun
				mob.Stunned=0
				mob.StunImmune=world.time+30
			else
				return 1
	BeliefRequest(mob/m,amount=5)
		var/Belief_Amount=world.time+(amount*10)
		if(m.BeliefRequest)
			if(m.BeliefRequest<Belief_Amount)
				m.BeliefRequest=Belief_Amount
		else
			m.BeliefRequest=world.time+(amount*10)
	BeliefCheck(mob/mob)
		if(mob.Stunned)
			if(mob.Stunned<world.time)
				mob.BeliefRequest=0
			else
				return 1
	StunImmuneCheck(mob/mob)
		if(mob.StunImmune)
			if(mob.StunImmune<world.time)
				mob.StunImmune=0
			else
				return 1
	Slow(mob/m,amount=5,Str=50)
		if(m.InUBW&&m.MadeOfSwords)
			return
		if(m.Boss)
			return
		if(m.Slow_Duration)
			if(m.Slow_Duration<amount)
				m.Slow=Str
				m.Slow_Duration=world.time+(amount*10)
		else
			m.Slow_Duration=world.time+(amount*10)
			m.Slow=Str

	SlowCheck(mob/mob)
		if(mob.Slow_Duration)
			if(mob.Slow_Duration<world.time)
				mob.Slow_Duration=0
				mob.Slow=0
				/*if(mob.QuicksilverFrozen)
					for(var/mob/B in world)
						animate(B.client, color = null, time = 1)
						if(B.Quicksilver)
							B.Quicksilver=0
					mob.QuicksilverFrozen=0
					if(mob.QuicksilverDamage)
						KenShockwave(mob,Size=mob.QuicksilverDamage/5)
						KenShockwave(mob,Size=mob.QuicksilverDamage/5)
						KenShockwave(mob,Size=mob.QuicksilverDamage/5)
						mob.Health-=mob.QuicksilverDamage
						mob.QuicksilverDamage=0
						mob.OMessage(20,"Time catches up to [src]!")*/
			else
				return 1
	Speed(mob/m,amount=0.25,Str=4)
		m.Bonus_Speed=Str

	SpeedCheck(mob/mob)
		if(mob.Bonus_Speed)
			mob.Bonus_Speed*=0.95
			if(round(mob.Bonus_Speed)<1)
				mob.Bonus_Speed=0
	Move_Speed(mob/mob)
		var/Move_Speed=initial(mob.step_size)
		if(mob.Bonus_Speed)
			Move_Speed=Move_Speed*mob.Bonus_Speed
		if(mob.Flying)
			Move_Speed=Move_Speed*2
		if(mob.Slow)
			Move_Speed=Move_Speed-(Move_Speed*(mob.Slow/100))
		Move_Speed=round(Move_Speed)
		if(Move_Speed<1)
			Move_Speed=1
		if(Move_Speed>18)
			Move_Speed=18

		mob.step_size=Move_Speed
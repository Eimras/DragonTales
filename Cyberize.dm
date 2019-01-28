obj/Skills

	Overdrive
		Teachable=0
		Level=0
		var/oldicon
		desc="Greatly increases your cyberization power for a limited period of time. However, after the period ends, you lose your Cyberization power."
		verb/Overdrive()
			set category="Skills"
			usr.BuffX("Overdrive",src)
			sleep(10)
	Ripper
		Teachable=0
		Level=0
		desc = "Teach them why they should not mess with 'Jack the Ripper'!"
		verb/Ripper_Mode()
			set category="Skills"
			usr.BuffX("Ripper", src)
	BladeMode
		Cooldown=120
		Teachable=0
		Level=0
		desc="Accelerate your perception and movements."
		verb/Blade_Mode()
			set category="Skills"
			usr.BuffX("BladeMode", src)
	LimitBreaker
		Teachable=0
		Level=0
		var/oldicon
		desc="Increases your power for a random time temporarily, renders the user unconscious on deactivation."
		verb/LimitBreaker()
			set category="Skills"
			set name="Limit Breaker"
			usr.SkillX("LimitBreaker",src)
			sleep(10)


	ToggleInternalScouter
		Teachable=0
		Level=0
		desc="Toggles your Internal Scouter settings."
		verb/ToggleScouter()
			set category="Other"
			set name="Toggle Internal Scouter"
			if(usr.InternalScouter==1)
				usr.InternalScouter=0
				usr<<"You deactivate your Internal Scouter."
			else if(usr.InternalScouter==0)
				usr.InternalScouter=1
				usr<<"You activate your Internal Scouter."

	InternalCommunicator
		Teachable=0
		Level=0
		var/ICFrequency=9999
		var/MonitoringFrequency=0
		desc="A internal communicator. Broadcasts on Scouter frequencies. It can also monitor a frequency you are not actively broadcasting on."
		verb/CommunicatorTransmit(A as text)
			set category="Other"
			set name="Communicator Transmit"
			for(var/mob/Players/M in world)
				for(var/obj/Items/Tech/Scouter/Q in M)
					if(Q.Frequency==src.ICFrequency)
						M<<"<font color=green><b>(Scouter)</b> [usr.name]: [html_encode(A)]"
						Log(M.ChatLog(),"<font color=green>(Scouter)[usr]([usr.key]) says: [html_encode(A)]")
				for(var/obj/Skills/InternalCommunicator/B in M)
					if(B.ICFrequency==src.ICFrequency)
						M<<"<font color=green><b>(Internal Comms (Freq: [src.ICFrequency])):</b> [usr.name]: [html_encode(A)]"
						Log(M.ChatLog(),"<font color=green>(Internal Comms (Freq: [src.ICFrequency]))[usr]([usr.key]): [html_encode(A)]")
					if(B.MonitoringFrequency==src.ICFrequency)
						M<<"<font color=green><b>(Internal Comms (Monitor Freq: [src.MonitoringFrequency])):</b> [usr.name]: [html_encode(A)]"
			for(var/obj/Items/Tech/Speaker/X in world)
				if(X.Frequency==src.ICFrequency&&X.Active==1)
					for(var/mob/Y in hearers(X.AudioRange,X))
						Y<<"<font color=green><b>([X.name])</b> [usr.name]: [html_encode(A)]"
						Log(Y.ChatLog(),"<font color=green>([X.name])[usr]([usr.key]): [html_encode(A)]")
		verb/ICFrequency()
			set category="Other"
			set name="Communicator Frequency"
			src.ICFrequency=input(usr,"Change your Internal Communicator frequency to what?","Frequency")as num
		verb/MonitorFrequency()
			set category="Other"
			set name="Monitoring Frequency"
			src.MonitoringFrequency=input(usr,"Change your Internal Communicator Monitoring frequency to what?","Monitoring Frequency")as num

obj/Skills/NMAndroids
//Start of Juggernaut abilities
	JuggernautMode
		Teachable=0
		Level=0
		desc="You activate your Juggernaut Module, entering Juggernaut Mode. A portion of attack damage is redirected into your Energy!"
		verb/JuggernautMode()
			set category="Skills"
			if(usr.TurtleCannonMode==1)
				usr<<"You can't use this at the same time as Turtle Cannon Mode, that would be too silly."
				return
			if(usr.JuggernautMode==0)
				usr<<"Activating Juggernaut Mode. Deploying Absorbtion Shielding."
				usr.JuggernautMode=1
			else if(usr.JuggernautMode==1)
				usr<<"Deactivating Juggernaut Mode. Contracting Shielding."
				usr.JuggernautMode=0

	HeavyDrain
		Teachable=0
		Level=0
		Cooldown=100
		desc="A hard hitting blow that can damage ones ability to store energy briefly."
		verb/HeavyDrain()
			set category="Skills"
			usr.SkillX("HeavyDrain",src)
//Start of Hunter abilities
	TacticalCloak
		Teachable=0
		Level=0
		Cooldown=50
		desc="A potent personal cloak, designed to limit thermal emissions. It doesn't allow you to see other cloaked entities, but they cannot see you either. There is a cooldown upon deactivation that cannot be avoided if you take a chance to strike while hidden, and a small one if you willingly decloak."
		verb/TacticalCloak()
			set category="Skills"
			if(usr.invisibility)
				usr.invisibility=0
				usr<<"You deactivate your tactical cloak."
				src.Cooldown()
			else
				usr.invisibility=200
				usr<<"You activate your tactical cloak."

	HunterMode
		Teachable=0
		Level=0
		desc="High end thermal imaging scanners reveal even those using high end cloaking units."
		verb/HunterMode()
			set category="Skills"
			if(usr.see_invisible)
				usr.see_invisible=0
				usr<<"You deactivate your thermal imagers."
			else
				usr.see_invisible=201
				usr<<"You activate thermal imaging."

//Start of Slayer abilities
	SwordsmanServomotors
		Teachable=0
		Level=0
		desc="Activates your swordfighting specific servomotors, increasing offense and speed at the expense of endurence."
		verb/SwordsmanServomotors()
			set category="Skills"
			usr.BuffX("SwordsmanServomotors",src)


mob
	var
		ThunderHands=0
obj/Skills/Feva
	ThunderHands
		Cooldown=120
		desc="Zappity zap counterpart of Burning Finger, you'll damage an enemy you grab by using your Force to damage them."
		verb/ThunderHands()
			set category="Skills"
			if(src.Using||usr.Attacking)return
			src.Using=1
			usr.ThunderHands=1
			usr.OMessage(10,"[usr]'s hand is shining brightly!","<font color=red>[usr]([usr.key]) used ThunderHands.")
			sleep(100)
			usr.ThunderHands=0
			Cooldown()
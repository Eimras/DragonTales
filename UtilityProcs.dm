proc
	GetListOfPlayers()
		var/list/players = new
		for( var/mob/M in world )
			if( M.client ) players += M
		return players

	GetListOfSpawns()
		var/list/spawn_list = new
		for(var/obj/Special/SpawnPoint/S in world) spawn_list += S
		return spawn_list



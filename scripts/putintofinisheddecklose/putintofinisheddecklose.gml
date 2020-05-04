 time_delay --;

if(time_delay <= 0){
		while (ds_list_size(global.pickdeck) > 0) {
			var sortcard = global.pickdeck[| 0];
			sortcard.face_up = true;
			ds_list_add(global.myfinishedDeck,sortcard);
			ds_list_delete(global.pickdeck,0);
			sortcard.target_y = 128;
			sortcard.target_x = sortcard.face_index * 128;
			sortcard.target_depth = 0- ds_list_size(global.myfinishedDeck);
			audio_play_sound(snd_win,100,0);
			time_delay = 20;
			sortcard.alarm[0] = 10;
	}
		time_delay = 100;	
}

	
	if(ds_list_size(global.pickdeck) = 0){	
		if(ds_list_size(global.board) = 0){
			global.game_state = states.returntodeck;
		}	else{global.chosen_card1 = noone;
				global.chosen_card2 = noone;
				global.game_state = states.play;
		}
	}
	

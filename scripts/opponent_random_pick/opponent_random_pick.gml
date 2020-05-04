if(ds_list_size(global.pickdeck) == 0 && time_delay <=0){
		var oppfirstnumber;
		oppfirstnumber = irandom_range(0,ds_list_size(global.board)-1);
		global.chosen_card1 = global.board[|oppfirstnumber];
		global.chosen_card1.face_up = true;
		global.chosen_card1.target_x = room_width/2;
		global.chosen_card1.target_y = room_height/2;
		audio_play_sound(snd_cardflip,100,0);
		ds_list_add(global.pickdeck,global.chosen_card1);
		ds_list_delete(global.board,oppfirstnumber);
		time_delay = 30;
	} else if(ds_list_size(global.pickdeck) == 1 && time_delay <=0){
		var oppsecondnumber;
		oppsecondnumber = irandom_range(0,ds_list_size(global.board)-1)
		global.chosen_card2 = global.board[|oppsecondnumber];
		global.chosen_card2.face_up = true;
		global.chosen_card2.target_x = room_width/2;
		global.chosen_card2.target_y = room_height/2;
		audio_play_sound(snd_cardflip,100,0)
		ds_list_add(global.pickdeck,global.chosen_card2);
		ds_list_delete(global.board,oppsecondnumber);
		time_delay = 30;
	} else if(ds_list_size(global.board)==0) {
		global.game_state=states.returntodeck;
	} else {
		if(time_delay <=0){
		global.game_state = states.oppevaluate;
		}
	}
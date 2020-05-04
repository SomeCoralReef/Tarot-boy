 /// @description Insert description here
// You can write your code in this editor


switch(global.game_state){


case states.deal: 
	
	time_delay--;
	if(time_delay <=0){ 
		global.myscore= 0;
		global.oppscore = 0;
		var cards_on_board = ds_list_size(global.board);
		if(cards_on_board < 44 && ds_list_size(global.deck) > 0) {
			var dealt_card = global.deck[|ds_list_size(global.deck) -1];
			ds_list_add(global.board,dealt_card);
			ds_list_delete(global.deck,ds_list_size(global.deck) -1);			
			
			var tries = 0;
			var buff_x = (dealt_card.sprite_width / 2);
			var buff_y = (dealt_card.sprite_height*1.5);
			var w = dealt_card.sprite_width * .67;
			var h = dealt_card.sprite_height * .67;
			var next_x = random_range(buff_x,room_width-buff_x);
			var next_y = random_range(buff_y,room_height-buff_y);
			while (check_card_placement(next_x, next_y, w, h) != -1 && tries < 30000) {
				next_x = random_range(buff_x,room_width-buff_x);
				next_y = random_range(buff_y,room_height-buff_y);
				tries += 1;
			}
			
			show_debug_message("failed to place: " + string(tries) + " times");
			
			dealt_card.target_x = next_x;
			dealt_card.defaultx = dealt_card.target_x;
			dealt_card.target_y = next_y;
			dealt_card.defaulty = dealt_card.target_y;
			ds_list_add(global.card_pos_x, dealt_card.target_x);
			ds_list_add(global.card_pos_y, dealt_card.target_y);
			
			audio_play_sound(snd_cardflip,100,0);
			time_delay = .2*room_speed;  
		}else if(cards_on_board == 44) {
			global.game_state = states.play;
			time_delay = 30;
		}else{ 
			time_delay = 10;
			global.game_state = states.returntodeck;
					
		}
	}
			break;
 
case states.play:
	//global.cards_in_hand = ds_list_size(global.myhand);
	//global.cards_in_opphand = ds_list_size(global.opphand);
	
	
	if(position_meeting(mouse_x,mouse_y,global.selected_card)){
		show_debug_message(string(ds_list_size(global.hovered_cards)));
		var i;
		for(i=0;i<ds_list_size(global.board);i++){	
			if(global.selected_card == ds_list_find_value(global.board, i)){
				var depth_to_beat = 99999; // this should get beaten by any card
					for (var i = 0; i < ds_list_size(global.hovered_cards); i++) {
						var card = global.hovered_cards[|i];
							if (card.depth > depth_to_beat) {
								if (global.selected_card != noone) {
									global.selected_card.depth = default_depth;	
								}
								depth_to_beat = card.depth; // important that this is current depth so that we "hold onto" cards that we've pushed to the front (also important that we set this before pushing to the front)
								card.depth = -1000; // push it to the front
								global.selected_card = card
							}
					}

			} else if (global.selected_card == ds_list_find_value(global.myfinishedDeck,i)){
				checkeffect();
			}
		}

	} else if (global.selected_card == noone){
		var i;
		for(i=0;i<ds_list_size(global.board);i++){
			var stopcard = global.board[|i];
			stopcard.image_speed = 0;
			stopcard.image_index = 0;
			stopcard.target_depth = stopcard.default_depth;       
			var stopeffectlable;
			stopeffectlable = global.effectslables[| i];
			instance_destroy(obj_effect_lable);
			ds_list_delete(global.effectslables, 0);
			
	} 
	}
	
		 
	if(mouse_check_button_pressed(mb_left)){
		for(i=0;i<ds_list_size(global.board);i++){
			if(global.selected_card != noone && global.selected_card == 
				ds_list_find_value(global.board,i)){
				global.selected_card.face_up = true;
				global.selected_card.target_x = room_width/2;
				global.selected_card.target_y = room_width/2;
				audio_play_sound(snd_cardflip,100,0);
				if(ds_list_size(global.pickdeck) == 0){
					global.chosen_card1 = global.selected_card;
					global.chosen_card1.seen = true;
					ds_list_add(global.pickdeck,global.chosen_card1);
					ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card1));
			} else if(ds_list_size(global.pickdeck) == 1){
				global.chosen_card2 = global.selected_card
				global.chosen_card2.seen = true;
				ds_list_add(global.pickdeck,global.chosen_card2)
				ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card1));
				global.game_state = states.myevaluate;	
				time_delay = 30;
			} else if(ds_list_size(global.board)){
				global.game_state = states.returntodeck;
			}
			}
		}
	}
 	break;
				
case states.myevaluate: 
	global.selected_card = noone;
	time_delay--;
	if(time_delay <=0){
	if(global.chosen_card1.face_index == global.chosen_card2.face_index){
		ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card1));
		ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card2));
		global.game_state = states.win
	} else {
		while(ds_list_size(global.pickdeck)>=1){
			card_to_return = global.pickdeck[|0];
			card_to_return.target_y = card_to_return.defaulty;
			card_to_return.target_x = card_to_return.defaultx;
			ds_list_add(global.board,card_to_return);
			ds_list_delete(global.pickdeck,0);
		}	
	//global.chosen_card1.face_up = false;
	//global.chosen_card2.face_up = false;
	global.chosen_card1 = noone;
	global.chosen_card2 = noone;
	global.game_state = states.theyplay;
	} 
	}
	break;
			
case states.theyplay:
	
	time_delay--;
	for (i=0; i < ds_list_size(global.seen_list); i++) {
	var card_to_find1 = global.seen_list[i];
		for (j=0; j < ds_list_size(global.seen_list); j++) {
			var card_to_find2 = global.seen_list[j];
		if (card_to_find1.face_index == card_to_find2.face_index) {
			if (i != j) {	
					global.chosen_card1 = card_to_find1;
					global.chosen_card1.face_up = true;
					global.chosen_card1.target_x = room_width/2;
					global.chosen_card1.target_y = room_height/2;
					ds_list_add(global.pickdeck, global.chosen_card1);
					ds_list_delete(global.board,ds_list_find_value(global.board,global.chosen_card1));
					global.chosen_card2 = card_to_find2;
					global.chosen_card2.face_up = true;
					global.chosen_card2.target_x = room_width/2;
					global.chosen_card2.target_y = room_height/2;
					ds_list_add(global.pickdeck, global.chosen_card2);
					ds_list_delete(global.board,ds_list_find_value(global.board,global.chosen_card2));
				} 
			} else{
				show_debug_message("hi");
				opponent_random_pick();
			}
		}
	}
	
	
	
	
			break;
		
	case states.oppevaluate:
	
	global.selected_card = noone;
		if(global.chosen_card1.face_index == global.chosen_card2.face_index){
			ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card1));
			ds_list_delete(global.board,ds_list_find_index(global.board,global.chosen_card2));
			global.game_state = states.lose;
		} else {
			while(ds_list_size(global.pickdeck)>= 1){
				card_to_return = global.pickdeck[|0]
				card_to_return.target_y = card_to_return.defaulty;
				card_to_return.target_x = card_to_return.defaultx;
				ds_list_add(global.board,card_to_return);
				ds_list_delete(global.pickdeck,0);
		}	
	//	global.chosen_card1.face_up = false;
	//	global.chosen_card2.face_up = false;
		global.chosen_card1 = noone;
		global.chosen_card2 = noone;

		global.game_state = states.play;
		}
			
			break;
				
	
	
	case states.win:
	
	putintofinisheddeckwin();

	
	break;
	
	
	case states.lose:
	
	putintofinisheddecklose();
		
	
	break;
	


	
	
	case states.returntodeck:
		time_delay--;
		if(time_delay == 0){
			var cardsinoppfinisheddeck = ds_list_size(global.oppfinishedDeck);
			var cardsinmyfinisheddeck = ds_list_size(global.myfinishedDeck);
			if(cardsinoppfinisheddeck > 0){
				var card_to_return = global.oppfinishedDeck[|0];
				card_to_return.target_x = x;
				card_to_return.target_y = y;
				card_to_return.target_depth = ds_list_size(global.deck);
				audio_play_sound(snd_cardflip,100,0);
				time_delay = 5;
				ds_list_add(global.deck,card_to_return);
				ds_list_delete(global.oppfinishedDeck,0);
			} else if (cardsinoppfinisheddeck==0 && cardsinmyfinisheddeck >0){
				var card_to_return = global.myfinishedDeck[|0];
				card_to_return.target_x = x;
				card_to_return.target_y = y;
				card_to_return.target_depth = ds_list_size(global.deck);
				audio_play_sound(snd_cardflip,100,0);
				ds_list_add(global.deck,card_to_return);
				ds_list_delete(global.myfinishedDeck,0);
			} else if (cardsinoppfinisheddeck==0 && cardsinmyfinisheddeck ==0){
				ds_list_shuffle(global.deck)
			}
			global.game_state = states.deal;
		}
	
	break;
	
	
		case states.reshuffle:
		
		
			time_delay = 50;
		global.game_state = states.deal;
		break; 
	 


	}


var i;
for(i=0;i<ds_list_size(global.myfinishedDeck);i++){
	var stopanim = global.myfinishedDeck[|i ];
	stopanim.image_speed = 0;
	stopanim.image_index = 0;
}



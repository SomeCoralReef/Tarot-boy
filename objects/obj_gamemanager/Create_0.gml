 /// @description Insert description here
// You can write your code in this editor
randomize();

global.num_cards = 44;
global.deck = ds_list_create();
global.board = ds_list_create();
global.pickdeck = ds_list_create();
global.myfinishedDeck = ds_list_create();
global.oppfinishedDeck = ds_list_create();
global.particle1 = ds_list_create();
global.particle2 = ds_list_create();
global.hovered_cards = ds_list_create();
global.seen_list = ds_list_create();

global.effectslables = ds_list_create();

global.card_pos_x = ds_list_create();
global.card_pos_y = ds_list_create();


global.myscore = 0;
global.oppscore = 0;


global.selected_card = noone;
global.chosen_card1 = noone;
global.chosen_card2 = noone;

enum states { 
	deal,
	reshuffle,
	play,
	win,
	lose,
	returntodeck,
	myevaluate,
	oppevaluate,
	theyplay,
}
global.game_state = states.deal;

var newcard = noone;
for(var i = 0; i < global.num_cards ; i++){
	newcard = instance_create_layer(x,room_height/2,"instances",obj_card);
	newcard.face_up = true;
	newcard.face_index = floor(22*i / global.num_cards); 
	ds_list_add(global.deck,newcard);
}

ds_list_shuffle(global.deck);

for (var i = 0; i < global.num_cards; i++){
	global.deck[| i].x = x;
	global.deck[| i].y = room_height/2-2*i;
	global.deck[| i].target_x = global.deck[| i].x;
	global.deck[| i].target_y = global.deck[| i].y;
	global.deck[| i].target_depth = global.num_cards - i;
	global.deck[| i].default_depth  = global.deck[|i ].target_depth;
}
 


time_delay = 100;

particlesgo = false;
particle_redirect_timer = 100;
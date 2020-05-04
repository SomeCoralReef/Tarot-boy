/// @description Insert description here
// You can write your code in this editor
if (target_x != x) {
	x = lerp(x, target_x, 0.1);	
}

if (target_y != y) {
	y = lerp(y, target_y, 0.1);
}

if (target_depth != depth) {
	depth = target_depth;	
}


	if (position_meeting(mouse_x, mouse_y, id)) {
		global.selected_card = id;
		ds_list_add(global.hovered_cards, id);
	} else if (global.selected_card == id) {
		for(var i =0;i<ds_list_size(global.hovered_cards);i++){
		var idx = ds_list_find_index(global.hovered_cards, i);
		ds_list_delete(global.hovered_cards, idx);
			global.selected_card = noone;
		}
	}


var pos_x = argument0;
var pos_y = argument1;
var width = argument2;
var height = argument3;

var collision_index = -1;

for (var i = 0; i < ds_list_size(global.card_pos_x); i++) {
	var check_x = global.card_pos_x[|i];
	var check_y = global.card_pos_y[|i];
	if (pos_x > check_x - width && 
	    pos_x < check_x + width && 
		pos_y > check_y - height && 
		pos_y < check_y + height) {
		  collision_index = i;
	}
	
	if (collision_index != -1) {
		//show_debug_message("failed: " + string(pos_x) + "," +string(pos_y) + " vs " + string(check_x) + "," +string(check_y));
		break;	
	}
}

return collision_index;
/// @description Insert description here
// You can write your code in this editor
draw_set_font(font0);


draw_set_halign(fa_left);
draw_text_transformed_colour(room_width-800,300,global.opphealth,3,3,0,c_red,c_red,c_white,c_white,1);


// draw text for player 2 being gone
draw_set_halign(fa_left);
draw_text_transformed_colour(200,room_height-300,global.myhealth,3,3,0,c_blue,c_blue,c_white,c_white,1);
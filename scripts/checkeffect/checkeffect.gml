if(global.selected_card.face_index == 3){
	if(instance_exists(obj_effect_lable)){
		instance_destroy(obj_effect_lable)
	}
	if(ds_list_size(global.effectslables > 0)){
		ds_list_delete(global.effectslables,0);
	}
	global.effect3label = instance_create_layer(global.selected_card.x,global.selected_card.y-128,"effects",obj_effect_lable);
	obj_effect_lable.sprite_index = spr_3_effect;
	obj_effect_lable.target_depth = -4000;
	ds_list_add (global.effectslables, obj_effect_lable);
} else if (global.selected_card.face_index == 4){
	if(instance_exists(obj_effect_lable)){
		instance_destroy(obj_effect_lable)
	}
	if(ds_list_size(global.effectslables > 0)){
		ds_list_delete(global.effectslables,0);
	}
	global.effect4label = instance_create_layer(global.selected_card.x,global.selected_card.y-128,"effects",obj_effect_lable);
	obj_effect_lable.sprite_index = spr_4_effect;
	obj_effect_lable.target_depth = -4000;
	ds_list_add (global.effectslables, obj_effect_lable);
}
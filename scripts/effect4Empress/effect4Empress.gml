var i; 
for(i=0;i<ds_list_size(global.board);i++){
	var checkingcard = global.board[| i];
	if(checkingcard.face_index = 3){
		checkingcard.face_up = false;
		checkingcard.alarm[0] = 50;
		break;
	}
}
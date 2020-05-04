var i; 
for(i=0;i<ds_list_size(global.board);i++){
	var checkingcard = global.board[| i];
	if(checkingcard.face_index = 5){
		checkingcard.face_up = true;
		break;
	}
}
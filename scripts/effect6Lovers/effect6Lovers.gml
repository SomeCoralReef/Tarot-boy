var i;
for(i = 0; i< ds_list_size(global.board);i++){
	var shufflecard = global.board[|i];
		if(instance_exists(shufflecard)){
			if(shufflecard.face_index == 0 || 
				shufflecard.face_index==2 ||
				shufflecard.face_index==4||
				shufflecard.face_index==6||
				shufflecard.face_index==8||
				shufflecard.face_index==10||
				shufflecard.face_index==12||
				shufflecard.face_index==14||
				shufflecard.face_index==16||
				shufflecard.face_index==18||
				shufflecard.face_index==20){
				shufflecard.target_x = irandom_range(128,room_width-128);
				randomize();
			}
		}
}
			
var i;
for(i=0;i<ds_list_size(global.board);i++){
	var shufflecard = global.board[|i];
	shufflecard.target_x = irandom_range(128,room_width-128);
	randomize();

}
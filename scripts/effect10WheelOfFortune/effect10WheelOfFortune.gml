wheelrandomzier = irandom_range(0,1);
if(wheelrandomzier == 1){
	var oppsethealth = global.opphealth;
	if(global.opphealth > oppsethealth - 5){
		global.opphealth--;
	}
}else if (wheelrandomzier == 0){
	var mysethealth = global.myhealth;
	if(global.myhealth > mysethealth - 5){
		global.myhealth--;
	}
}
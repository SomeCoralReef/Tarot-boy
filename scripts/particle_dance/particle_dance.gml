			var i;
			for(i=0;i<30;i++){
				global.particle1[|i] = instance_create_layer(global.chosen_card1.x,global.chosen_card1.y,"smarticles",obj_particle);
				global.particle1[|i].image_angle = i*30;
				global.particle1[|i].speed = obj_particle.gospeed;
				global.particle2[|i] = instance_create_layer(global.chosen_card2.x,global.chosen_card2.y,"smarticles",obj_particle);
				global.particle2[|i].image_angle = i*30;
				global.particle2[|i].speed = obj_particle.gospeed;
			}
			particle_redirect_timer --;
			if(particle_redirect_timer == 0){
				var i;
				for(i=0;i<30;i++){
					global.particle1[|i].target_x = global.particle2[|i];
					global.particle1[|i].target_y = global.particle2[|i];
					global.particle2[|i].target_x = global.particle1[|i];
					global.particle2[|i].target_y = global.particle2[|i];
					particle_redirect_timer =100;
				}
			}
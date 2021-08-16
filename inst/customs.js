const {main,fish,reframe,cleanup,draw_svg,str_to_seed} = require('./fishdraw.js');
const fs = require('fs');
let my_params = {
body_curve_type:0,
body_curve_amount:0.85,
body_length:420,
body_height:90,
scale_type:1,
scale_scale:1,
pattern_type:3,
pattern_scale:1,
dorsal_texture_type:1,
dorsal_type:0,
dorsal_length:100,
dorsal_start:8,
dorsal_end:27,
wing_texture_type:0,
wing_type:0,
wing_start:6,
wing_end:6,
wing_y:0.7,
wing_length:130,
wing_width:10,
pelvic_start:9,
pelvic_end:14,
pelvic_length:85,
pelvic_type:0,
pelvic_texture_type:0,
anal_start:19,
anal_end:29,
anal_length:50,
anal_type:0,
anal_texture_type:0,
tail_type:0,
tail_length:75,
finlet_type:0,
neck_type:0,
nose_height:0,
mouth_size:8,
head_length:30,
head_texture_amount:60,
has_moustache:1,
moustache_length:10,
has_beard:0,
has_teeth:1,
teeth_length:8,
teeth_space:3.5,
beard_length:30,
eye_type:0,
eye_size:10,
jaw_size:1,
jaw_open:1,
};

let polylines = fish(my_params); 

if (require.main === module) { 

    let seed = undefined; 

    let format = 'svg'; 

    for (let i = 2; i < process.argv.length; i++){ 

      let a = process.argv[i]; 

      if (a == '--seed'){

        seed = process.argv[i+1];

      }else if (a == '--format'){

        format = process.argv[i+1];

      }

    }

    let polylines = main(seed);

    if (format == 'svg'){

      console.log(draw_svg(polylines));

    }else if (format == 'json'){

      console.log(JSON.stringify(polylines));

    }else if (format == 'smil'){

      console.log(draw_svg_anim(polylines));

    }else if (format == 'csv'){

      console.log(polylines.map(x=>x.flat().join(',')).join('\n'));

    }

  }

          

/// @description THE BEAT
// You can write your code in this editor

giveBeatBonus = true
switch(currentCount) {
	case countsPerMeasure:
		image_xscale = image_xscale * 1.65;
		image_yscale = image_yscale * 1.65;
		currentCount = 1
	break;
	default:
		image_xscale = image_xscale * 1.15;
		image_yscale = image_yscale * 1.15;
		currentCount += 1;
	break;
}

alarm_set(1, windDown);
alarm_set(0, beat);

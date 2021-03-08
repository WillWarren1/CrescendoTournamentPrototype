/// @description Insert description here
// You can write your code in this editor
if (obj_stage_manager.BPM > 0) {
	beat = round((room_speed * 60) div obj_stage_manager.BPM);
	countsPerMeasure = 4;
	currentCount = 1;
	windDown = round(beat div 2);
	giveBeatBonus = false;
	alarm_set(0, beat);
}

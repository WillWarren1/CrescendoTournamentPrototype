function Speed_Fraction() {
	/* Only to be used by player objects! */
	//Add in fractions
	hsp += hsp_frac;
	vsp += vsp_frac;
	//Re-calculate fractions
	hsp_frac = (hsp - (floor(abs(hsp)) * sign(hsp)));
	vsp_frac = (vsp - (floor(abs(vsp)) * sign(vsp)));
	//Get rid of fractions
	hsp -= hsp_frac;
	vsp -= vsp_frac;
	hsp = floor(hsp);
	vsp = floor(vsp);


}

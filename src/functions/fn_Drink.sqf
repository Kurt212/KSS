/*
	File: fn_Drink
	Exec: KSS_fnc_progressBar
	Author: Kurt
	Arguments :
		0 - (SCALAR) water
*/

KSS_thirst = KSS_thirst + (_this select 0);
KSS_thirst = KSS_thirst min 100;

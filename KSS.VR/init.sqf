TF_give_personal_radio_to_regular_soldier=true;
TF_give_microdagr_to_soldier=false;
tf_no_auto_long_range_radio=true;
tf_same_sw_frequencies_for_side = true;

waitUntil {
  !isNil "KSS_usableItems"
};

{
	box addItemCargoGlobal [_x, 10];
}forEach KSS_usableItems;

[] call KSS_fnc_drawDefaultHud;

box addAction [
	"<t color = '#FF0000'>Голод на 10",
	{
		KSS_hunger = 10;
	}
];

box addAction [
	"<t color = '#FF0000'>Голод на 30",
	{
		KSS_hunger = 30;
	}
];

box addAction [
	"<t color = '#FF0000'>Голод на 50",
	{
		KSS_hunger = 50;
	}
];

box addAction [
	"<t color = '#FF0000'>Голод на 80",
	{
		KSS_hunger = 80;
	}
];

box addAction [
	"<t color = '#FF0000'>Жажду на 10",
	{
		KSS_thirst = 10;
	}
];

box addAction [
	"<t color = '#FF0000'>Жажду на 30",
	{
		KSS_thirst = 30;
	}
];

box addAction [
	"<t color = '#FF0000'>Жажду на 50",
	{
		KSS_thirst = 50;
	}
];

box addAction [
	"<t color = '#FF0000'>Жажду на 80",
	{
		KSS_thirst = 80;
	}
];
class KSS_HUD_0
{
	idd = 2100;
	
	duration = 60*60*24;

	onLoad = "uiNamespace setVariable ['RSS_HUD_0', _this select 0]";
	class controls
	{
		class Text_Hunger : RscText
		{
			idc = 2110;
			x = "0.00125001 * safezoneW + safezoneX";
			y = "0.822 * safezoneH + safezoneY";
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Text_Thirst : RscText
		{
			idc = 2120;
			x = "0.00125001 * safezoneW + safezoneX";
			y = "0.906 * safezoneH + safezoneY";
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
	};
};
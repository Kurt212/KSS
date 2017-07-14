#define true 1
#define false 0

class KSS_ProgressBar_Dialog
{
    idd = 21999;
    movingEnable = false;
    enableSimulation = true;

    onLoad = "uiNamespace setVariable ['KSS_ProgressBar', _this select 0]";
    onUnload = "";

    class Controls
    {
        class Progress: RscProgress
        {
            idc = 1600;

            colorFrame[] = {0,0,0,1};

            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };

        class Progress_Title: RscText
        {
            idc = 1000;
            style = ST_CENTER;
            text = "";
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
    };
};

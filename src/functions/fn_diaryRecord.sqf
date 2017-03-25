/*
    File: fn_diaryRecord
    Exec: KSS_fnc_init
    Author: Kurt
    Arguments :
        Null
*/

#define ADD _txt = _txt + 
#define BR _txt = _txt + "<br />"

private _txt = "";

ADD (format ["<font size=26 color='#c78600'>%1</font>", localize("STR_KSS_moduleName")]);
BR;
ADD (format ["<font color='#ff0000'>Version</font> : %1", getText(configFile / "CfgPatches" / "KSS" / "version")]);
BR;
BR;
ADD ("Settings :");
BR;
ADD (format ["<font color='#ff0000'>%1</font> : %2", localize("STR_KSS_moduleThirstDescription"), KSS_rawDelay_thirst]);
BR;
ADD (format ["<font color='#ff0000'>%1</font> : %2", localize("STR_KSS_moduleHungerDescription"), KSS_rawDelay_hunger]);
BR;
ADD (format ["<font color='#ff0000'>%1</font> : %2", localize("STR_KSS_moduleHUDName"), KSS_drawingHUD]);
BR;

player createDiarySubject ["kss", "KSS"];
player createDiaryRecord ["kss", [localize("STR_KSS_diarytitle"), _txt]];

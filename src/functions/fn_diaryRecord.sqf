#define ADD _txt = _txt + 
#define BR _txt = _txt + "<br />"

private _txt = "";

ADD ("<font size=26 color='#c78600'>Kurt's survival system</font>");
BR;
ADD ("Settings :");
BR;
BR;
ADD (format ["<font color='#ff0000'>%1</font> : %2 min", localize("STR_KSS_diaryThirst"), KSS_rawDelay_thirst]);
BR;
ADD (format ["<font color='#ff0000'>%1</font> : %2 min", localize("STR_KSS_diaryHunger"), KSS_rawDelay_hunger]);
BR;

player createDiaryRecord ["diary", [localize("STR_KSS_diarytitle"), _txt]];

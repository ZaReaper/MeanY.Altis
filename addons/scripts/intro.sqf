sleep 80;

private ["_messages", "_timeout"];

_messages = [
	["MAG", "Mature Anzac Gamers A3Wasteland"],
	["Welcome", (name player)],
	["A3Wasteland", worldName],
	["Earplugs", "Put in your earplugs by using the END key."],
	["Enemy Occupations", "Some towns may have been taken over by enemy squads (Red Zones)."],
	["New Hud", "Set UI scale to small under video options if your missing icons on the bottom bar"],
	["USE AI UNIFORMS", "(Optional) Download Unlocked_Uniforms from armaholics to be able to use all AI uniforms."],
	["REPORT HACKERS", "If you suspect someone of hacking report it to a MAG member"],
	["DONATIONS", "Are very much appreciated, donations can be made at the MAG website. See bottom/top of the map"]
	
];

_timeout = 4;
{
	private ["_title", "_content", "_titleText"];
	uiSleep 2;
	_title = _x select 0;
	_content = _x select 1;
	_titleText = format[("<t font='TahomaB' size='0.40' color='#a81e13' align='left' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='left'>%2</t>"), _title, _content];
	[_titleText,[safezoneX + safezoneW - 0.8,0.50],[safezoneY + safezoneH - 0.8,0.7],_timeout,0.5] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;

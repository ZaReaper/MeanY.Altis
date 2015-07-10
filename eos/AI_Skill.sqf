// INFANTRY SKILL
_InfskillSet = [
0.13,        // aimingAccuracy
0.42,        // aimingShake
0.25,        // aimingSpeed
0.36,         // spotDistance
0.3,        // spotTime
.4,        // courage
1,        // reloadSpeed
.8,        // commanding
.75        // general
];


// ARMOUR SKILL
_ArmSkillSet = [
0.25,        // aimingAccuracy
0.45,        // aimingShake
0.6,        // aimingSpeed
0.6,         // spotDistance
0.4,        // spotTime
.6,        // courage
1,        // reloadSpeed
1,        // commanding
1        // general
];


// LIGHT VEHICLE skill
_LigSkillSet = [
0.15,        // aimingAccuracy
0.45,        // aimingShake
0.2,        // aimingSpeed
0.4,         // spotDistance
0.4,        // spotTime
.5,        // courage
1,        // reloadSpeed
1,        // commanding
1        // general
];


// HELICOPTER SKILL
_AIRskillSet = [
0.25,        // aimingAccuracy
0.45,        // aimingShake
0.6,        // aimingSpeed
0.4,         // spotDistance
0.4,        // spotTime
1,        // courage
1,        // reloadSpeed
1,        // commanding
1        // general
];


// STATIC SKILL
_STAskillSet = [
0.25,        // aimingAccuracy
0.45,        // aimingShake
0.6,        // aimingSpeed
0.4,         // spotDistance
0.4,        // spotTime
1,        // courage
1,        // reloadSpeed
1,        // commanding
1        // general
];

server setvariable ["INFskill",_InfskillSet];
server setvariable ["ARMskill",_ArmSkillSet];
server setvariable ["LIGskill",_LigSkillSet];
server setvariable ["AIRskill",_AIRskillSet];
server setvariable ["STAskill",_STAskillSet];
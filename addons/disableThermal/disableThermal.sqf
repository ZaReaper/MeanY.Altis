
_layer = 85125; 
_exitWaitUntil = false;

waitUntil { 
if (currentVisionMode player == 2) then																		// check for TI Mode
{
	if (daytime <= 19 && daytime > 5)then															// check if player has launcher as current weapon
		{ 																										
            _layer    cutText ["Thermal Imaging OFFLINE until night time!.","BLACK",-1];										// Blackout screen with Text
			playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            _layer cutText ["", "PLAIN"];
		}
	else
		{
	if (alive (getConnectedUAV player)) then																// check if player is connected to a UAV			
	{																											
            _layer cutText ["", "PLAIN"];
	};
};
sleep 1;
_exitWaitUntil
};
};


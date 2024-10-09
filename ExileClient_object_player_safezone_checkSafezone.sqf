if !(ExilePlayerInSafezone) then 
{
	if ((getPosATL (vehicle player)) call ExileClient_util_world_isInTraderZone) then 
	{
		[] call ExileClient_object_player_event_onEnterSafezone; 
	};
	ExileClientPlayerLastSafeZoneCheckAt = diag_tickTime;
	if (ExileClientPlayerIsInfantry) then
	{
		if ((stance player == "PRONE") && (player call ExileClient_object_player_inRuins)) then
		{
			player setPos [((getPos player) select 0) + random 11 max (11 -10),((getPos player) select 1) - random 11 max (11 -10),0.1];
			["WarningTitleOnly", ["You cannot glitch into destroyed buildings, moved you out"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
}
else 
{
	if (diag_tickTime - ExileClientPlayerLastSafeZoneCheckAt >= 30) then
	{
		if !((vehicle player) call ExileClient_util_world_isInTraderZone) then 
		{
			[] call ExileClient_object_player_event_onLeaveSafezone; 
		};
		ExileClientPlayerLastSafeZoneCheckAt = diag_tickTime;
	};
};
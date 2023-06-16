#include common_scripts\utility; 
#include maps\_utility;
#include maps\_zombiemode_utility; 

init()
{
	players = get_players();

	if(players.size == 1)
	{
		players[0] thread setup_players_health();
	}
}

setup_players_health()
{
	self endon( "disconnect" );
	self endon( "death" );

	if(getDvarInt( "cg_drawHealthCount" ) == 1)
	{

		healthtext = newClientHudElem( self );

		healthtext.alignX 		= "center";
		healthtext.alignY 		= "middle";
		healthtext.horzAlign 	= "center";
		healthtext.vertAlign 	= "top";
		healthtext.y 	= 20;
		healthtext.foreground 	= true;
		healthtext.fontScale 	= 1.5;

		healthtext.color = ( 1, 1, 1 );
		healthtext.sort = 1;
	
		while( 1 )
		{
		
			health = self.health;
			healthtext SetText( "Health: " + health );
			//iprintlnbold(level.player_is_speaking);
			wait( 0.1 );
		}
	}
}
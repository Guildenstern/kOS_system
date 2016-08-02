licensed under MIT foo.
Original code from https://github.com/space-is-hard/kOS-Utils 

//=====Chutes Util=====
//by space_is_hard

//List that we'll store all of the parachute parts in
set chuteList to LIST().

//Gets all of the parts on the craft
list PARTS in partList.

//Goes over the part list we just made
for item in partList
{
    //Gets all of the modules of the part we're going over; local variable that gets
    //dumped every time the FOR loop is finished
    local moduleList to item:MODULES.
    
    //Goes over moduleList to find the parachute module
    for module in moduleList
    {
        //Checks the name of the module, and stores the part being gone over if the
        //parachute module shows up
        IF module = "ModuleParachute"
        {
            //Stores the part in the chuteList
            chuteList:ADD(item).
        }.
    }.
}.

FUNCTION chutesUtil
{
    //Determines whether we're in atmosphere, and below 10km, and descending
    if SHIP:ALTITUDE < BODY:ATM:HEIGHT 
        and SHIP:ALTITUDE < 10000
        and SHIP:VERTICALSPEED < -1
    {
        //Goes over the chute list
        for chute in chuteList
        {
            //Checks to see if the chute is already deployed
            if chute:GETMODULE("ModuleParachute"):HASEVENT("Deploy Chute")
            {
                //Checks to see if the chute is safe to deploy
                if chute:GETMODULE("ModuleParachute"):GETFIELD("Safe To Deploy?") = "Safe"
                {
                    //Deploy/arm this chute that has shown up as safe and ready
                    //to deploy
                    chute:GETMODULE("ModuleParachute"):DOACTION("Deploy", TRUE).
                    
                    //Inform the user that we did so
                    HUDTEXT("Chute Utility: Safe to deploy; Arming parachute", 3, 2, 30, YELLOW, FALSE).
                }.
            }.
        }.
    }.
}.

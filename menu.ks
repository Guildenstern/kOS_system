
run lib_menu.


set choice to open_menu("What is your choice?",list("NAVBALL", "exit")).

if choice = "NAVBALL"
{
    run flight_info.
}


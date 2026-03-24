//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"⌨", "sb-kbselect", 0, 30}, */
	{" 󰥔 ", "sb-time",	5,	0},
	{" ", "sb-date",	60,	0},
	{"󰕾 ", "sb-volume",	0,	10},
	{"󰃠 ", "sb-brightness",	5,	11},
	{"󰖩 ", "sb-wifi",	5,	0},
	{"󰁹 ", "sb-battery", 5, 0}, //add status as well
    //write scripts for all, use inotifywait to listen for file writes                                                                    
    /* { run_command, "  󰥔 %s",            "date +'%r'" },
    { run_command, "  |   %s",            "date +'%a-%b-%d'" },
    { run_command, "  |  󰕾 %s",            "amixer get Master | awk -F\"[][]\" '/Left:/ { print $2 }'" },
    { run_command, "  |  󰃠 %s",            "brightnessctl -m | cut -d, -f4" },
    { wifi_perc, "  |  󰖩 %s%%",    "wlan0" },
    { battery_perc, "  |  󰁹 %s%%", "BAT0" },
    { battery_state, " %s",      "BAT0" }, */
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "  |  ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

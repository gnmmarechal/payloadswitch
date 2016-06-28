# Quick Payload Switcher
Quick Payload Switcher for A9LH. It can switch between payloads (to switch between CFWs), and it can rename arm9loaderhax.bin to arm9loaderhax_si.bin and vice-versa. Please Read the documentation below.

##Usage (Payload Switcher)
First, install the CIA using FBI/NASA/DevMenu/whatever.

###If your original payload is named "/arm9loaderhax.bin" or "/arm9loaderhax_si.bin"
1)Name your secondary payload (the one you want to quickswitch) "/arm9loaderhax_switch.bin".
2)Run the app whenever you want to switch, and reboot the console.

###If your original payload is named something else (ex. "/banana.bin")
1)Name your secondary payload (the one you want to quickswitch) "/arm9loaderhax_switch.bin".
2)Create a file named "/payloadswitch-in.cfg" and write the path there (ex. "/banana.bin")
3)Run the app whenever you want to switch, and reboot the console.

###If your secondary payload is named something else (ex. "/somepayload.bin")
1)Create a file named "/payloadswitch-out.cfg" and write the path there (ex. "/somepayload.bin")
2)Use the app.

###To stop the console from rebooting when using this (on v1.1 or later)
Just hold the L button while running it.

###For information about renaming the payloads for screeninit/noscreeninit behaviour, read "Modes"


##Modes

###Mode 1: Normal (normal)
To use this mode (which by default only switches between payloads to boot), simply delete any file named /payloadswitch-mode.cfg , or make sure that file has "normal" written, without the quotes.
While in normal mode, if you want to toggle between noscreeninit/screeninit mode (on an A9LH installation that supports it, like Aurora Wright's latest A9LH, which screeninit/noscreeninit merged and relies on filenames to run in one mode or the other), hold R and X while starting this app. R and X will, just for that one time, use Alternate mode.
If you wish to rename the payload AND switch payloads, hold Y and X instead to use "Mixed" mode.
###Mode 2: Alternate (alternate)
To use this mode (which by default only renames the payload as arm9loaderhax.bin<>arm9loaderhax_si.bin), create a file named /payloadswitch-mode.cfg , and write "alternate" in it, without the quotes.
While in alternate mode, if you want to use Normal mode once (to switch between CFWs), hold R and X while starting the app. If you want to use "Mixed" behaviour, which will switch and rename the payload, hold Y and X instead.
###Mode 3; Mixed (mixed)
Mixed mode is both Normal and Alternate. It will always rename AND switch the payload to boot. To use it, create a file named /payloadswitch-mode.cfg and write "mixed" in it, without the quotes.
While in mixed mode, if you wish to use Normal mode, hold R and X while starting the app.

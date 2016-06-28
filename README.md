# Quick Payload Switcher
Quick Payload Switcher for A9LH.

##Usage
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

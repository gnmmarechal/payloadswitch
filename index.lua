--Quick Payload Switcher for the 3DS (Quick Switch between CFWs)
-- By gnmmarechal
-- http://gs2012.xyz

version = "1.4"
switchmode = 0
--Debug and Tester Stuff
isupdate = 0
debugmode = 0
if isupdate == 0 and debugmode == 1 and System.doesFileExist("/payloadswitch/index.lua") then
	dofile("/payloadswitch/index.lua")
end


--Start of interesting stuff
pad = Controls.read()

function checkconfigentry()
	if Controls.check(pad, KEY_START) and Controls.check(pad, KEY_SELECT) then
		configmenu()
		System.exit()
	end
end
function configmenu()
	while true do
		
	end
end
function uihead()
	Screen.debugPrint(0,0,"Quick Payload Switcher v."..version.." Config", white, TOP_SCREEN)
	Screen.debugPrint(0,20,"==============================", red, TOP_SCREEN)
end
function writecfg()
	modestream = io.open("/payloadswitch-mode.cfg",FCREATE)
	io.write(modestream,0,"normal", 6)
	io.close(modestream)
end
function readcfg(path)
	if not System.doesFileExist(path) then
		writecfg()
		readcfg(path)
	end
	cfgstream = io.open(path, FREAD)
	cfgmode = io.read(cfgstream, 0,io.size(cfgstream))
	io.close(cfgstream)
end
function checkcfg()
	readcfg("/payloadswitch-mode.cfg")
	if not cfgmode == "normal" or cfgmode == "alternate" or cfgmode == "mixed" then
		writecfg()
		checkcfg()
	end
end
function switchalt(paytoswitch)
	System.renameFile(renamedpayload, "/temppayload.bin")
	System.renameFile(paytoswitch, renamedpayload)
	System.renameFile("/temppayload.bin", paytoswitch)
end
function switchnorm(paytoswitch)
	renamedpayload = paytoswitch
end
function switchpay(paytoswitch,mode)
	if mode == 0 then
		--Normal behaviour
		switchnorm(paytoswitch)
	else
		--Alternate behaviour
		switchalt(paytoswitch)
	end
end
if not System.doesFileExist("/payloadswitch-mode.cfg") then
	writecfg()
end
checkcfg()
if System.doesFileExist("/payloadswitch/switchalt") then
	switchmode = 1
else
	switchmode = 0
end
if Controls.check(pad,KEY_R) and Controls.check(pad, KEY_X) then
	if cfgmode == "normal" then
		cfgmode = "alternate"
	else
		cfgmode = "normal"
	end
end
--Stuff
if System.doesFileExist("/arm9loaderhax.bin") then
	originalpayload = "/arm9loaderhax.bin"
elseif System.doesFileExist("/arm9loaderhax_si.bin") then
	originalpayload = "/arm9loaderhax_si.bin"
elseif System.doesFileExist("/boot.firm") then
	originalpayload = "/boot.firm"
else
	nostandardpayloadin = 1
end
if System.doesFileExist("/payloadswitch-in.cfg") then
	instream = io.open("/payloadswitch-in.cfg",FREAD)
	originalpayload = io.read(instream,0,io.size(instream))
elseif nostandardpayloadin == 1 then
	error("No input payload detected.")
end
if System.doesFileExist("/arm9loaderhax_switch.bin") then
	renamedpayload = "/arm9loaderhax_switch.bin"
elseif System.doesFileExist("/payloadswitch-out.cfg") then
	outstream = io.open("/payloadswitch-out.cfg",FREAD)
	renamedpayload = io.read(outstream,0,io.size(outstream))
else
	error("No output payload detected.")
end
-- Adding support for more payloads, with DPAD! This isn't pretty, but does the job well enough.
if System.doesFileExist("/arm9loaderhax_switch_up.bin") and Controls.check(pad, KEY_DUP) then
	switchpay("/arm9loaderhax_switch_up.bin",switchmode)
elseif System.doesFileExist("/arm9loaderhax_switch_down.bin") and Controls.check(pad, KEY_DDOWN) then
	switchpay("/arm9loaderhax_switch_down.bin",switchmode)
elseif System.doesFileExist("/arm9loaderhax_switch_left.bin") and Controls.check(pad, KEY_DLEFT) then
	switchpay("/arm9loaderhax_switch_left.bin",switchmode)
elseif System.doesFileExist("/arm9loaderhax_switch_right.bin") and Controls.check(pad, KEY_DRIGHT) then
	switchpay("/arm9loaderhax_switch_right.bin",switchmode)
end
if Controls.check(pad,KEY_Y) and Controls.check(pad, KEY_X) then
	cfgmode = "mixed"
end
if cfgmode == "normal" or cfgmode == "mixed" then
	if System.doesFileExist("/arm9loaderhax.bin") or System.doesFileExist("/arm9loaderhax_si.bin") then

		if System.doesFileExist(originalpayload) and System.doesFileExist(renamedpayload) then
			System.renameFile(originalpayload, "/temppayload.bin")
			System.renameFile(renamedpayload, originalpayload)
			System.renameFile("/temppayload.bin", renamedpayload)
		end
	end
end	
if cfgmode == "alternate" or cfgmode == "mixed" then
	if System.doesFileExist("/arm9loaderhax.bin") then
		inputpayload = "/arm9loaderhax.bin"
		targetpayload = "/arm9loaderhax_si.bin"
	elseif System.doesFileExist("/arm9loaderhax_si.bin") then
		targetpayload = "/arm9loaderhax.bin"
		inputpayload = "/arm9loaderhax_si.bin"	
	end
	System.renameFile(inputpayload, targetpayload)
end

if Controls.check(pad,KEY_L) then
	System.exit()
else
	System.reboot()
end

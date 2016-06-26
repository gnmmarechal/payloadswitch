--Quick Payload Switcher for the 3DS (Quick Switch between CFWs)
-- By gnmmarechal
-- http://gs2012.xyz

version = "1.0"
if System.doesFileExist("/arm9loaderhax.bin") or System.doesFileExist("/arm9loaderhax_si.bin") then
	if System.doesFileExist("/arm9loaderhax.bin") then
		originalpayload = "/arm9loaderhax.bin"
	elseif System.doesFileExist("/arm9loaderhax_si.bin")
		originalpayload = "/arm9loaderhax_si.bin"
	end
	if System.doesFileExist("/payloadswitch-in.cfg") then
		instream = io.open("/payloadswitch-in.cfg",FREAD)
		originalpayload = io.read(instream,0,io.size(instream))
	end
	if System.doesFileExist("/arm9loaderhax_switch.bin") then
		renamedpayload = "/arm9loaderhax_switch.bin"
	elseif System.doesFileExist("/payloadswitch-out.cfg") then
		outstream = io.open("/payloadswitch-out.cfg",FREAD)
		renamedpayload = io.read(outstream,0,io.size(outstream))
	end
	if not originalpayload == nil and not renamedpayload == nil then
		System.renameFile(originalpayload, "/temppayload.bin")
		System.renameFile(renamedpayload, originalpayload)
		System.renameFile("/temppayload.bin", renamedpayload)
	end
end
System.exit()
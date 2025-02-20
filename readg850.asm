; zcc +g800 --no-crt -create-app -Cz"--ihex --org=0x0100" -o readg850.hex readg850.asm

		org  0x0100

		di
		in   a,(0x069)
		push af
		call 0x0bd09
		out  (0x069),a
		ld   hl,0x0c000
		ld   de,0x01000
		ld   bc,0x04000
		ldir
		pop  af
		out  (0x069),a
		ei
		ret

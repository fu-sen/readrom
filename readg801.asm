; zcc +g800 --no-crt -create-app -Cz"--ihex --org=0x0100" -o readg801.hex readg801.asm

		org  0x0100

		di
		in   a,(0x019)
		push af
		call 0x0bd09
		push af
		call 0x0bd0f
		pop  af
		out  (0x019),a
		ld   de,0x00200
		ld   bc,0x01000
		ldir
		pop  af
		out  (0x019),a
		ei
		ret

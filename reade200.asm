; zcc +g800 --no-crt -create-app -Cz"--ihex --org=0x0100" -o reade200.ihx reade200.asm

		org  0x0100

		di
		in   a,(0x019)
		push af
		call 0x0bd09
		out  (0x019),a
		ld   hl,0x0c000
		ld   de,0x01000
		ld   bc,0x04000
		ldir
		pop  af
		out  (0x019),a
		ei
		ret

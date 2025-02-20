@echo off
setlocal

hexfile_merger_windows_x86 -import rom00-c000.ihx -move 0x200 0x11ff 0x4000  -import rom00-d000.ihx -move 0x200 0x11ff 0x5000  -import rom00-e000.ihx -move 0x200 0x11ff 0x6000  -import rom00-f000.ihx -move 0x200 0x11ff 0x7000 -move 0x4000 0x7fff 0x0000 -export rom00.ihx
ren rom00.ihx rom00.txt

hexfile_merger_windows_x86 -import rom01-c000.ihx -move 0x200 0x11ff 0x4000  -import rom01-d000.ihx -move 0x200 0x11ff 0x5000  -import rom01-e000.ihx -move 0x200 0x11ff 0x6000  -import rom01-f000.ihx -move 0x200 0x11ff 0x7000 -move 0x4000 0x7fff 0x0000 -export rom01.ihx
ren rom01.ihx rom01.txt

hexfile_merger_windows_x86 -import rom02-c000.ihx -move 0x200 0x11ff 0x4000  -import rom02-d000.ihx -move 0x200 0x11ff 0x5000  -import rom02-e000.ihx -move 0x200 0x11ff 0x6000  -import rom02-f000.ihx -move 0x200 0x11ff 0x7000 -move 0x4000 0x7fff 0x0000 -export rom02.ihx
ren rom02.ihx rom02.txt

hexfile_merger_windows_x86 -import rom03-c000.ihx -move 0x200 0x11ff 0x4000  -import rom03-d000.ihx -move 0x200 0x11ff 0x5000  -import rom03-e000.ihx -move 0x200 0x11ff 0x6000  -import rom03-f000.ihx -move 0x200 0x11ff 0x7000 -move 0x4000 0x7fff 0x0000 -export rom03.ihx
ren rom03.ihx rom03.txt

endlocal
pause

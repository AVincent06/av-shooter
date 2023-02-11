pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--av-shooter
--@vincent06

#include scripts/main.lua

--entities
#include scripts/entities/bullets.lua
#include scripts/entities/enemies.lua
#include scripts/entities/explosions.lua
#include scripts/entities/player.lua
#include scripts/entities/reactor.lua
#include scripts/entities/stars.lua

--scenes


--utilities
#include scripts/utilities/sprites.lua
#include scripts/utilities/tools.lua

__gfx__
000000000050050000a00a0000300300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005dd50000a00a0000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070050666605009009000bbbbbb0000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000566dd66500000000377bb7730087e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700066dc7d6600900900317bb173008ee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070065dccd56000000000bbbbbb0000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d55dd55d00000000b003300b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000009009900900000000b300003b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005050000000000000300300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005d50000000000000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005666050000000000bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005dd665000000000317bb173000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006c7d66000000000377bb773000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006ccd560000000000bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ddd55d000000000b003300b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000909009000000000b300003b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000005d5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050666500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000566dd500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066dc7600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000065dcc600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d55ddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000090090900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa0aaa0aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a000a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa0aaa0aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000
00000000000000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000600000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000300300000000000003003000000000000030030000000000000300300000000000003003000000000000030030000000000000300300000000000
00000000000b00b0000000000000b00b0000000000000b00b0000000000000b00b0000000000000b00b0000000000000b00b0000000000000b00b00000000000
0000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb0000000000
000000000377bb773000000000377bb773000000000377bb773000000000377bb773000000000377bb773000000000377bb773000000000377bb773000000000
000000000317bb173000000000317bb173000000000317bb173000000000317bb173000000000317bb173000000000317bb173000000000317bb173000000000
0000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb00000000000bbbbbb0000000000
000000000b003300b000000000b003300b000000000b003300b000000000b003300b000000000b003300b000000000b003300b000000000b003300b000000000
000000000b300003b000000000b300003b000000000b300003b000000000b300003b000000000b300003b000000000b300003b000000000b300003b000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000500500000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005dd500000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050666605000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000566dd665000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066dc7d66000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065dccd56000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d55dd55d000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090099009000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0001010202000000000000000000000000010002000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00020000260502b0502d0502d0502a0502304018040130300f0300b0200801006010000001d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200001b6101c6201d6301e6301e6201c6101561011610116100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

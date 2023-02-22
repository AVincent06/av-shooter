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
#include scripts/scenes/game.lua
#include scripts/scenes/gameover.lua
#include scripts/scenes/title.lua

--utilities
#include scripts/utilities/sprites.lua
#include scripts/utilities/tools.lua

__gfx__
000000000050050000a00a0000300300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005dd50000a00a0000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700506666050090090000bbbb00000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000566dd66500000000037bb7300087e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700066dc7d660090090003bbbb30008ee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070065dccd560000000000b33b00000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d55dd55d000000000b0330b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000900990090000000000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005050000000000000300300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005d50000000000000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000056660500000000000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005dd66500000000003ebbe30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006c7d6600000000003bbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006ccd5600000000000b33b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ddd55d0000000000b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000009090090000000000b3003b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000505000000000000300300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000005d5000000000000b00b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050666500000000000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000566dd5000000000038bb830000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066dc7600000000003bbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000065dcc600000000000b33b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d55ddd0000000000b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000900909000000000b300003b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006d600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006dcd60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000909090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000007600000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0076607000d000766606000000000000006760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0060d0600dd00060000666d0006660066606000660076d0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0600d0600d000066000600d00700d0700d0600700d06000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06ddd060d076d00dd00600d06000d6000d06066dd070000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6d00d060d0000000d0700d00600d0600d00606000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d000d00d000006ddd0600d006dd006dd000dd0ddd0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0001010202000000000000000000000000010002000000000000000000000000000100020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00020000260502b0502d0502d0502a0502304018040130300f0300b0200801006010000001d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000500001b6401c6401d6401e6301e6301c62015620116100b0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

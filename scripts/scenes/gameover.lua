-- Class Scenes.gameover
Scenes.gameover = {}
Scenes.gameover.__index = Scenes.gameover

function Scenes.gameover.new()
    local self = setmetatable({}, Scenes.gameover)
    return self
end

function Scenes.gameover:update()
    if(btn(🅾️)) load_scene("title")
end

function Scenes.gameover:draw()
    cls(1)
	rectfill(19,48,109,82,5)
	print("score:",54,50,6)
	print(score,54,58,10)
	print(
		"press 🅾️ to continue",
		24,
		70,
		6
	)
end
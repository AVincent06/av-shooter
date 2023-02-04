-- Class Player
Player = {}
Player.__index = Player

function Player.new(x, y, speed, sprite, box)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.speed = speed
    self.sprite = sprite
    self.box = box
    return self
end

function Player:update()
    if not (btn(➡️) or btn(⬅️))then
		self.sprite = 1
	end
	if btn(➡️) and 
	 self.x+7+self.speed<127 then
	 self.x+=self.speed
	 self.sprite = 33
	end
	if btn(⬅️) and
	 self.x-self.speed>0 then
	 self.x-=self.speed
	 self.sprite = 17
	end
	if btn(⬆️) and 
	 self.y-self.speed>0 then
	 self.y-=self.speed
	end
	if btn(⬇️) and
	 self.y+7+self.speed<127 then
	 self.y+=self.speed
	end
	if(btnp(❎)) shoot()
	
	-- for e in all(enemies) do
	-- 	if collision(e,self) then
	-- 		state=1
	-- 	end
	-- end
end

function Player:draw()
    spr(self.sprite, self.x, self.y)
end

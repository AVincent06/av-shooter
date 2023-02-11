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
	self.reactor = Reactor.new(5, 0.3, self.x, self.y)
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
end

function Player:draw()
    spr(self.sprite, self.x, self.y)
	self.reactor:draw(self.x, self.y)
end

function Player:collisionWith(target)
	for t in all(target.group) do
		if collision(t, self) and isEnemy(t, self) then
			state=1
		end
	end
end
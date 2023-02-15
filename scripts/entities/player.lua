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
	self.life = 3
	self.isVisible = true
	self.blinking = 0
	self.blinkTime = 5*60
	self.blinkInterval = 10
	self.blinkIntervalReset = 10
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
	if self.blinking > 0 then
		self.blinking -= 1
		if self.blinkInterval>0 then
			self.blinkInterval -= 1
		else
			self.blinkInterval = self.blinkIntervalReset
			self.isVisible = not self.isVisible
		end
	else
		self.isVisible = true
	end
end

function Player:draw()
	if self.isVisible then
		spr(self.sprite, self.x, self.y)
		self.reactor:draw(self.x, self.y)
	end
end

function Player:collisionWith(target)
	if self:isNotInvulnerable() then
		for t in all(target.group) do
			if collision(t, self) and isEnemy(t, self) then
				explosions:create(20, self.x+4, self.y+4)
				del(target.group,t)
				self.life -= 1
				self.blinking = self.blinkTime
				if(self.life<0) state=1
			end
		end
	end
end

function Player:isNotInvulnerable()
	return not (self.blinking>0)
end
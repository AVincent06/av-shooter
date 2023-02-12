-- Class Enemies
Enemies = {}
Enemies.__index = Enemies

function Enemies.new()
    local self = setmetatable({}, Enemies)
    self.group = {}
    return self
end

function Enemies:update(bullets,explosions)
    if #self.group == 0 then
        self:spawn(ceil(rnd(7)))
    end
	for e in all(self.group) do
		e.y+=0.3
		if e.y > 128 then
			del(self.group,e)
		end

		for b in all(bullets.group) do
			if ( collision(e,b) and isEnemy(e,b) ) then
				del(bullets.group,b)
				e.life -= 1
				e.flash = 5
				if e.life==0 then
					explosions:create(20, b.x+4, b.y+2)
					del(self.group,e)
					score+=e.score
				end
			end
		end
	end
end

function Enemies:draw(playerX, playerY)
	for e in all(self.group) do
		if(playerX+8<=e.x) e.hflip=false
		if(playerX>=e.x+8) e.hflip=true
		if(playerY>=e.y+8) e.sprite=Sprite.ALIEN_D
		if(playerY+8<=e.y) e.sprite=Sprite.ALIEN_U
		if(e.flash > 0) then
			for i=1,15 do
				pal(i,7)
			end 
			spr(e.sprite, e.x, e.y, 1, 1, e.hflip)
			pal()
			e.flash-=1
		else
			spr(e.sprite, e.x, e.y, 1, 1, e.hflip)
		end
	end
end

function Enemies:spawn(amount)
	gap=(128-8*amount)/(amount+1)
	for i=1,amount do
		new_enemy={
			x=gap*i+8*(i-1),
			y=-20,
			life=4,
			score=100,
			hflip=false,
			sprite=Sprite.ALIEN_D,
			flash=0,
			box={x1=0,y1=0,x2=7,y2=7}
		}
		add(self.group,new_enemy)
	end
end
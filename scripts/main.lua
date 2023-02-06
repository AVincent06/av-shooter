function _init()
    state = 0
    score = 0
    player = Player.new(60, 90, 1, 1, {x1=0,y1=0,x2=7,y2=7})
    stars = Stars.new(20)
    enemies = Enemies.new()
    bullets = Bullets.new()
    explosions = Explosions.new()
end

function _update60()
	if(state==0) update_game()
	if(state==1) update_gameover()
end

function _draw()
	if(state==0) draw_game()
	if(state==1) draw_gameover()
end

--scene game
function update_game()
    player:update()
    player:collisionWith(enemies)
    stars:update()
    enemies:update(bullets,explosions)
    if(btnp(❎)) bullets:fire(player.x, player.y)
    bullets:update()
    explosions:update()
end

function draw_game()
    cls()
    player:draw()
    stars:draw()
    enemies:draw(player.x, player.y)
    bullets:draw()
    explosions:draw()
    print(score,2,2,10)
	rect(0,0,127,127,5)
end

--scene gameover
function update_gameover()
    if(btn(🅾️)) _init()
end

function draw_gameover()
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
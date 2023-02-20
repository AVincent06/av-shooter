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
    player:collisionWith(bullets)
    stars:update()
    enemies:update()

    --fire
    if(btnp(❎)) bullets:fire(player.x, player.y, player.x, 1, Sprite.BULLET_P, 2, 0, 5, 4, 4)
    if(t()%1==0) then
        local gunner = rnd(enemies.group)
        if(gunner and gunner.y<=120) then
            bullets:fire(gunner.x, gunner.y, player.x, player.y, Sprite.BULLET_E, 3, 3, 6, 6, 1)
        end
    end

    bullets:update()
    explosions:update()
end

function draw_game()
    cls()
    player:draw()
    stars:draw()
    enemies:draw()
    bullets:draw()
    explosions:draw()
	rect(0,0,127,127,5)
    print(score,2,2,10)
    if player.life > 0 then
        for i=1,player.life do
            spr(Sprite.PLAYER_1UP, 2+(7*i)-7, 123)
        end
    end

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
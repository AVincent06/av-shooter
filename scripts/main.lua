function _init()
    state = 0
    p = Player.new(60, 90, 1, 1, {x1=0,y1=0,x2=7,y2=7})
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
    p:update()
end

function draw_game()
    cls()
    p:draw()
end

--scene gameover
function update_gameover()

end

function draw_gameover()

end
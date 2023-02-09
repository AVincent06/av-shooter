function calculateAngle(aX, aY, bX, bY)
	dX = bX - aX
	dY = bY - aY
	angle = atan2(dY, dX)
	return angle
end

function collision(a,b)
	return not(
		a.x+a.box.x1>b.x+b.box.x2 or
		a.y+a.box.y1>b.y+b.box.y2 or
		a.x+a.box.x2<b.x+b.box.x1 or
		a.y+a.box.y2<b.y+b.box.y1
	)
end
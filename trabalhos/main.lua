function love.load()

	p1= { x=0, y=100, w=70, h=70, erro=0}
	
	obj={x=100, y =-10, w=20, h=100}
	
	obj2={x=270, y =-10, w=20, h=100}
	
	obj3={x=390, y =-10, w=20, h=100}
end

	
function love.obs()
	obj.y=obj.y+5
	
	obj2.y=obj2.y+5
	
	obj3.y=obj3.y+5
	
	obj.x=obj.x+0.3
	
	obj2.x=obj2.x+0.5
	
	obj3.x=obj3.x+0.6
	if (obj.y>600) then
		obj.y=-10
	end
	
	if (obj2.y>600) then
		obj2.y=-10
	end
	
	if (obj3.y>600) then
		obj3.y=-10
	end
	
end	

function love.keypressed( key )
 	
	love.graphics.setColor(255,255,255)

	if key == 'right' then
		p1.x = p1.x+20
		
	elseif key == 'left' then
		p1.x = p1.x-20	

	elseif key == 'down' then
		p1.y = p1.y+20

	elseif key == 'up' then
		p1.y = p1.y-20
	end
end

function colisao(p1, obj)
    return (p1.x+p1.w>= obj.x) and (p1.x <= obj.x+obj.w) and
           (p1.y+p1.h>= obj.y) and (p1.y <= obj.y+obj.h)
end

function love.update( )
	

	if p1.x < 0  then
		p1.erro=p1.erro+1
		love.graphics.setColor(90,255,60)
		--love.graphics.setBackgroundColor(0,0,0)
		--love.graphics.print("This is a pretty lame example!!!!", 10, 200, 'white')

	elseif p1.y < 0 then
		p1.erro=p1.erro+1
		love.graphics.setColor(90,255,60)	
	end
	
	if p1.erro==3 then
		
		love.load()
		p1.erro=0
	end

	-- Andando e lançando obstaculos de acordo com o tempo 
	t0=love.timer.getTime()
	t=0
	if (t0>=t) then
		love.obs()
		t=t0;
		p1.x=p1.x+0.3
	end

	
	if (p1.x>=750) then
		love.load()
	end
	
	if colisao(p1,obj) then
        love.load()
	
	else if colisao(p1,obj2) then
        love.load()
	
	else if colisao(p1,obj3) then
        love.load()
	end
	end
end

end


function love.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', p1.x, p1.y , p1.w, p1.h)
	love.graphics.setColor(255, 5, 20)
    love.graphics.circle("fill", obj.x, obj.y, obj.w, obj.h)
	love.graphics.setColor(25, 15, 40)
	love.graphics.circle("fill", obj2.x, obj2.y, obj2.w, obj2.h)
	love.graphics.setColor(5, 30, 200)
	love.graphics.circle("fill", obj3.x, obj3.y, obj3.w, obj3.h)
	
	--Colocando nome na tela
	love.graphics.setColor(180, 180, 180)
	love.graphics.setColor(250, 105, 40)
	love.graphics.print("Rafael Faustino", 580, 30, 0, 2, 2)
	
	
	--love.graphics.circle("fill", obj4.x, obj4.y,20, 100)
	--love.graphics.circle("fill", obj5.x, obj5.y,20, 100)
	--love.graphics.circle("fill", obj6.x, obj6.y,20, 100)
	love.graphics.setBackgroundColor(74,100,200)
end
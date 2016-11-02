function love.load()

	p1= { x=0, y=50, w=70, h=70, erro=nil}
	
	obj={x=100, y =-10, w=20, h=100}
	-- TRABALHO 6
	-- obj é usada como REGISTRO 
	
	obj2={x=270, y =-10, w=20, h=100}
	
	obj3={x=390, y =-10, w=20, h=100}
end

	
function love.obs()
	obj.y=obj.y+2
	
	obj2.y=obj2.y+2
	
	obj3.y=obj3.y+2
	
	
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
 	-- TRABALHO 6
	-- neste caso, a variável key é usada como ENUM
	
	love.graphics.setColor(255,255,255)

	if key == 'right' then
		p1.x = p1.x+20
		
	-- n
		
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
	cor= {25,15,40}
	-- TRABALHO 6
	-- cor é um ARRAY
	
    love.graphics.circle("fill", obj.x, obj.y, obj.w, obj.h)
	love.graphics.setColor(cor[1], cor[2], cor[3])
	love.graphics.circle("fill", obj2.x, obj2.y, obj2.w, obj2.h)
	
	love.graphics.setColor(5, 30, 200)
	love.graphics.circle("fill", obj3.x, obj3.y, obj3.w, obj3.h)
	nome = {"Rafael Faustino", 580, 30, 0, 2, 2}
	-- TRABALHO 6
	-- nome é uma TUPLA  
	
	
	--Colocando nome na tela
	love.graphics.setColor(180, 180, 180)
	love.graphics.setColor(250, 105, 40)
	love.graphics.print(nome[1],nome[2],nome[3],nome[4],nome[5],nome[6])
	love.graphics.setBackgroundColor(74,100,200)
end

-- 														TRABALHO 4
	-- Nome: p1
	-- propriedade: endereço
	-- Binding time: execução
	-- o construtor de tabelas cria uma tabela dinamicamente durante a execução, nesse caso criou 5 campos
	
	-- Nome: t
	-- propriedade: endereço
	-- Binding time: Execução
	-- o endereço da variável t é alocado durante a execução do programa, pois t éuma variável local
	
	-- +
	-- propriedade: semântica
	--  Binding: comilação
	--  A implementação do operador "+" é definida em tempo de compilação. ou seja, em tempo de compilação é decidido como o operador 
	-- vai funcionar
	
	-- Nome: love.graphics.setBackgroundColor
	-- propriedade: Biblioteca
	-- propriedade: compilação
	-- Durante a compilação a  biblioteca "love.graphics.setBackgroundColor" é ligada ao código, como se o código dessa função
	-- viesse parar neste código.
	
	-- Nome: if 
	-- propriedade: sintaxe
	-- Binding: design 
	-- Durante a criação da linguagem, decidiram que a palavra "if" seria reservada e seria usada para o fluxo condicional.
	
	-- Nome: nil
	-- propriedade: valor
	-- Binding: design
	-- Durante a criação da linguagem, foi decidido que palavra 'nil' seria reservada e que seu valor seria nulo.
	


-- Trabalho 5

-- Os objetos são criados de acordo com o timer 
-- São criados no topo da tela e vão caindo até que sumam da tela
-- logo após sumirem, eles retornam ao topo da tela e voltm a cair mas com um delocamento maior para a direita.
-- O tempo de vida da coleção de objetos vai de acrodo com o tempo, são alocados em tempo de execução pois são elementos 
-- locais
-- ALOCAÇÃO--> Os elementos são alocados acima do campo de visão 
-- DESALOCAÇÂO --> Os elementos são desalocados de acordo com o time e com a variação de altura, até sumir da tela

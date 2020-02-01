-- pour le menu (TITRE JEU, play, option, credits, exit)

local is_menu = true
local is_credit = false
local is_music = false
local h = 425
success = love.window.setMode(1920, 1080)
width = love.graphics.getWidth()
height = love.graphics.getHeight()
--charge images etc
	function love.load()
		font = love.graphics.newFont("Stars Fighters Upright.ttf", 50)
		love.graphics.setFont(font)
		cursor = love.graphics.newImage("pointer_on_text-ConvertImage (1).png")

		--menu = love.graphics.newImage("")
	--background = love.graphics.newImage("")
		y_credit = 700
	    y_credit2 = 900
	    son_credit = love.audio.newSource("credits.mp3", "stream")
	end

function mouse_pos(x, y)
	function love.mousepressed(x, y, button)
		if (is_menu) then
			if (y >= 400 and y <= 530  and x >= 740 and x <= 1070 and button == 1) then
				print("PLAY TOUCHED")
			end
			if (y >= 535 and y <= 630 and x >= 695 and x <= 1115 and button == 1) then
				print("OPTION TOUCHED")
			end
			if (y >= 650 and y <= 745 and x >= 695 and x <= 1115 and button == 1) then
				is_credit = true
				is_music = true
				is_menu = false
			end
			if (y >= 760 and y <= 855 and x >= 800 and x <= 1055 and button == 1) then
				love.event.quit(false)
			end
		end
	end
end

--game loop:
	function love.update(dt)
		button = 0
		--r = love.quit()
		x, y = love.mouse.getPosition()
		--print(y)
		if (is_menu) then
			mouse_pos(x, y)
		end
		if (is_credit) then
			if (y_credit > -90) then
		        y_credit = y_credit - 1
		    else
		        y_credit = 700
		    end
		    if (y_credit2 > -90) then
		        y_credit2 = y_credit2 - 1
		    else
		        y_credit2 = 800
		    end
		end
	end


function love.keypressed(key, scancode, isrepeat)
	if(is_credit) then
	   if key == "escape" then
	       is_credit = false
	       is_music = false
	       is_menu = true
	   end
	end
	if (is_menu) then
		if key == "return" and h == 755 then
			love.event.quit()
		end
		if key == "return" and h == 645 then
			is_credit = true
			is_music = true
			is_menu = false
		end
		if key == "down" and h <= 675 then
			h = h + 110
		end
		if key == "up" and h >= 515 then
			h = h - 110 
		end
	end
end
--affichage
	function love.draw()
		if (is_menu) then
			is_music = false
			love.graphics.draw(cursor, (width / 2) - 450, h, 0, 0.6, 0.6)
			love.graphics.print("RUN IN TIME", (width / 2) - 350, 275)
			love.graphics.print("PLAY", (width / 2) - 160, 425)
			love.graphics.print("OPTIONS", (width / 2) - 265, 550)
			love.graphics.print("CREDITS", (width / 2) - 265, 665)
			love.graphics.print("EXIT", (width / 2) - 160, 775)
		end
		if (is_credit) then
	        love.audio.play(son_credit)
	        love.graphics.printf("Alexis Martin", 500 * 2, y_credit, 100 * 2, "center")
	        love.graphics.printf("Flavien Roche", 200 * 2, y_credit, 120 * 2, "center")
	        love.graphics.printf("Thomas Bernad", 350 * 2, y_credit, 140 * 2, "center")
	        love.graphics.printf("Neil Peyrot", 250 * 2, y_credit2, 120 * 2, "center")
	        love.graphics.printf("Léo Soule", 400 * 2, y_credit2, 140 * 2, "center")
    	end
	end
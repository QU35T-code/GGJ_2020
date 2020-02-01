-- pour le menu (TITRE JEU, play, option, credits, exit)

local is_menu = true
local is_credit = false
local is_music = false
local is_option = false
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
	    y_credit3 = 1100
	    y_credit4 = 1300
	    son_credit = love.audio.newSource("credits/credits.mp3", "stream")
	end

function mouse_pos(x, y)
	function love.mousepressed(x, y, button)
		if (is_menu) then
			if (y >= 400 and y <= 530  and x >= 740 and x <= 1070 and button == 1) then
				print("PLAY TOUCHED")
			end
			if (y >= 535 and y <= 630 and x >= 695 and x <= 1115 and button == 1) then
				is_option = true
				is_menu = false
				is_music = true
				is_credit = false
			end
			if (y >= 650 and y <= 745 and x >= 695 and x <= 1115 and button == 1) then
				is_credit = true
				is_music = true
				is_menu = false
				is_option = false
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
		        y_credit = 1200
		    end
		    if (y_credit2 > -90) then
		        y_credit2 = y_credit2 - 1
		    else
		        y_credit2 = 1200
		    end
		    if (y_credit3 > -90) then
		        y_credit3 = y_credit3 - 1
		    else
		        y_credit3 = 1200
		    end
		    if (y_credit4 > -90) then
		        y_credit4 = y_credit4 - 1
		    else
		        y_credit4 = 1200
		    end

		end
	end


function love.keypressed(key, scancode, isrepeat)
	if(is_credit) then
	   if key == "escape" then
	       is_credit = false
	       is_music = false
	       is_option = false
	       is_menu = true
	   end
	end
	if(is_option) then
	   if key == "escape" then
	       is_credit = false
	       is_music = false
	       is_option = false
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
			is_option = false
		end
		if key == "return" and h == 535 then
			is_credit = false
			is_music = true
			is_menu = false
			is_option = true
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
	        love.graphics.printf("Alexis Martin", 500, y_credit, 1000, "center")
	        love.graphics.printf("Flavien Roche", 500, y_credit2, 1000, "center")
	        love.graphics.printf("Thomas Bernad", 500, y_credit3, 1000, "center")
	        love.graphics.printf("Leo Soule", 500, y_credit4, 1000, "center")
    	end
    	if (is_option) then
    		love.graphics.setColor(255, 255, 255, 255)
        	love.graphics.printf("You need to collect the differents pieces", 100, 120, 1800, "center")
        	love.graphics.printf("in order the repair your time machine", 100, 350, 1800, "center")
        	love.graphics.printf("and return to the right time", 100, 500, 1800, "center")
        	love.graphics.setColor(150, 150, 0, 255)
        	love.graphics.printf("Control your player with the arrows and jump with the space bar", 100, 750, 1800, "center")
        end
	end
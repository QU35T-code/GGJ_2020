-- VARIABLES
local x, y
local is_menu = true
local is_game = false
local is_pause = false
local init = false
local h = 425
local is_run = false
local is_run_rev = false
local is_idle = true
local is_idle_rev = false
local font_size = 50
local is_jump = false
local is_jump_rev = false
local is_ground = true
local son_credit
is_idle_rev = false
x_background = 0
y_background = 0
x_background_2 = 1920
y_background_2 = 0
is_stop_defile = false
rotation_objects = 0
x_objet_1 = 300
x_objet_2 = 500
x_objet_3 = 700
x_objet_4 = 900
y_objet_1 = 780
y_objet_2 = 800
y_objet_3 = 800
y_objet_4 = 800
is_destroy_1 = false
is_destroy_2 = false
is_destroy_3 = false
is_destroy_4 = false
compteur_pieces = 0
-- SCREEN SIZE
love.window.setMode(1920, 1080, fullscreen)
width = love.graphics.getWidth()
height = love.graphics.getHeight()


-- OBJET HERO
hero = {}
hero.x = 0
hero.y = 900
hero.width = 130
hero.height = 130
hero.images_idle_dino = {}
hero.images_idle_dino_rev = {}
hero.images_dino_run = {}
hero.images_run_dino_rev = {}
hero.images_die_dino = {}
hero.images_die_dino_rev = {}
hero.images_jump_dino = {}
hero.images_jump_dino_rev = {}
hero.frame = 1
hero.x = width / 2
hero.y = height / 2
hero.width = 80
hero.height = 88
speed = 2.5

function love.load()
	-- LOAD WINDOW
	love.window.setTitle("Repair")

	-- LOAD IMAGES
	background = love.graphics.newImage("Images/menu_background.jpg")
	hero_dino = love.graphics.newImage("Dino_time/sprites/Idle/Idle_1.png")
	pause = love.graphics.newImage("Images/Pause.png")
	background_game_lv1 = love.graphics.newImage("Images/background.png")


	-- LOAD IDLE DINO
	hero.images_idle_dino[1] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_1.png")
	hero.images_idle_dino[2] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_2.png")
	hero.images_idle_dino[3] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_3.png")
	hero.images_idle_dino[4] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_4.png")
	hero.images_idle_dino[5] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_5.png")
	hero.images_idle_dino[6] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_6.png")
	hero.images_idle_dino[7] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_7.png")
	hero.images_idle_dino[8] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_8.png")
	hero.images_idle_dino[9] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_9.png")
	hero.images_idle_dino[10] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_10.png")

	-- LOAD IDLE DINO REV
	hero.images_idle_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_1.png")
	hero.images_idle_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_2.png")
	hero.images_idle_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_3.png")
	hero.images_idle_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_4.png")
	hero.images_idle_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_5.png")
	hero.images_idle_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_6.png")
	hero.images_idle_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_7.png")
	hero.images_idle_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_8.png")
	hero.images_idle_dino_rev[9] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_9.png")
	hero.images_idle_dino_rev[10] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_10.png")

	-- LOAD RUN DINO
	hero.images_dino_run[1] = love.graphics.newImage("Dino_time/sprites/Run/Run_1.png")
	hero.images_dino_run[2] = love.graphics.newImage("Dino_time/sprites/Run/Run_2.png")
	hero.images_dino_run[3] = love.graphics.newImage("Dino_time/sprites/Run/Run_3.png")
	hero.images_dino_run[4] = love.graphics.newImage("Dino_time/sprites/Run/Run_4.png")
	hero.images_dino_run[5] = love.graphics.newImage("Dino_time/sprites/Run/Run_5.png")
	hero.images_dino_run[6] = love.graphics.newImage("Dino_time/sprites/Run/Run_6.png")
	hero.images_dino_run[7] = love.graphics.newImage("Dino_time/sprites/Run/Run_7.png")
	hero.images_dino_run[8] = love.graphics.newImage("Dino_time/sprites/Run/Run_8.png")

	-- LOAD RUN DINO REV
	hero.images_run_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_1.png")
	hero.images_run_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_2.png")
	hero.images_run_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_3.png")
	hero.images_run_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_4.png")
	hero.images_run_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_5.png")
	hero.images_run_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_6.png")
	hero.images_run_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_7.png")
	hero.images_run_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_8.png")

	-- LOAD DIE DINO
	hero.images_die_dino[1] = love.graphics.newImage("Dino_time/sprites/Die/Dead_1.png")
	hero.images_die_dino[2] = love.graphics.newImage("Dino_time/sprites/Die/Dead_2.png")
	hero.images_die_dino[3] = love.graphics.newImage("Dino_time/sprites/Die/Dead_3.png")
	hero.images_die_dino[4] = love.graphics.newImage("Dino_time/sprites/Die/Dead_4.png")
	hero.images_die_dino[5] = love.graphics.newImage("Dino_time/sprites/Die/Dead_5.png")
	hero.images_die_dino[6] = love.graphics.newImage("Dino_time/sprites/Die/Dead_6.png")
	hero.images_die_dino[7] = love.graphics.newImage("Dino_time/sprites/Die/Dead_7.png")
	hero.images_die_dino[8] = love.graphics.newImage("Dino_time/sprites/Die/Dead_8.png")

	-- LOAD DIE DINO REV
	hero.images_die_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_1.png")
	hero.images_die_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_2.png")
	hero.images_die_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_3.png")
	hero.images_die_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_4.png")
	hero.images_die_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_5.png")
	hero.images_die_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_6.png")
	hero.images_die_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_7.png")
	hero.images_die_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_8.png")

	-- LOAD JUMP DINO
	hero.images_jump_dino[1] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_1.png")
	hero.images_jump_dino[2] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_2.png")
	hero.images_jump_dino[3] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_3.png")
	hero.images_jump_dino[4] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_4.png")
	hero.images_jump_dino[5] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_5.png")
	hero.images_jump_dino[6] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_6.png")
	hero.images_jump_dino[7] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_7.png")
	hero.images_jump_dino[8] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_8.png")
	hero.images_jump_dino[9] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_9.png")
	hero.images_jump_dino[10] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_10.png")
	hero.images_jump_dino[11] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_11.png")
	hero.images_jump_dino[12] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_12.png")

	-- LOAD JUMP DINO REV
	-- hero.images_jump_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_1.png")
	-- hero.images_jump_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_2.png")
	-- hero.images_jump_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_3.png")
	-- hero.images_jump_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_4.png")
	-- hero.images_jump_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_5.png")
	-- hero.images_jump_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_6.png")
	-- hero.images_jump_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_7.png")
	-- hero.images_jump_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_8.png")
	-- hero.images_jump_dino_rev[9] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_9.png")
	-- hero.images_jump_dino_rev[10] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_10.png")
	-- hero.images_jump_dino_rev[11] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_11.png")
	-- hero.images_jump_dino_rev[12] = love.graphics.newImage("Dino_time/sprites/Jump_rev/Jump_12.png")

	-- ADD objets

	objet_1 = love.graphics.newImage("Objets/objet_1.png")
	objet_2 = love.graphics.newImage("Objets/objet_2.png")
	objet_3 = love.graphics.newImage("Objets/objet_3.png")
	objet_4 = love.graphics.newImage("Objets/objet_4.png")

	-- LOAD SOUND
	sound_fx = love.audio.newSource("Musiques/sound_check_menu.mp3", "stream")
	enter_fx = love.audio.newSource("Musiques/enter.mp3", "stream")
	son_credit = love.audio.newSource("Musiques/credits.mp3", "stream")

	-- OTHER
		font = love.graphics.newFont("Polices/Stars Fighters Upright.ttf", font_size)
		love.graphics.setFont(font)
		cursor = love.graphics.newImage("Images/pointer.png")
		y_credit = 700
	    y_credit2 = 900
	    y_credit3 = 1100
	    y_credit4 = 1300
	    timer = 0
    	alpha = 0
    	alpha_text = 0
    	fadein  = 5
    	display = 7
    	fadeout = 4
    	fadein_text  = 4
    	display_text = 5
    	fadeout_text = 6
    	zqsd = love.graphics.newImage("Images/zqsd.jpg")

	-- START SOUND
	if (is_menu) then
		son_credit:play()
		son_credit:setLooping(true)
	end
end

function mouse_pos(x, y)
	function love.mousepressed(x, y, button)
		if (is_menu and is_game == false) then
			if (y >= 400 and y <= 530  and x >= 740 and x <= 1070 and button == 1) then
				is_option = false
				is_menu = false
				is_music = false
				is_credit = false
				is_game = true
			end
			if (y >= 535 and y <= 630 and x >= 695 and x <= 1115 and button == 1) then
				is_credit = false
				is_menu = false
				is_game = false
				is_option = true
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


function love.update(dt)
	-- MENU
	x, y = love.mouse.getPosition()
		if (is_menu and is_game == false) then
			mouse_pos(x, y)
			love.audio.setVolume(0.5)
			son_credit:play()
			son_credit:setLooping(true)
		end
		if (is_game and is_menu == false) then
			timer = (timer + dt)
  			if timer < fadein then 
    			alpha = timer / fadein
  			elseif timer < display then 
    			alpha = 1
  			elseif timer < fadeout then
    			alpha = 1- ((timer - display) / (fadeout - display))
  			else 
    			alpha = 255
  			end
  		end
  		if timer < fadein then 
    		alpha_text = timer / fadein_text
  		elseif timer < display_text then 
    		alpha_text = 1
  		elseif timer < fadeout_text then
    		alpha_text = 1- ((timer - display_text) / (fadeout_text - display_text))
  		else 
    		alpha_text = 0
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

		------------------------------------------------------------------------------

	-- IN GAME
	if (is_game) then
		son_credit:pause()
		hero.frame = hero.frame + 10 * dt
		if (hero.frame >= #hero.images_idle_dino + 1) then
			hero.frame = 1
		end
		move_hero(x, y, dt)
		--collide_hero(x, y)

		if (is_jump and is_ground == false) then
			hero.y = hero.y - 200 * dt
			if (hero.y <= 780) then
				is_descente = true
				is_jump = false
				is_ground = true
				is_idle = true
			end
		end

		if (is_descente) then
			hero.y = hero.y + 200 * dt
		end

		if (hero.y >= 900) then
			hero.y = 900
			is_ground = true
			is_jump = false
			is_descente = false
		end

		if (x_background_2 == 0) then
			x_background = 0
			x_background_2 = 1920
		end


		rotation_objects = rotation_objects + 4 * dt

		-- SET VAR PAUSE
		if (love.keyboard.isDown("escape")) then
			is_pause = true
			is_game = false
			is_menu = false
		end
	end

	-- IN PAUSE
	if (is_pause) then
		son_credit:pause()
		mouse_pos_pause(x, y)
	end

	if (hero.x >= 1000) then
		is_stop_defile = true
		speed = 6
	end
	if (hero.x <= 1000) then
		is_stop_defile = false
		speed = 2.5
	end
	if (hero.x <= 0) then
		is_stop_defile = true
		is_run = false
		is_run_rev = false
		is_idle_rev = true
		is_idle = false
		hero.x = 0
	end

	if (hero.x >= width - hero.width - 20) then
		hero.x = width - hero.width - 20
	end


end

function love.draw()
	-- MENU
	if (is_menu and is_game == false) then
		love.graphics.draw(background, 0, 0, 0)
		love.graphics.draw(cursor, (width / 2) - 450, h, 0, 0.6, 0.6)
		love.graphics.print("RUN IN TIME", (width / 2) - 350, 275)
		love.graphics.print("PLAY", (width / 2) - 160, 425)
		love.graphics.print("OPTIONS", (width / 2) - 265, 550)
		love.graphics.print("CREDITS", (width / 2) - 265, 665)
		love.graphics.print("EXIT", (width / 2) - 160, 775)
		end
	if (is_credit and is_menu == false and is_game == false) then
	    love.graphics.printf("Alexis Martin", 500, y_credit, 1000, "center")
	    love.graphics.printf("Flavien Roche", 500, y_credit2, 1000, "center")
	    love.graphics.printf("Thomas Bernad", 500, y_credit3, 1000, "center")
	    love.graphics.printf("Leo Soule", 500, y_credit4, 1000, "center")
    end
    if (is_option and is_menu == false and is_game == false) then
        love.graphics.draw(zqsd, 200, 100, 0, 0.35, 0.35)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.line(240, 690, 500, 690)
        love.graphics.rectangle("line", 200, 650, 360, 80)
        font = love.graphics.newFont("Polices/options.ttf", 40)
        love.graphics.setFont(font)
        love.graphics.printf("Use (Z, Q, S, D) to move your player forward, backward, to the left and to the right", 700, 200, 1100, "center")
        love.graphics.printf("Press space bar to jump and collect the differents parts of the time machine", 700, 615, 1100, "center")
        font = love.graphics.newFont("Polices/Stars Fighters Upright.ttf", 50)
        love.graphics.setFont(font)
    end
    --if (is_game and is_menu == false) then
		-- font = love.graphics.newFont("Polices/rock2.ttf", 40)
		-- love.graphics.setFont(font)
		-- love.graphics.setColor(255, 255, 255, alpha)
		-- is_letgo = true
		-- --love.graphics.draw(background_game_lv1, 0, 0, 0, 1, 1)
		-- --love.graphics.draw(objet_1, x_objet_1, y_objet_1, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
  --   	love.graphics.setColor(255, 255, 255, alpha_text)
  --   	love.graphics.printf("World 1", 80, 300, 1800, "center")
  --   	love.graphics.printf("Prehistory", 80, 450, 1800, "center")
    --end

	-- INIT
	if (init) then
		is_menu = false
		hero.x = 0
		hero.y = 900
		hero.width = 130
		hero.height = 130
		is_game = true
		init = false
		is_idle = true
		is_ground = true
		is_jump = false 
		is_run = false
		is_run_rev = false
		is_idle_rev = false
		x_background = 0
		y_background = 0
		x_background_2 = 1920
		y_background_2 = 0
		is_stop_defile = false
		rotation_objects = 0
		x_objet_1 = 300
		x_objet_2 = 500
		x_objet_3 = 700
		x_objet_4 = 900
		y_objet_1 = 780
		y_objet_2 = 800
		y_objet_3 = 800
		y_objet_4 = 800
		is_destroy_1 = false
		is_destroy_2 = false
		is_destroy_3 = false
		is_destroy_4 = false
		compteur_pieces = 0
	end

	-- IN GAME
	if (is_game and is_letgo) then
		font = love.graphics.newFont("Polices/rock2.ttf", 40)
		love.graphics.setFont(font)
		love.graphics.setColor(255, 255, 255, alpha)
		love.graphics.draw(background_game_lv1, -1900, 0)
		love.graphics.draw(background_game_lv1, x_background, y_background)
		love.graphics.draw(background_game_lv1, x_background_2, y_background_2)
		love.graphics.setColor(255, 255, 255, alpha_text)
    	love.graphics.printf("World 1", 80, 300, 1800, "center")
    	love.graphics.printf("Prehistory", 80, 450, 1800, "center")
		love.graphics.setColor(255, 255, 255, alpha)
		if (is_destroy_1 == false) then
			love.graphics.draw(objet_1, x_objet_1, y_objet_1, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
		end
		if (is_destroy_2 == false) then
			love.graphics.draw(objet_2, x_objet_2, y_objet_2, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
		end
		if (is_destroy_3 == false) then
			love.graphics.draw(objet_3, x_objet_3, y_objet_3, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
		end
		if (is_destroy_4 == false) then
			love.graphics.draw(objet_4, x_objet_4, y_objet_4, rotation_objects, 0.4, 0.4, 256 / 2, 256 / 2)
		end
		local framearrondie = math.floor(hero.frame)
		love.graphics.print("Press ESC to pause", 0, 0)

		if (is_idle and is_idle_rev == false and is_jump == false and is_ground == true) then
			love.graphics.draw(hero.images_idle_dino[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
		if (is_idle_rev and is_idle == false and is_run_rev == false and is_jump == false and is_ground == true) then
			love.graphics.draw(hero.images_idle_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end

		if (is_run and is_idle == false and is_jump == false and is_ground == true) then
			love.graphics.draw(hero.images_dino_run[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
		if (is_run_rev and is_idle_rev == false and is_jump == false and is_ground == true) then
			love.graphics.draw(hero.images_run_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
		if (is_jump and is_jump_rev == false and is_ground == false) then
			love.graphics.draw(hero.images_jump_dino[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
		if (is_jump_rev and is_jump_rev == false and is_ground == false) then
			love.graphics.draw(hero.images_jump_dino_rev[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
	end

	-- IN PAUSE
	if (is_pause) then
		love.graphics.draw(pause, 0, 0)
	end
end

function move_hero(x, y, dt)

	-- GAUCHE
	if (love.keyboard.isDown('q')) then
		if (is_stop_defile == false) then
			x_background = x_background + 200 * dt
			x_background_2 = x_background_2 + 200 * dt
			x_objet_1 = x_objet_1 + 200 * dt
			x_objet_2 = x_objet_2 + 200 * dt
			x_objet_3 = x_objet_3 + 200 * dt
			x_objet_4 = x_objet_4 + 200 * dt
		end
		is_jump = false
		is_ground = true
		is_idle = false
		is_run = false
		is_run_rev = true
		is_idle_rev = false
		hero.x = hero.x - speed
		hero.frame = hero.frame + 5 * dt
		if (hero.frame >= #hero.images_run_dino_rev + 1) then
			hero.frame = 1
		end
		function love.keyreleased(key)
			if (key == 'q') then
				is_idle_rev = true
				is_idle = false
				is_run = false
				is_run_rev = false
			end
			if (key == 'd') then
				is_idle = false
				is_idle_rev = true
				is_run = false
				is_run_rev = false
			end
		end
		if (love.keyboard.isDown('q') and love.keyboard.isDown('d')) then
			is_run = false
			is_run_rev = false
			is_idle = false
			is_idle_rev = true
		end
	end

	-- DROITE
	if (love.keyboard.isDown('d')) then
		if (is_stop_defile == false) then
			x_background = x_background - 200 * dt
			x_background_2 = x_background_2 - 200 * dt
			x_objet_1 = x_objet_1 - 200 * dt
			x_objet_2 = x_objet_2 - 200 * dt
			x_objet_3 = x_objet_3 - 200 * dt
			x_objet_4 = x_objet_4 - 200 * dt
		end
		is_ground = true
		is_jump = false
		is_idle = false
		is_run_rev = false
		is_run = true
		is_idle_rev = false
		hero.x = hero.x + speed
		hero.frame = hero.frame + 5 * dt
		if (hero.frame >= #hero.images_dino_run + 1) then
			hero.frame = 1
		end
		function love.keyreleased(key)
			if (key == 'd') then
				is_idle_rev = false
				is_idle = true
				is_run = false
				is_run_rev = false
			end
			if (key == 'q') then
				is_idle_rev = false
				is_idle = true
				is_run = false
				is_run_rev = false
			end
		end
		if (love.keyboard.isDown('q') and love.keyboard.isDown('d')) then
			is_run = false
			is_run_rev = false
			is_idle = true
			is_idle_rev = false
		end
	end
end

function mouse_pos_menu(x, y)
	function love.mousepressed(x, y, button)
		-- POS RECT PLAY
		if (x > 386 and x < 691 and y > 70 and y < 255 and button == 1) then
			init = true
	    	is_menu = false
			is_game = false
	    end

	    -- POS RECT QUIT
	    if (x > 370 and x < 715 and y > 349 and y < 534 and button == 1) then
	    	love.event.quit()
	    end
	end
end

function mouse_pos_pause(x, y)
	-- POS RECT RESUME
	function love.mousepressed(x, y, button)
		if (x > 427 and x < 710 and y > 249 and y < 249 + 135 and button == 1) then
			is_pause = false
	    	is_menu = false
			is_game = true
	    end

	    -- POS RECT MENU
	    if (x > 517 and x < 722 and y > 451 and y < 574 and button == 1) then
	    	is_pause = false
	    	is_game = false
	    	is_menu = true
	    end
	end
end

function collide_hero(x, y)
	if (hero.x + hero.width >= x_objet_4 and hero.x <= x_objet_4 + hero.width and y_objet_4 >= hero.y - 100 and y_objet_4 <= hero.y + hero.height) then
		is_destroy_4 = true
		compteur_pieces = compteur_pieces + 1
	end
	if (hero.x + hero.width >= x_objet_3 and hero.x <= x_objet_3 + hero.width and y_objet_3 >= hero.y - 100 and y_objet_3 <= hero.y + hero.height) then
		is_destroy_3 = true
	end
	if (hero.x + hero.width >= x_objet_2 and hero.x <= x_objet_2 + hero.width and y_objet_2 >= hero.y - 100 and y_objet_2 <= hero.y + hero.height) then
		is_destroy_2 = true
	end
	if (hero.x + hero.width >= x_objet_1 and hero.x <= x_objet_1 + hero.width and y_objet_1 >= hero.y - 100 and y_objet_1 <= hero.y + hero.height) then
		is_destroy_1 = true
		compteur_pieces = compteur_pieces + 1
	end
	print(compteur_pieces)

end

function love.keypressed(key)
	-- PAUSE SOUND_MENU
	if (love.keyboard.isDown('o')) then
		son_credit:pause()
	end
	if(is_credit) then
	   if key == "escape" then
			love.audio.setVolume(1.0)
			sound_fx:play()
	       	is_credit = false
	       	is_menu = true
	       	is_option = false
	       	is_play = false
	   	end
	end
	if(is_option) then
	   if key == "escape" then
	       	love.audio.setVolume(1.0)
			sound_fx:play()
	       	is_credit = false
	       	is_menu = true
	       	is_option = false
	       	is_play = false
	    end
	end
	if (is_menu) then
		if key == "return" and h == 755 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			love.event.quit()
		end
		if key == "return" and h == 645 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_credit = true
			is_menu = false
	       	is_option = false
		end
		if key == "return" and h == 535 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_credit = false
			is_menu = false
			is_game = false
			is_option = true
		end
		if key == "return" and h == 425 then
			love.audio.setVolume(1.0)
			enter_fx:play()
			is_option = false
			is_menu = false
			is_music = false
			is_credit = false
			is_game = true
			init = true
			is_letgo = true
		end
		if key == "down" and h <= 675 then
			h = h + 110
			love.audio.setVolume(1.0)
			sound_fx:play()
		end
		if key == "up" and h >= 515 then
			h = h - 110
			love.audio.setVolume(1.0)
			sound_fx:play()
		end
	end

	-- PLAY SOUND_MENU
	if (love.keyboard.isDown('p')) then
		son_credit:play()
	end
	-- JUMP
	if (love.keyboard.isDown('space')) then
		is_jump = true
		is_ground = false
		is_idle = false
		is_idle_rev = false
		is_run_rev = false
		is_run = false
	end
end
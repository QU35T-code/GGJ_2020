-- VARIABLES
local x, y
local is_menu = true
local is_game = false
local is_pause = false
local init = false
local is_run = false
local is_idle = true

-- SCREEN SIZE
love.window.setMode(1920, 1080, fullscreen)
width = love.graphics.getWidth()
height = love.graphics.getHeight()
print(width)
print(height)


-- OBJET HERO
hero = {}
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
speed = 1

function love.load()
	-- LOAD WINDOW
	love.window.setTitle("Santa_Claus")

	-- LOAD IMAGES
	menu = love.graphics.newImage("Images/Menu.png")
	hero_dino = love.graphics.newImage("Dino_time/sprites/Idle/Idle_1.png")
	pause = love.graphics.newImage("Images/Pause.png")
	background = love.graphics.newImage("Images/background.jpg")

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
	-- hero.images_idle_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_1.png")
	-- hero.images_idle_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_2.png")
	-- hero.images_idle_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_3.png")
	-- hero.images_idle_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_4.png")
	-- hero.images_idle_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_5.png")
	-- hero.images_idle_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_6.png")
	-- hero.images_idle_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_7.png")
	-- hero.images_idle_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_8.png")
	-- hero.images_idle_dino_rev[9] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_9.png")
	-- hero.images_idle_dino_rev[10] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_10.png")

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
	-- hero.images_run_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_1.png")
	-- hero.images_run_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_2.png")
	-- hero.images_run_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_3.png")
	-- hero.images_run_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_4.png")
	-- hero.images_run_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_5.png")
	-- hero.images_run_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_6.png")
	-- hero.images_run_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_7.png")
	-- hero.images_run_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_8.png")

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
	-- hero.images_die_dino_rev[1] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_1.png")
	-- hero.images_die_dino_rev[2] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_2.png")
	-- hero.images_die_dino_rev[3] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_3.png")
	-- hero.images_die_dino_rev[4] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_4.png")
	-- hero.images_die_dino_rev[5] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_5.png")
	-- hero.images_die_dino_rev[6] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_6.png")
	-- hero.images_die_dino_rev[7] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_7.png")
	-- hero.images_die_dino_rev[8] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_8.png")

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

	-- LOAD SOUND
	sound_menu = love.audio.newSource("Musiques/menu.mp3", "stream")

	if (is_menu) then
		sound_menu:play()
		sound_menu:setLooping(true)
	end
end

function love.update(dt)
	--VARIABLES
	x, y = love.mouse.getPosition()
	
	-- MENU
	if (is_menu) then
		mouse_pos_menu(x, y)
	end

	-- IN GAME
	if (is_game) then
		sound_menu:pause()
		is_run = false
		is_idle = true
		hero.frame = hero.frame + 10*dt
		if (hero.frame >= #hero.images_idle_dino + 1) then
			hero.frame = 1
		end
		move_hero(x, y, dt)
		collide_hero(x, y)

		-- SET VAR PAUSE
		if (love.keyboard.isDown("escape")) then
			is_pause = true
			is_game = false
			is_menu = false
		end
	end

	-- IN PAUSE
	if (is_pause) then
		sound_menu:pause()
		mouse_pos_pause(x, y)
	end

end

function love.draw()
	-- MENU
	if (is_menu) then
		love.graphics.draw(menu, 0, 0)
		love.graphics.print("Press 'o' to pause", 0, 0)
		love.graphics.print("Press 'p' to play", 0, 20)
	end

	-- INIT
	if (init) then
		hero.x = 0
		hero.y = height
		hero.width = 80
		hero.height = 88
		is_game = true
		init = false
		is_idle = true
		is_run = false
	end

	-- IN GAME
	if (is_game) then
		love.graphics.draw(background, 0, -279, 0, 0.6, 0.6)
		local framearrondie = math.floor(hero.frame)
		love.graphics.print("Press ESC to pause", 0, 0)
		if (is_idle) then
			love.graphics.draw(hero.images_idle_dino[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end

		if (is_run) then
			love.graphics.draw(hero.images_dino_run[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end
	end

	-- IN PAUSE
	if (is_pause) then
		love.graphics.draw(pause, 0, 0)
	end
end

function move_hero(x, y, dt)
	-- AVANCER
	if (love.keyboard.isDown('z') or love.keyboard.isDown('up')) then
		hero.y = hero.y - speed / 2
	end

	-- RECULER
	if (love.keyboard.isDown('s') or love.keyboard.isDown('down')) then
		hero.y = hero.y + speed
	end

	-- GAUCHE
	if (love.keyboard.isDown('q') or love.keyboard.isDown('left')) then
		hero.x = hero.x - speed
	end

	-- DROITE
	if (love.keyboard.isDown('d') or love.keyboard.isDown('right')) then
		is_idle = false
		is_run = true
		hero.x = hero.x + speed
		hero.frame = hero.frame + 10*dt
		if (hero.frame >= #hero.images_dino_run + 1) then
			hero.frame = 1
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
	-- GAUCHE
	if (hero.x <= 0 - 30) then
		hero.x = - 30
	end

	-- DROITE
	if (hero.x >= width - hero.width) then
		hero.x = width - hero.width
	end

	-- HAUT
	--[[if (hero.y <= 556) then
		hero.y = 556
	end--]]

	-- BAS
	--[[if (hero.y >= height - hero.height) then
		hero.y = height - hero.height
	end--]]
end

function love.keypressed(key)
	-- PAUSE SOUND_MENU
	if (love.keyboard.isDown('o')) then
		sound_menu:pause()
	end

	-- PLAY SOUND_MENU
	if (love.keyboard.isDown('p')) then
		sound_menu:play()
	end
end
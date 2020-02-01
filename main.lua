-- VARIABLES
local x, y
local is_menu = true
local is_game = false
local is_pause = false
local init = false
local is_run = false
local is_idle = true

-- SCREEN SIZE
width = love.graphics.getWidth()
height = love.graphics.getHeight()

-- OBJET HERO
hero = {}
hero.images_idle = {}
hero.images_idle_rev = {}
hero.images_run = {}
hero.images_run_rev = {}
hero.frame = 1
hero.x = width / 2
hero.y = height / 2 - 105
hero.width = 80
hero.height = 88
speed = 0.4

function love.load()
	-- LOAD WINDOW
	love.window.setTitle("Santa_Claus")
	love.window.setMode(800, 600)

	-- LOAD IMAGES
	menu = love.graphics.newImage("Images/Menu.png")
	santa = love.graphics.newImage("sprites/Idle (1).png")
	pause = love.graphics.newImage("Images/Pause.png")
	background = love.graphics.newImage("Images/background.jpg")

	-- LOAD IDLE
	hero.images_idle[1] = love.graphics.newImage("sprites/Idle (1).png")
	hero.images_idle[2] = love.graphics.newImage("sprites/Idle (2).png")
	hero.images_idle[3] = love.graphics.newImage("sprites/Idle (3).png")
	hero.images_idle[4] = love.graphics.newImage("sprites/Idle (4).png")
	hero.images_idle[5] = love.graphics.newImage("sprites/Idle (5).png")
	hero.images_idle[6] = love.graphics.newImage("sprites/Idle (6).png")
	hero.images_idle[7] = love.graphics.newImage("sprites/Idle (7).png")
	hero.images_idle[8] = love.graphics.newImage("sprites/Idle (8).png")
	hero.images_idle[9] = love.graphics.newImage("sprites/Idle (9).png")
	hero.images_idle[10] = love.graphics.newImage("sprites/Idle (10).png")
	hero.images_idle[11] = love.graphics.newImage("sprites/Idle (11).png")
	hero.images_idle[12] = love.graphics.newImage("sprites/Idle (12).png")
	hero.images_idle[13] = love.graphics.newImage("sprites/Idle (13).png")
	hero.images_idle[14] = love.graphics.newImage("sprites/Idle (14).png")
	hero.images_idle[15] = love.graphics.newImage("sprites/Idle (15).png")
	hero.images_idle[16] = love.graphics.newImage("sprites/Idle (16).png")

	-- LOAD IDLE_REV
	-- hero.images_idle_rev[1] = love.graphics.newImage("sprites/Idle (1)_rev.png")
	-- hero.images_idle_rev[2] = love.graphics.newImage("sprites/Idle (2)_rev.png")
	-- hero.images_idle_rev[3] = love.graphics.newImage("sprites/Idle (3)_rev.png")
	-- hero.images_idle_rev[4] = love.graphics.newImage("sprites/Idle (4)_rev.png")
	-- hero.images_idle_rev[5] = love.graphics.newImage("sprites/Idle (5)_rev.png")
	-- hero.images_idle_rev[6] = love.graphics.newImage("sprites/Idle (6)_rev.png")
	-- hero.images_idle_rev[7] = love.graphics.newImage("sprites/Idle (7)_rev.png")
	-- hero.images_idle_rev[8] = love.graphics.newImage("sprites/Idle (8)_rev.png")
	-- hero.images_idle_rev[9] = love.graphics.newImage("sprites/Idle (9)_rev.png")
	-- hero.images_idle_rev[10] = love.graphics.newImage("sprites/Idle (10)_rev.png")
	-- hero.images_idle_rev[11] = love.graphics.newImage("sprites/Idle (11)_rev.png")
	-- hero.images_idle_rev[12] = love.graphics.newImage("sprites/Idle (12)_rev.png")
	-- hero.images_idle_rev[13] = love.graphics.newImage("sprites/Idle (13)_rev.png")
	-- hero.images_idle_rev[14] = love.graphics.newImage("sprites/Idle (14)_rev.png")
	-- hero.images_idle_rev[15] = love.graphics.newImage("sprites/Idle (15)_rev.png")
	-- hero.images_idle_rev[16] = love.graphics.newImage("sprites/Idle (16)_rev.png")

	-- LOAD RUN
	hero.images_run[1] = love.graphics.newImage("sprites/Run (1).png")
	hero.images_run[2] = love.graphics.newImage("sprites/Run (2).png")
	hero.images_run[3] = love.graphics.newImage("sprites/Run (3).png")
	hero.images_run[4] = love.graphics.newImage("sprites/Run (4).png")
	hero.images_run[5] = love.graphics.newImage("sprites/Run (5).png")
	hero.images_run[6] = love.graphics.newImage("sprites/Run (6).png")
	hero.images_run[7] = love.graphics.newImage("sprites/Run (7).png")
	hero.images_run[8] = love.graphics.newImage("sprites/Run (8).png")
	hero.images_run[9] = love.graphics.newImage("sprites/Run (9).png")
	hero.images_run[10] = love.graphics.newImage("sprites/Run (10).png")
	hero.images_run[11] = love.graphics.newImage("sprites/Run (11).png")

	-- LOAD RUN_REV
	-- hero.images_run_rev[1] = love.graphics.newImage("sprites/Run (1)_rev.png")
	-- hero.images_run_rev[2] = love.graphics.newImage("sprites/Run (2)_rev.png")
	-- hero.images_run_rev[3] = love.graphics.newImage("sprites/Run (3)_rev.png")
	-- hero.images_run_rev[4] = love.graphics.newImage("sprites/Run (4)_rev.png")
	-- hero.images_run_rev[5] = love.graphics.newImage("sprites/Run (5)_rev.png")
	-- hero.images_run_rev[6] = love.graphics.newImage("sprites/Run (6)_rev.png")
	-- hero.images_run_rev[7] = love.graphics.newImage("sprites/Run (7)_rev.png")
	-- hero.images_run_rev[8] = love.graphics.newImage("sprites/Run (8)_rev.png")
	-- hero.images_run_rev[9] = love.graphics.newImage("sprites/Run (9)_rev.png")
	-- hero.images_run_rev[10] = love.graphics.newImage("sprites/Run (10)_rev.png")
	-- hero.images_run_rev[11] = love.graphics.newImage("sprites/Run (11)_rev.png")



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
		if (hero.frame >= #hero.images_idle + 1) then
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
			love.graphics.draw(hero.images_idle[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
		end

		if (is_run) then
			love.graphics.draw(hero.images_run[framearrondie], hero.x, hero.y - 100, 0, hero.width / 388, hero.height / 388)
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
		if (hero.frame >= #hero.images_run + 1) then
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
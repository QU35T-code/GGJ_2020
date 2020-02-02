function load_images_dino()
	-- LOAD IDLE DINO
	for i = 1 ,10 do
		hero.images_idle_dino[i] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_"..i..".png")
		hero.images_idle_dino_rev[i] = love.graphics.newImage("Dino_time/sprites/Idle_rev/Idle_"..i..".png")
	end

	-- LOAD RUN AND DIE DINO
	for i = 1 ,8 do
		hero.images_dino_run[i] = love.graphics.newImage("Dino_time/sprites/Run/Run_"..i..".png")
		hero.images_run_dino_rev[i] = love.graphics.newImage("Dino_time/sprites/Run_rev/Run_"..i..".png")
		hero.images_die_dino[i] = love.graphics.newImage("Dino_time/sprites/Die/Dead_"..i..".png")
		hero.images_die_dino_rev[i] = love.graphics.newImage("Dino_time/sprites/Die_rev/Dead_"..i..".png")
	end

	-- LOAD JUMP DINO
	for i = 1 ,12 do
		hero.images_jump_dino[i] = love.graphics.newImage("Dino_time/sprites/Jump/Jump_"..i..".png")
	end

	-- LOAD JUMP DINO REV
	-- for i = 1 ,12 do
	-- 	hero.images_jump_dino_rev[i] = love.graphics.newImage("Dino_time/sprites/Idle/Idle_"..i..".png")
	-- end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function load_images_annexe()
	background_menu = love.graphics.newImage("Images/menu_background.jpg")
	background_game_lv1 = love.graphics.newImage("Images/background.png")
	background_game_lv2 = love.graphics.newImage("Images/lv2.jpg")
	pause = love.graphics.newImage("Images/pause.png")
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function load_objets()
	cursor = love.graphics.newImage("Images/pointer.png")
    zqsd = love.graphics.newImage("Images/zqsd.jpg")
	font = love.graphics.newFont("Polices/Stars Fighters Upright.ttf", font_size)
	love.graphics.setFont(font)
	for i = 1 ,4 do
		Objets[i] = love.graphics.newImage("Objets/objet_"..i..".png")
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function load_sounds()
	sound_fx = love.audio.newSource("Musiques/sound_check_menu.mp3", "stream")
	enter_fx = love.audio.newSource("Musiques/enter.mp3", "stream")
	son_credit = love.audio.newSource("Musiques/credits.mp3", "stream")
	if (is_menu) then
		love.audio.setVolume(0.5)
		son_credit:play()
		son_credit:setLooping(true)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

function set_credits_and_transitions()
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
end

------------------------------------------------------------------------------------------------------------------------------------------------------------


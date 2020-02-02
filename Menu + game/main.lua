
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

require('Source/function_load')
require('Source/constants')
require('Source/function_update')
require('Source/function_draw')
require('Source/init_var')
require('Source/move_hero')
require('Source/function_keypressed')

-----------------------------------------------------------------------------------------------------------------------------------------

function love.load()
	love.window.setTitle("Run In Time")
	load_images_annexe()
	load_images_dino()
	load_objets()
	load_sounds()
	set_credits_and_transitions()
end

function love.update(dt)
	scroll_credit()
	transition_menu_level1(dt)
	if (is_game) then
		son_credit:pause()
		animations_frame(10, hero.images_idle_dino, dt)
		move_hero(x, y, dt)
		jump(dt)
		collide_hero(x, y)
		objets(dt)
		set_background_level(x_background_2, x_background)
	end
	scroll_camera(dt)
end

function love.draw()
	menu_draw()
	credits_draw()
    options_draw()
	if (is_validate and is_game == false and is_menu == false) then
		love.graphics.draw(background_game_lv2, 0, 0)
	end
	if (is_game and is_menu == false) then
		transition_text()
		objets_draw()
		love.graphics.print("Press ESC to pause", 0, 0)
		hero_draw()
	end
	if (is_pause) then
		pause_draw()
	end
end

function move_hero(x, y, dt)
	left_move(dt)
	right_move(dt)
end

function collide_hero(x, y)
	if (hero.x + hero.width >= x_objet_4 and hero.x <= x_objet_4 + hero.width and y_objet_4 >= hero.y - 100 and y_objet_4 <= hero.y + hero.height) then
		is_destroy_4 = true
		compteur_piece_4 = 1
	end
	if (hero.x + hero.width >= x_objet_3 and hero.x <= x_objet_3 + hero.width and y_objet_3 >= hero.y - 100 and y_objet_3 <= hero.y + hero.height) then
		is_destroy_3 = true
		compteur_piece_3 = 1
	end
	if (hero.x + hero.width >= x_objet_2 and hero.x <= x_objet_2 + hero.width and y_objet_2 >= hero.y - 100 and y_objet_2 <= hero.y + hero.height) then
		is_destroy_2 = true
		compteur_piece_2 = 1
	end
	if (hero.x + hero.width >= x_objet_1 and hero.x <= x_objet_1 + hero.width and y_objet_1 >= hero.y - 100 and y_objet_1 <= hero.y + hero.height) then
		is_destroy_1 = true
		compteur_piece_1 = 1
	end
end

function love.keypressed(key)
	if (love.keyboard.isDown("escape") and is_game == true) then
		is_pause = true
		is_game = false
		is_menu = false
	end
	options_menu_annexe(key)
	if (love.keyboard.isDown('space')) then
		is_jump = true
		is_ground = false
		is_idle = false
		is_idle_rev = false
		is_run_rev = false
		is_run = false
	end
	if (is_menu) then
		options_menu(key)
	end
end
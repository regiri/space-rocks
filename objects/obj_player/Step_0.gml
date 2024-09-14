/// @description каждый фреим
// You can write your code in this editor

self.speed = (self.speed + player_acceleration) * PLAYER_DECCELERATION;

if (keyboard_check(vk_space) and shooting_ready) {
	var _bullet = instance_create_depth(self.x, self.y, 1, obj_bullet);
	with (_bullet)
	{
	    speed = BULLET_SPEED;
	    direction = other.direction;
		image_angle = random(360);
	}
	alarm[0] = game_get_speed(gamespeed_fps) * 0.2;
	shooting_ready = false;
}

if (rock_ready) {
	var _coord_x, _coord_y;
	if (random(1)) {
		_coord_x = random(room_width);
		_coord_y = choose(-ROCK_SCREEN_OFFSET, room_height + ROCK_SCREEN_OFFSET);
	} else {
		_coord_x = choose(-ROCK_SCREEN_OFFSET, room_width + ROCK_SCREEN_OFFSET);
		_coord_y = random(room_height);
	}
	var _rock = instance_create_depth(
		_coord_x,
		_coord_y,
		1,
		choose(obj_big_rock, obj_small_rock, obj_small_rock)
	);
	with (_rock) {
		speed = random_range(other.min_rock_speed, other.max_rock_speed);
		direction = point_direction(
			x,
			y,
			other.x + other.rock_direction_area * choose(-1, 1),
			other.y + other.rock_direction_area * choose(-1, 1)
		);
		image_angle = random(360);
	}
	alarm[1] = game_get_speed(gamespeed_fps) * max(0, rock_spawn_mean + random_range(-1, 1));
	rock_ready = false;
}
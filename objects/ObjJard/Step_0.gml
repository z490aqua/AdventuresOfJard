/// @description Insert description here
// You can write your code in this editor


var _right = (keyboard_check(vk_right) or keyboard_check(ord("D")) /* && place_free(x + (attribute_speed + 2), y) */)
var _left = (keyboard_check(vk_left) or keyboard_check(ord("A")) /* && place_free(x + (-attribute_speed - 2), y) */)
// var _up = (keyboard_check(vk_up) or keyboard_check(ord("W")));

	move_x = _right - _left;
if (place_meeting(x, y+2, objCollision)) 
{
	move_x *= attribute_speed;
	speedTicker = 1
}
else
{
	if (move_x <= attribute_speed)
	{
		
	}
	else
	{
	move_x += 0.777 * speedTicker;
	speedTicker++
	}
	
}



if (place_meeting(x, y+2, objCollision))
{
	coyoteFrame = 0;
}
else
{
	coyoteFrame++;
}



if (place_meeting(x, y+2, objCollision))
{
	doubleJumps = maxDoubleJumps;
	move_y = 0;
	if (!place_meeting(x+move_x, y+2, objCollision) && place_meeting(x+move_x, y+10, objCollision))
	{
			move_y = abs(move_x);
			move_x = 0;
	}
	if (keyboard_check(vk_space)) 
	{
		move_y = -attribute_jumpSpeed;
		isSpaceHeld = true;
	}
}
else if (coyoteFrame <= maxCoyoteTime && keyboard_check(vk_space) && !isSpaceHeld)
{
	doubleJumps = maxDoubleJumps;
	move_y = 0;
	if (!place_meeting(x+move_x, y+2, objCollision) && place_meeting(x+move_x, y+10, objCollision))
	{
			//move_y = abs(move_x);
			move_x *= 0;
	}
	move_y = -attribute_jumpSpeed;
	isSpaceHeld = true;
	
}
else if (doubleJumps > 0 && keyboard_check(vk_space) && isSpaceHeld == false)
{
	move_y = -attribute_jumpSpeed;	
	doubleJumps--;
	slime -= 5;
}
else if (move_y < attribute_maxFallSpeed) move_y += attribute_gravity;



move_and_collide(move_x, move_y, objCollision);
//if (move_x != 0) image_xscale = sign(move_x);


if (keyboard_check_released(vk_space)) isSpaceHeld = false;


#region animations
//////////////animation

if(_right)
{
	image_speed = attribute_speed / 10;
	sprite_index = sprJardR;
}

if(_left)
{
	image_speed = attribute_speed / 10;
	sprite_index = sprJardL;
}

if(!_left && !_right)
{
	image_speed = 0;
	image_index = 0;
}
#endregion

#region parallax
var _cam_x = camera_get_view_x(view_camera[0]) ;
layer_x("parallax_background_1", _cam_x * 0.25); // Change the background layer name to whatever you use in the room editor
layer_x("parallax_background_2", _cam_x * 0.5);   // Change the 0.25 and 0.5 values to change the speed of the effect
#endregion
function cost = obj_fun(dx, dy)

%   Objective function
%   This function computes the launch kinetic energy of the projectile
%   Goal : to minimize the initial launch energy, subject to the
%   constraint of the target position

%   Nomenclature
%   Input 
%   dx: horizontal velocity
%   dy: verical velocity
%   Output
%   cost: kinetic energy of the projectile


vx_0 = dx; 
vy_0 = dy;
cost = 0.5*(vx_0.*vx_0+vy_0.*vy_0); % assuming projectile mass = 1

end
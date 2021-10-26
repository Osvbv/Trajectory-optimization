function dx_vect = dyn_fun(~, x_vect, param)

% This function computes the dynamics of a projectile subject only to
% gravity
%
% Nomenclature.
% Inputs:
%   ~ = [1 x N] time vector (not used)
%   x_vect = [4 x N] state vectory
%       x_vect(1,:) = x = horizontal position
%       x_vect(2,:) = y = vertical position
%       x_vect(3,:) = dx = horizontal speed
%       x_vect(4,:) = dy = vertical speed
% Outputs:
%   dx_vect = d(x_vect)/dt = time-derivative of the state
%

dx_vect = zeros(size(x_vect));

%First-order form (derivative of position states is velocity states)
dx_vect(1:2,:) = x_vect(3:4,:);

% Compute the speed 
vx = x_vect(3,:);
vy = x_vect(4,:);
v = sqrt(vx.*vx + vy.*vy); 

% Compute the force vectors
fx = 0;
fy = -param.g;  

% Record the accelerations (derivative of velocity states)
dx_vect(3,:) = fx;  %Assume unit point-mass
dx_vect(4,:) = fy;  %Assume unit point-mass

end

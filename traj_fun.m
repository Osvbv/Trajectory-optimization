function sol = traj_fun(input, param)

% Function simulating the trajectory of the projectile and solving
% the dynamics with ode45

v0 = input.vmag;
th0 = input.theta;
tflight = input.tflight;
nGrid = param.nGrid;

% Set up initial conditions for ode45
x0 = 0;  y0 = 0;  %Start at the origin
dx0 = v0*cos(th0);
dy0 = v0*sin(th0);
if dy0 < 0, error('Cannot point cannon through ground! sin(th0) > 0 required.');
end

% Solve with ode45
userFun = @(t, x) dyn_fun(t, x, param);  
tSpan = [0, tflight];         %Never plan on reaching final time
x0 = [x0; y0; dx0; dy0];  %Initial condition
solution = ode45(userFun, tSpan, x0);


% Extract the solution on uniform grid:
sol.t = linspace(solution.x(1), solution.x(end), nGrid);
xx = deval(solution, sol.t);
sol.x = xx(1,:); 
sol.y = xx(2,:); 
sol.dx = xx(3,:); 
sol.dy = xx(4,:); 

end
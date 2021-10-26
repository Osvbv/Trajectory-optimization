function [cneq, ceq] = nl_cons(var_input, target, param)

x0  = 0;
y0  = 0;  %Trajectory starts at the origin
dx0 = var_input(1); 
dy0 = var_input(2); 
T   = var_input(3);  %Unpack decision variables

nGrid = param.nGrid;
tSpan = linspace(0, T, nGrid);  %Build grid in time

userFun = @(t, x) dyn_fun(t, x, param);  
x_0 = [x0; y0; dx0; dy0];  %Initial condition
solution = ode45(userFun, tSpan, x_0);

t = linspace(solution.x(1), solution.x(end), nGrid);
xsol = deval(solution, t);

xfinal = xsol(1,end);
yfinal = xsol(2,end);

cneq = [];  %No inequality constraints
ceq = [xfinal - target.x; yfinal - target.y];  %Boundary Condition

end

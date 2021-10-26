function [xSoln] = main_shooting(input, param, target)

% This function uses single shooting to solve the cannon problem.
%
% INPUTS:
%   input.vmag
%   input.theta
%   target.x
%   target.y
%   param.nGrid = number of grid points for the integration method
%
% OUTPUTS:
%   soln.t
%   soln.x
%   soln.y
%   soln.dx
%   soln.dy
%

% Obtain realistic initial conditions
traj = traj_fun(input, param);

guess.dx0 = traj.dx(1);  %Initial horizontal speed
guess.dy0 = traj.dy(1);  %Initial vertical speed
guess.t   = traj.t(end); %Time of flight

% compute the optimal launch conditions and time of flight

problem.x0    = [guess.dx0; guess.dy0; guess.t];
problem.Aineq = []; 
problem.Bineq = [];  % no linear inequality constraints
problem.Aeq   = []; 
problem.Beq   = [];  % no equality constraints
problem.lb    = [];  % no lower bound on the unknown variables
problem.ub    = [];  % no upper bound on the unknown variables

problem.solver = 'fmincon';
problem.options = optimset(...
        'Display','iter',...
        'MaxIter',50);

problem.objective = @(var_input) obj_fun(var_input(1), var_input(2));  %Objective (cost) function
problem.nonlcon  = @(var_input) nl_cons(var_input, target, param);     %NonLinear constraints

[xSoln, fVal, exitFlag] = fmincon(problem);

end
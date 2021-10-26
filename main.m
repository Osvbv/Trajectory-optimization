clear all
close all
clc

%    Main program.
%    Goal: computation of velocity and direction of shooting of a projectile 
%    so that a particular target is hit, while minimizing the energy. 

%   Nomenclature

%   tflight     : time of flight
%   var_input   : input vectors containing the unknown variables to be
%                 determined by optimization - 1) time of flight 
%                                              2) velocity x component
%                                              3) velocity y component
%   _0          : initial guess
%   xsol output : xsol(1) - xvel
%                 xsol(2) - yvel
%                 xsol(3) - t

%Provide an initial guess for the solver
input.vmag = 50;
input.theta = 45*pi/180;
input.tflight = 5;

% Set the target (assuming that the trajectory starts at x=0, y=0)
target.x = 50;  
target.y = 50;

% Set up the parameters for the dynamics function:
param.g = 9.81; 
param.nGrid = 200; 

[xsol] = main_shooting(input, param, target);

sprintf("The optimal time of fligth is: %.2f s",xsol(3))
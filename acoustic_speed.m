function [acoust_speed] = acoustic_speed(inputArg1,inputArg2)
%ACOUSTIC_SPEED Summary of this function goes here
%   Detailed explanation goes here
acoust_speed = 1448.96 + 4.591*T - 5.304*10^-2*T^2 + 2.374*10^-4*T^3 + 1.34*(S-35) ...
    + 1.63*10^-2*D + 1.675*10^-7*D^2 - 1.025*10^-2*T*(S-35) - 7.139*10^-13*D^3;
% Where T, S, and D denotes temperature, salinity, and depth, respectively.
% This expression is valid for the following condition:
% 0<= T <= 30 (degree celcius; 30 <= S <= 40 (in PPT); 0 <= D <= 8000
% (metres)
end


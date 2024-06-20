function [noise] = noise()
%NOISE Summary of this function goes here
%   Detailed explanation goes here
% For underwater scenario noise can be obtained as follows:
noise_turb=rand*10+1;noise_ship=rand*10+1;noise_wave=rand*10+1; noise_thermal=rand*10+1;    
noise = noise_turb + noise_ship + noise_wave + noise_thermal;
end


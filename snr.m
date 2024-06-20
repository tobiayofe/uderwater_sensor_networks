function [snr] = snr(t_power,attenuation,di)
%SNR Summary of this function goes here
%   Detailed explanation goes here
% SNR (Signal to noise ratio can be obtained using parameters such as
    % t_power, attenuation (over a distance d), noise and directivity index di
    snr = t_power-attenuation-noise+di;


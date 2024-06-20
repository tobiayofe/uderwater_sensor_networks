function [attenuation] = attenuation(d,k, alpha)
%ATTENUATION Summary of this function goes here
% 10logA(d,f) = k.10logd + d.10logalpha(f)
attenuation = 10^( ( k*10*log10(d) + d*10*log10(alpha) )/10 );

% Where k=1 is cylindrical spreading in shallow water region
% k=1.5 is practical spreading
% and k=2 is spherical spreading in deep water region
end


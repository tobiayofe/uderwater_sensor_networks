function [w_depth] = forwarder_select(alpha,hop0,hop1)
%FORWARDER_SELECT Summary of this function goes here
%   The criteria for the selection of forwarder are weighting depth
%   difference similar to WDFAD-DPR (Pg 8, Wadud et al., (2019) 
%-  An Energy Balanced Efficient and Reliable Routing Protocol for
%   Underwater Wireless Sensor Networks 
w_depth = alpha*hop0 + (1-alpha)*hop1;
end

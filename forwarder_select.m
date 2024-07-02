function [w_depth] = forwarder_select(alpha,hop0,hop1)
 
w_depth = alpha*hop0 + (1-alpha)*hop1;
end

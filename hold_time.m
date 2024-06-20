function [t_of_ff] = hold_time(t_range,speed_of_sound,beta,ff1,ff2)
k_of_ff = -(2*t_range/speed_of_sound)/(ff1-ff2);
t_of_ff = k_of_ff + beta;
end


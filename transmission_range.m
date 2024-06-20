function [t_range] = transmission_range(t_power,k)
    % Transmission range t_range of a node is directly proportional to the transmit power t_power of
    % the node
    t_range = k*t_power;
    % A receiver can correctly decode a signal if SNR is greater than a
    % threshold power
    attenuation=rand; di=rand;
    thresh_power = floor( rand*20+1);
    if snr(t_power,attenuation,di)>= thresh_power
       decode_message(); 
    end
end


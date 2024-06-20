classdef Channel
    %CHANNEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        nodes_in_range = [];
    end
    
    methods
        function obj = Channel(inputArg1,inputArg2)
            %CHANNEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        % Calculate speed of acoustic signal
        function [c] = acoustic_speed(~)
            % Constants and parameters
            T = 25; % Temperature in Celsius
            S = 35; % Salinity in parts per thousand
            D = 1000; % Depth of water in meters
            f = 1000; % Frequency of the acoustic signal in Hz
            k = 1.5; % Spreading coefficient
            c = 1448.96 + 4.591*T - 5.304e-2*T^2 + 2.374e-4*T^3 + 1.340*(S - 35) + 1.63e-2*D + 1.675e-7*D^2 - 1.025e-2*T*(S - 35) - 7.139e-13*D^3;
            disp(['Speed of acoustic signal in water: ', num2str(c), ' m/s']);
        end
        
        function A = attenuation(~)
            % Calculate attenuation loss
            c = obj.acoustic_speed();
            A = k*10*log10(D) + D*10*log10(c);
        end
end
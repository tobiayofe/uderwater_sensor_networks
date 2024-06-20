function [ff] = fitness_function(weighting_depth,energy,pfn_count)
clc;
ff = weighting_depth/( 1 + (energy*pfn_count) );
end


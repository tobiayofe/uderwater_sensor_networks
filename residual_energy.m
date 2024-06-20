function [residual_energy] = residual_energy(node_energy,init_energy)
residual_energy = 1-(node_energy/init_energy);
end


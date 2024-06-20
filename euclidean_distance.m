function [Ed] = euclidean_distance(x,y,z)
% The parameters x,y, and j comes in pairs
% i.e. xi,xj; yi,yj; zi,zj
Ed = ( (x(1)-x(2))^2 + (y(1)-y(2))^2 + (z(1)-z(2))^2)^0.5;
end


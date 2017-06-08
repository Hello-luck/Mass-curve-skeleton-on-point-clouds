function [ result ] = f2( P,in )
%F2 Summary of this function goes here
%   Detailed explanation goes here
    
    p = P(in,:);
    x = 0;  y = 0;  z = 0;
    for i=1:length(in)
        x = x + p(i,1);
        y = y + p(i,2);
        z = z + p(i,3);
    end
    x = x / length(in);
    y = y / length(in);
    z = z / length(in);
    result = [x y z];
end


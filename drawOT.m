function [] = drawOT( T,points )
%DRAWOT Summary of this function goes here
%   Detailed explanation goes here

    for i =1:size(T,2)
        t = T(:,i);
        t(t < 10e-7) =0;
        l = find(t > 0);
        if (length(l) > 1)
            hold on
            plot3(points(i,1),points(i,2),points(i,3),'.','color',[0 0 1],'MarkerSize',10);
        end
    end
end


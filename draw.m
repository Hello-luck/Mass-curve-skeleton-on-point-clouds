function [  ] = draw( skel,adj )
%DRAW Summary of this function goes here
%   Detailed explanation goes here

    for i=1:size(skel,1)
        l = find(adj(i,:) == 1);
        du = length(l);
        if du == 1
            hold on
            plot3([skel(i,1) skel(l,1)],[skel(i,2) skel(l,2)],[skel(i,3) skel(l,3)],'color',[1 0 0],'LineWidth',2);
        end
        if du == 2
            hold on
            plot3([skel(i,1) skel(l(1),1)],[skel(i,2) skel(l(1),2)],[skel(i,3) skel(l(1),3)],'color',[1 0 0],'LineWidth',2);
            hold on
            plot3([skel(i,1) skel(l(2),1)],[skel(i,2) skel(l(2),2)],[skel(i,3) skel(l(2),3)],'color',[1 0 0],'LineWidth',2);
        end
    end
end




function [ newSkel ] = findSkel( X,skel,adj )
%FINDSKEL Summary of this function goes here
%   Detailed explanation goes here
    %X 当前中心 skel骨架集合
    %将当前中心集合中符合要求的点加入骨架集合
    
    for i=1:size(X,1)
        l = find(adj(i,:) == 1);
        if length(l) <= 2
            x = X(l,:);
            skel = [skel;x];
        end
    end
    newSkel = skel;
end


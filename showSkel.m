function [ adj ] = showSkel( P,skel )
%SHOWSKEL Summary of this function goes here
%   Detailed explanation goes here
    % P点云 skel骨架
    
    idx = findNei(P,skel);  %nei N*1矩阵
    adj = zeros(size(skel,1),size(skel,1));
    for i=1:size(skel,1)
        nei = find(idx == i);   %邻域
        p = P(nei,:);
        d = pdist2(p,p);    %点点之间的距离
        pingjunzhi = mean(d(:));
        for j=1:size(skel,1)
            if i ~= j
                nei2 = find(idx == j);
                p2 = P(nei2,:);
                d = pdist2(p,p2);
                l = length(find(d <= pingjunzhi * 0.8));
                if l > 0
                    adj(i,j) = 1;
                end
            end
        end
    end
end


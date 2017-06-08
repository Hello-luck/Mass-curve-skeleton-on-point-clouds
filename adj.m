function [ result ] = adj( P,X,idx )
%ADJ Summary of this function goes here
%   Detailed explanation goes here
    %P point cloud X sample point
    result = zeros(size(X,1),size(X,1));
    for i=1:size(X,1)
        nei = find(idx == i);   %邻域
        p = P(nei,:);
        d = pdist2(p,p);    %点点之间的距离
        pingjunzhi = mean(d(:));
        for j=1:size(X,1)
            if i ~= j
                nei2 = find(idx == j);
                p2 = P(nei2,:);
                d = pdist2(p,p2);
                l = length(find(d <= pingjunzhi));
                if l > 0
                    result(i,j) = 1;
                end
            end
        end
    end
end


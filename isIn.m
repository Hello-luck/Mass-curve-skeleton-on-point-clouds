function [ skel ] = isIn( skel )
%ISIN 此处显示有关此函数的摘要
%   此处显示详细说明
%    删除skel中重复的点
    k = [];
    for i=1:size(skel,1)
        for j=i+1:size(skel,1)
            if skel(i,1) == skel(j,1) && skel(i,2) == skel(j,2) && skel(i,3) == skel(j,3)
                k = [k i];
            end
        end
    end
    skel(k,:) = []; 
end


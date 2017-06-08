function [ P ] = deletePoint( P,idx,adj )
%DELETEPOINT Summary of this function goes here
%   Detailed explanation goes here

    deleteIndex = zeros(size(P,1),1);

    for i=1:size(adj,1)
        l = find(adj(i,:) == 1);
        if length(l) <= 2
            nei = find(idx == i);
            deleteIndex(nei) = 1;
        end
    end
    del = find(deleteIndex == 1);
    P(del,:) = [];
    
end


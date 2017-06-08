function [ p ] = deleteNan( points )
%DELETENAN Summary of this function goes here
%   Detailed explanation goes here

    k=[];
    for i=1:size(points,1)
        if isnan(points(i,:))
            k = [k i];
        end
    end
    points(k,:) = [];
    p=points;
end


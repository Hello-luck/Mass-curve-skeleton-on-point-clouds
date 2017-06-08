function [ result ] = findNei( P,X )
%FINDNEI Summary of this function goes here
%   Detailed explanation goes here

    result = zeros(size(P,1),1);
    d = pdist2(P,X);
    for i=1:size(P,1)
        in = find(d(i,:) == min(d(i,:)));
        if length(in) < 2
            result(i) = in;
        else
            result(i) = in(length(in));
    end
end


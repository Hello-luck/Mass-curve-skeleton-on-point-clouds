function [ adj ] = findAdj( OT )
%FINDADJ Summary of this function goes here
%   Detailed explanation goes here
    adj = zeros(size(OT,1),size(OT,1));
    for i=1:size(OT,2)
        t = OT(:,i);
        len = find(t>0);
        if length(len) == 2
            adj(len(1),len(2))=1;
            adj(len(2),len(1))=1;
        end
    end
end


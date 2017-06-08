function [ skel ] = center( P,OT )
%CENTER Summary of this function goes here
%   Detailed explanation goes here
    for i=1:size(OT,1)
        in = find(OT(i,:)>0);
        x=0;y=0;z=0;
        for j=1:length(in)
            x = x+OT(i,in(j))*P(in(j),1);
            y = y+OT(i,in(j))*P(in(j),2);
            z = z+OT(i,in(j))*P(in(j),3);
        end
        x = x / sum(OT(i,:));
        y = y / sum(OT(i,:));
        z = z / sum(OT(i,:));
        skel(i,:) = [x y z];
    end

end


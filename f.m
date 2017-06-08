function [ result ] = f( skel,k,n,newSkel )
%F Summary of this function goes here
%   Detailed explanation goes here

    skel1 = skel(k,:);
    skel1 = skel1';
    values = spcrv(skel1,3);
    v = [];
    for i=1:n:size(values,2)
%         hold on
%         plot3(values(1,i),values(2,i),values(3,i),'.','color',[0 1 0],'MarkerSize',20);
        a = [values(1,i) values(2,i) values(3,i)];
        v = [v;a];
    end
% 	hold on
%     plot3(v(:,1),v(:,2),v(:,3),'r','LineWidth',2);
    result = [newSkel;v];

%? 
    a = k(1);   b = k(length(k));
%     hold on
%     plot3(skel(a,1),skel(a,2),skel(a,3),'.','color',[0 1 0],'MarkerSize',20);
%     hold on
%     plot3([skel(a,1) values(1,1)],[skel(a,2) values(2,1)],[skel(a,3) values(3,1)],'color',[1 0 0],'LineWidth',2);
%     hold on
%     plot3(skel(b,1),skel(b,2),skel(b,3),'.','color',[0 1 0],'MarkerSize',20);
%     hold on
%     plot3([skel(b,1) v(length(v),1)],[skel(b,2) v(length(v),2)],[skel(b,3) v(length(v),3)],'color',[1 0 0],'LineWidth',2);
    result = [skel(a,:);result;skel(b,:)];
end


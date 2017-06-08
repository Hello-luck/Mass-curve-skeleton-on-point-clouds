clc,clear
load points;    %读取数据
P = points;
Pc = P;
figure
plot3(points(:,1),points(:,2),points(:,3),'.','color',[0 0 0]);
axis off,axis equal
view(180,270);
n = size(P,1);
N = 50;
% r = randi([1 n],1,N);     %随机采样
r = [311,469,464,285,130,146,322,485,466,114,100,62,142,509,13,363,120,389,463,279,495,308,309,53,253,474,553,342,215,292,70,580,440,543,175,486,381,306,156,50,516,470,109,244,68,233,549,131,22,12];
skel = P(r,:);
hold on
plot3(skel(:,1),skel(:,2),skel(:,3),'.','color',[1 0 0]);

needDelete = [1];   %存放需要合并的采样点
while ~isempty(needDelete)  %循环直到没有需要合并的采样点
    OT = ot(points,skel);   %计算传输方案
    OT(OT<10e-6)=0;
    skel = center(points,OT);   %更新采样点坐标
    skel = deleteNan(skel);
    needDelete = [];
    for i=1:size(OT,2)
        t = OT(:,i);
        len = find(t > 0);
        if length(len) >= 3
            needDelete = [needDelete len(1)];   %记录需要合并的采样点
        end
    end
    skel(needDelete,:) = [];    
end
plot3(skel(:,1),skel(:,2),skel(:,3),'.','color',[1 0 0],'MarkerSize',20);
lianjie = showSkel(points,skel);    %计算连接关系
% lianjie = findAdj(OT);
for i=1:size(skel,1)
    for j=i:size(skel,1)
        if lianjie(i,j) == 1
            hold on
            plot3([skel(i,1) skel(j,1)],[skel(i,2) skel(j,2)],[skel(i,3) skel(j,3)],'color',[1 0 0]);
        end
    end
end

figure
plot3(points(:,1),points(:,2),points(:,3),'.','color',[0 0 0]);
axis off,axis equal
view(180,270);
% k = [4 6 1 2 3 5 7 13 11 8 14 10 9 12];
leaf = [];  %叶子节点
index = [];
for i=1:size(lianjie,1)
    len = find(lianjie(i,:)>0);
    if length(len)==1
        leaf=[leaf;i];
    end
    index(i)=i;
end

k = findK(lianjie,leaf,index);  %当前骨架分支集合
newSkel = [];
newSkel  = f(skel,k,10,newSkel);    %计算平滑后的骨架
skel = newSkel;
OT = ot(points,skel);   
OT(OT<10e-6)=0;
skel = center(points,OT);
skel = 0.9 * skel + 0.1 * newSkel;  
hold on
plot3(skel(:,1),skel(:,2),skel(:,3),'color',[1 0 0],'LineWidth',2);
hold on
plot3(skel(:,1),skel(:,2),skel(:,3),'.','color',[0 1 0],'MarkerSize',20);

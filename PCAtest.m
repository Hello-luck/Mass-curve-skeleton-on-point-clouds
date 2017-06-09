function [ result ] = PCAtest(  )
%PCATEST 此处显示有关此函数的摘要
%   此处显示详细说明

    load skel16
    load points
    T = ot(points,skel);
    nei = findNei(points,skel);
    result = [];
    for n=1:size(skel,1)
        in1 = find(T(n,:) > 10e-6);
        Pin1 = points(in1,:);
        meanMatrix = mean(Pin1);
        Pin = Pin1 - ones(size(Pin1,1), 1) * meanMatrix; 
        covMatrix = 1 / (size(Pin,1) - 1) * (Pin' * Pin);   %协方差矩阵
        [V,D] = eig(covMatrix); %特征分解
%         hold on
%         plot3(points(in1,1),points(in1,2),points(in1,3),'.','color',[0 0.8 0.8]);
%         hold on
%         plot3(skel(n,1),skel(n,2),skel(n,3),'.','MarkerSize',20);
%         for i=1:3
%             hold on
%             plot3([skel(n,1) (V(1,i)+skel(n,1))],[skel(n,2) (V(2,i)+skel(n,2))],[skel(n,3) (V(3,i)+skel(n,3))],'r');   %特征向量
%         end

        [f1,f2,f3] = f(points,skel(n,:),V,in1,T,n); %f1,f2,f3 一个骨架点3个平面两边质量差异
        result = [result;f1 f2 f3];
    end
end

function [ f1,f2,f3 ] = f( P,skel,V,in,T,n )
%F Summary of this function goes here
%   Detailed explanation goes here
    %f( P,skel,V,in,T,n )
    % P点云，skel骨架，V特征向量，T传输方案，n骨架索引
    t = T(n,:);
    %1,2特征向量为平面
    left = 0;   right = 0;  %左右两边的质量
    a = V(:,1); b = V(:,2);
    for i=1:length(in)
        x = P(in(i),:);
        c = skel - x;
        flag = dot(c,cross(a,b));
        if flag < 0
%             left = left + 1;
            left = left + t(in(i));
        else
%             right = right + 1;
            right = right + t(in(i));
        end
    end
    f1 = abs(right-left) / sum(t);
    
    %1,3特征向量为平面
    left = 0;   right = 0;
    a = V(:,1); b = V(:,3);
    for i=1:length(in)
        x = P(in(i),:);
        c = skel - x;
        flag = dot(c,cross(a,b));
         if flag < 0
%             left = left + 1;
            left = left + t(in(i));
        else
%             right = right + 1;
            right = right + t(in(i));
        end
    end
    f2 = abs(right-left) / sum(t);
    
    %2,3特征向量为平面
    left = 0;   right = 0;
    a = V(:,2); b = V(:,3);
    for i=1:length(in)
        x = P(in(i),:);
        c = skel - x;
        flag = dot(c,cross(a,b));
         if flag < 0
%             left = left + 1;
            left = left + t(in(i));
        else
%             right = right + 1;
            right = right + t(in(i));
        end
    end
    f3 = abs(right-left) / sum(t);
end

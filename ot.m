function [T] = ot(P,skel)
    %input P:point cloud ,skel:skeleton
    %output: T:transport plan
    
    p = ones(size(P,1),1) ./ size(P,1);
    mass = zeros(size(skel,1),1);
    nei = findNei(P,skel);
    for i=1:size(skel,1)
        l = find(nei == i);
        mass(i) = length(l);
    end
    lambda = 100;   %熵约束参数
    mass = mass ./ size(nei,1);
    q = mass;
    M = pdist2(skel,P);
    K=exp(-lambda*M);
    U=K.*M;
    [D,lowerEMD,l,m]=sinkhornTransport(q,p,K,U,lambda,[],[],[],[],1); % 调用sinkhorn距离函数

    T=bsxfun(@times,m',(bsxfun(@times,l,K))); % 传输方案.
end

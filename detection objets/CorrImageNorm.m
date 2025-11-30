function [C]=CorrImageNorm(I,X)

[M,N,C]=size(I);

C=zeros(M,N);
%definition de D: (T-1)/2 (bord)
D=(size(X,1)-1)/2;

X=NormImage(X);
for i=1+D:M-D
    for j=1+D:N-D
    
    J=I(i-D:i+D,j-D:j+D,:);
    J=NormImage(J);
       C(i,j)=X(:)'*J(:);
    end
end
C=C/(D*D*3);


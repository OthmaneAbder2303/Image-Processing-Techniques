function [J]=NormImage(I)
I=double(I);
epsi=1e-5;
for k=1:size(I,3)
    x=I(:,:,k);
    x=x(:);
    xm=mean(x);
    xs=std(x);
    J(:,:,k)=(I(:,:,k)-xm)/(xs+epsi);
end

clear all
close all

I=imread('coloredChips.png');
load stat5

[A,Id,centre]=Cb(I,M,S);

figure(1)
clf;
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(A)

%remise au formlat image
[m,n,c]=size(I);
C=max(Id);
Id=reshape(Id,[m,n]);


figure(2)
subplot(3,3,1)
imshow(I)
class=unique(Id);
for k=1:C
    subplot(3,3,k+1)
    imshow(Id==class(k));
end

    
    
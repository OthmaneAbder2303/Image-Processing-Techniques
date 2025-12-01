clear all
close all
clc

I=imread('coloredChips.png');

K=[ 3 5 7 10 15 20 25 35 50];
figure(1)
clf;
for k=1:length(K)
     [A,ID(:,k),centers]=Km(I,K(k));
   subplot(3,3,k)
   imshow(A)
   title(['nombre de classes: ',num2str(K(k))])
end

clear all
close all
clc

I=imread('coloredChips.png');

R=0.1:0.1:0.5;%0.15;
figure(1)
clf;
for k=1:length(R)
     [A,ID(:,k),centers]=Ms(I,R(k));
   subplot(2,3,k)
   imshow(A)
   title(['R: ',num2str(R(k))])
end

% [M,N,C]=size(A),
% 
% V=reshape(ID,M,N);
clear all
close all
I=imread('coloredChips.png');

[M,N,C]=size(I)

figure(1)
subplot(2,2,1);
imshow(I)
subplot(2,2,2);
imshow(I(:,:,1))
subplot(2,2,3);
imshow(I(:,:,2))
subplot(2,2,4);
imshow(I(:,:,3))

 names={'pieces_jaunes','pieces_rouges','pieces_vertes','pieces_bleues',...
 'pieces_oranges','stylo','fond'};

tb=10;
[M,S]=BuildClass(I,tb,names);

save stat1 M S tb names
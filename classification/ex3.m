clear all
close all

I=imread('coloredChips.png');

%load ref classification
load stat10
[A,Idref,centre]=Cb(I,M,S);

figure(1)
clf
ShowClass(I,Idref,[2,4]);



k=1;
load stat1
[A,Id,centre]=Cb(I,M,S);
err(k)=sum(Id~=Idref)/length(Idref);
figure(2)
clf
ShowClass(I,Id,[2,4]);
k=2;
load stat5
[A,Id,centre]=Cb(I,M,S);
err(k)=sum(Id~=Idref)/length(Idref);

err
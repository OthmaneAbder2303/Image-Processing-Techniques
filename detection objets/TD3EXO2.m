load parking.mat


%%

figure(1)
subplot(2,1,1);
imshow(I);
title("Image");

subplot(2,1,2);
imshow(uint8(X));
title("Réference");

%%
C_norm = CorrImage(I,X,true); % calculer la matrice des corrélations normalisée.

%%

figure(3)
subplot(2,2,1);
imshow(I);
title("Image")
subplot(2,2,2);
imshow(uint8(X));
title("Réference")

subplot(2,2,3);
imshow(C_norm,[]);
title("Corrélation normalisé")
%%

[P,Cs]=DetectPic(C_norm,0.9);

figure(3)

subplot(2,2,1);
imshow(I);
title("Image")
AffRes(P,25,3)

subplot(2,2,2);
imshow(uint8(X));
title("Réference")

subplot(2,2,3);
imshow(C_norm);
title("Corrélation normalisée")

subplot(2,2,4);
imshow(Cs);
title("Detection objet")
%%
J = colorspace('rgb->luv',I);
Y = colorspace('rgb->luv',X);
C_norm = CorrImage(J,Y,true); % calculer la matrice des corrélations normalisée.
figure(4);
subplot(2,2,1);
imshow(J,[]);
title("Image ")

subplot(2,2,2);
imshow(uint8(Y));
title("Réference")

subplot(2,2,3);
imshow(C_norm,[]);
title("Corrélation normalisée")

subplot(2,2,4);
imshow(Cs,[]);
title("Detection objet")



%%
[P,Cs]=DetectPic(C_norm,0.9);

figure(3)

subplot(2,2,1);
imshow(I);
title("Image")
AffRes(P,25,3)

subplot(2,2,2);
imshow(uint8(X));
title("Réference")

subplot(2,2,3);
imshow(C_norm,[]);
title("Corrélation normalisée")

subplot(2,2,4);
imshow(Cs,[]);
title("Detection objet")




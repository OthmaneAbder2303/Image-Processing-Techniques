clear; clc; close all;

load parking.mat;

if isfloat(X) && max(X(:)) > 1
    X = uint8(X);
end

figure, imshow(I), title('Image drone - Parking ULCO');
figure, imshow(X,[]), title('Template X : voiture rouge suspecte');

figure('Name','Template + Histogrammes','Position',[100 100 900 600]);
subplot(2,2,1), imshow(X), title('Template X (voiture rouge)');
subplot(2,2,2), imhist(X(:,:,1)), title('Histogramme R');
subplot(2,2,3), imhist(X(:,:,2)), title('Histogramme G');
subplot(2,2,4), imhist(X(:,:,3)), title('Histogramme B');

I_luv = colorspace('RGB->Luv', I);
X_luv = colorspace('RGB->Luv', X);

%I_chrom = I_luv(:,:,2:3);
%X_chrom = X_luv(:,:,2:3);

Cl = normxcorr2(X_luv(:,:,1), I_luv(:,:,1));
Cu = normxcorr2(X_luv(:,:,2), I_luv(:,:,2));
Cv = normxcorr2(X_luv(:,:,3), I_luv(:,:,3));
Cn = (Cl + Cu + Cv) / 2;

h = size(X,1);  w = size(X,2);
Cn = Cn(h:end-h+1, w:end-w+1);

figure('Name','Cartes de corrélation');
subplot(1,2,1), imshow(Cn,[]), colorbar, title('Score normalisé (chrominance Luv)');
subplot(1,2,2), mesh(Cn(1:15:end,1:15:end)), title('Mesh du score normalisé');

seuil = 0.95;
C_seuil = Cn >= seuil * max(Cn(:));
L = bwlabel(C_seuil);
P = [];
scores = [];
for k = 1:max(L(:))
    [y,x] = find(L==k);
    [max_score,idx] = max(Cn(L==k));
    P = [P; x(idx), y(idx)];       
    scores = [scores; max_score];
end

figure('Position',[50 50 1400 900]), imshow(I), hold on;
for i = 1:size(P,1)
    rect_x = P(i,1) - floor(w/2);
    rect_y = P(i,2) - floor(h/2);
    
    rectangle('Position',[rect_x, rect_y, w, h], ...
              'EdgeColor','#00FF00','LineWidth',6);
          
    text(P(i,1), P(i,2)-40, sprintf('Score = %.4f', scores(i)), ...
         'Color','yellow','FontSize',18,'FontWeight','bold',...
         'HorizontalAlignment','center','BackgroundColor','red');
end
title('DÉTECTION ROBUSTE - VOITURE ROUGE SUSPECTE LOCALISÉE !',...
      'Color','red','FontSize',22,'FontWeight','bold');

fprintf('\n=== RÉSULTAT FINAL ===\n');
fprintf('Nombre de voitures rouges détectées : %d\n', size(P,1));
fprintf('Meilleur score : %.4f\n', max(scores));
fprintf('Position centre : x ≈ %.0f, y ≈ %.0f\n', P(1,1), P(1,2));
fprintf('→ LA VOITURE SUSPECTE EST BIEN PRÉSENTE SUR LE PARKING !\n\n');
I = imread('coloredChips.png');
size(I)


figure, imshow(I), title('Image coloredChips.png');

t_b = 51;                     % taille du bloc = 51×51 (impair → centre bien défini)
X = BlocMouse(I, t_b);        % clique au centre d'une pièce (ex : la rouge ou bleue bien visible)

R = X(:,:,1); G = X(:,:,2); B = X(:,:,3);
size(R)
figure,
subplot(2,2,1), imshow(X), title('Pièce référence X (51×51)');
subplot(2,2,2), imhist(R), title('Histogramme R');
subplot(2,2,3), imhist(G), title('Histogramme G');
subplot(2,2,4), imhist(B), title('Histogramme B');

C = CorrImage(I,X);

figure,
subplot(1,2,1), imshow(C,[]), colorbar, title('Score C (brut)');
subplot(1,2,2), mesh(C), title('Mesh du score de corrélation');




Cn = CorrImageNorm(I, X);

[P1, Cs1] = DetectPic(Cn, 0.85);
[P2, Cs2] = DetectPic(Cn, 0.80);
[P3, Cs3] = DetectPic(Cn, 0.75);

figure, imshow(I), hold on;
for i = 1:size(P1,1)
    rectangle('Position', [P1(i,1)-25, P1(i,2)-25, 51, 51], ...
          'EdgeColor', '#00FF00', ... 
          'LineWidth', 3);
    text(P1(i,1), P1(i,2)-30, sprintf('%.3f', P1(i,3)), ...
         'Color','yellow', 'FontSize',12, 'HorizontalAlignment','center');
end
title('Détection robuste avec corrélation normalisée (seuil 0.85)');
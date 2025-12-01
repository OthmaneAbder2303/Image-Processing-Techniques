% Définir une image 10x10 (exemple avec des valeurs aléatoires)
image_originale = randi([0, 255], 10, 10, 3);

% Définir un filtre 3x3 (exemple : filtre moyenneur)
filtre = (1/9) * ones(3, 3);

% Alternative : filtre de détection de contours
% filtre = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Appliquer la convolution
image_filtree = conv2(image_originale, filtre, 'same');

% Afficher les résultats
figure;
subplot(1,2,1); imshow(image_originale, []); title('Image originale');
subplot(1,2,2); imshow(image_filtree, []); title('Image filtrée');


% 
% % Créer une image RGB 10x10 aléatoire
% image_originale_rgb = randi([0, 255], 10, 10, 3);
% 
% % Définir un filtre 3x3 (exemple : filtre moyenneur)
% filtre = (1/9) * ones(3, 3);
% 
% % Initialiser l'image filtrée RGB
% image_filtree_rgb = zeros(size(image_originale_rgb));
% 
% % Appliquer la convolution sur chaque canal séparément
% for canal = 1:3
%     image_filtree_rgb(:,:,canal) = conv2(image_originale_rgb(:,:,canal), filtre, 'same');
% end
% 
% % Convertir en uint8 pour l'affichage
% image_filtree_rgb = uint8(image_filtree_rgb);
% 
% % Afficher les résultats
% figure;
% subplot(1,2,1); imshow(uint8(image_originale_rgb)); title('Image originale RGB');
% subplot(1,2,2); imshow(image_filtree_rgb); title('Image filtrée RGB');
% 
% % Afficher aussi les canaux séparément
% figure('Position', [100 100 1200 400]);
% titles = {'Canal Rouge', 'Canal Vert', 'Canal Bleu'};
% for i = 1:3
%     subplot(2,3,i);
%     imshow(image_originale_rgb(:,:,i), []);
%     title([titles{i} ' - Original']);
% 
%     subplot(2,3,i+3);
%     imshow(image_filtree_rgb(:,:,i), []);
%     title([titles{i} ' - Filtre']);
% end
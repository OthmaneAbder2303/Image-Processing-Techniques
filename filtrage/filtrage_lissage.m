I = imread('ulco.jpg');
size(I)

h_avg = fspecial('average', 5);
h_gauss = fspecial('gaussian', 5, 1);

J_avg = imfilter(I, h_avg);
J_gauss = imfilter(I, h_gauss);

J_median = I; % initialiser même taille
J_median(:,:,1) = medfilt2(I(:,:,1), [5 5]);   % Rouge
J_median(:,:,2) = medfilt2(I(:,:,2), [5 5]);   % Vert
J_median(:,:,3) = medfilt2(I(:,:,3), [5 5]);   % Bleu


figure;
subplot(1,3,1); imshow(J_avg); title('Filtre moyenneur 5×5');
subplot(1,3,2); imshow(J_gauss); title('Filtre gaussien 5×5 σ=1');
subplot(1,3,3); imshow(J_median); title('Filtre median 5×5');

% Zoom zone toiture
figure;
subplot(1,3,1); imshow(imcrop(J_avg, [0 0 300 300]));
subplot(1,3,2); imshow(imcrop(J_gauss, [0 0 300 300]));
subplot(1,3,3); imshow(imcrop(J_median, [0 0 300 300]));


x1=[800,1548];
x2=[645,743];

% Profil original
[~,~,c_orig] = improfile(I, x1, x2);

% Profil moyenneur
[~,~,c_avg] = improfile(J_avg, x1, x2);

% Profil gaussien
[~,~,c_gauss] = improfile(J_gauss, x1, x2);

figure; hold on;
plot(c_orig(:,1,1), 'g', 'LineWidth', 1.5);
plot(c_avg(:,1,1), 'r');                
plot(c_gauss(:,1,1), 'b');             

legend('Original','Moyenneur','Gaussien');
xlabel('Position');
ylabel('Intensité');
title('Profil de couleur sur le segment choisi');
grid on;


%J_median = medfilt2(I(:,:,1), [5 5]);  % sur chaque canal ou image N&B

%size(c_orig)
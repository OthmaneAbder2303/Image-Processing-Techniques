clear all; close all; clc;

img_mit = imread("eight.tif");
img_cam = imread("cameraman.tif");

% imshow(img_mit, []);
% 
% figure;
% imshow(img_cam, []);

% Calcul de la FFT 2D
fft_mit = fft2(img_mit);
fft_cam = fft2(img_cam);

% Translation des basses fréquences au centre
fft_mit_centre = fftshift(fft_mit);
fft_cam_centre = fftshift(fft_cam);

% Affichage des résultats
figure('Name', 'FFT des images', 'Position', [100 100 1200 800]);

% Image MIT originale
subplot(2,3,1);
imshow(img_mit);
title('Image MIT originale');

% Spectre MIT (log du module)
subplot(2,3,2);
imshow(log(1 + abs(fft_mit_centre)), []);
% colormap(gca, jet);
% colorbar;
title('Spectre MIT (log-magnitude)');

% Phase MIT
subplot(2,3,3);
imshow(angle(fft_mit_centre), []);
% colormap(gca, hsv);
% colorbar;
title('Phase MIT');

% Image Cameraman originale
subplot(2,3,4);
imshow(img_cam);
title('Image Cam originale');

% Spectre Cameraman (log du module)
subplot(2,3,5);
imshow(log(1 + abs(fft_cam_centre)), []);
colormap(gca, jet);
colorbar;
title('Spectre Cam (log-magnitude)');

% Phase Cameraman
subplot(2,3,6);
imshow(angle(fft_cam_centre), []);
colormap(gca, hsv);
colorbar;
title('Phase Cam');



%% 2. Annulation de la phase (phase = 0)

% Garder uniquement le module
fft_mit_sans_phase = abs(fft_mit_centre);
fft_cam_sans_phase = abs(fft_cam_centre);

% Transformée inverse
img_mit_sans_phase = ifft2(ifftshift(fft_mit_sans_phase));
img_cam_sans_phase = ifft2(ifftshift(fft_cam_sans_phase));

% Affichage
figure('Name', 'Question 2: Images sans phase', 'Position', [150 150 1000 400]);

subplot(1,2,1);
imshow(abs(img_mit_sans_phase), []);
title('MIT sans phase (module seul)');

subplot(1,2,2);
imshow(abs(img_cam_sans_phase), []);
title('Cameraman sans phase (module seul)');


%% 3. Module constant pour tous les coefficients

% Créer des FFT avec module constant = 1 et phase originale
fft_mit_module_const = exp(1i * angle(fft_mit_centre));
fft_cam_module_const = exp(1i * angle(fft_cam_centre));

% Transformée inverse
img_mit_module_const = ifft2(ifftshift(fft_mit_module_const));
img_cam_module_const = ifft2(ifftshift(fft_cam_module_const));

% Affichage
figure('Name', 'Question 3: Images avec module constant', 'Position', [200 200 1000 400]);

subplot(1,2,1);
imshow(abs(img_mit_module_const), []);
title('MIT avec module constant (phase seule)');

subplot(1,2,2);
imshow(abs(img_cam_module_const), []);
title('Cameraman avec module constant (phase seule)');


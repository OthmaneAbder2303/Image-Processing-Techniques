% Création de l'image I (10x10) exactement comme dans l'énoncé
I = [6 5 4 3 2 2 3 4 5 6
     5 4 3 2 1 1 2 3 4 5
     4 3 2 1 14 14 1 2 3 4
     3 2 1 14 12 12 14 1 2 3
     2 1 14 12 8 8 12 14 1 2
     2 1 14 12 8 8 12 14 1 2
     3 2 1 14 12 12 14 1 2 3
     4 3 2 1 14 14 1 2 3 4
     5 4 3 2 1 1 2 3 4 5
     6 5 4 3 2 2 3 4 5 6];

%imshow(I, []); colormap(gray(256)); title('Image originale 10x10');
figure, imshow(I,[]), title('Image originale');
%image(I), colormap(gray(16))

I_bruit = I;
I_bruit(2,2) = 0;   I_bruit(4,7) = 0;
I_bruit(5,5) = 0;  I_bruit(5,9) = 0;
I_bruit(6,2) = 15;  I_bruit(6,6) = 15;
I_bruit(7,4) = 15;  I_bruit(9,9) = 15;

figure, imshow(I_bruit,[]), title('Image bruitée');


h_moy = fspecial('average',3);
I_moy = imfilter(I_bruit, h_moy, 'replicate');

% Erreur quadratique moyenne (MSE)
err_moy = sum((I(:) - I_moy(:)).^2) / numel(I);
figure, imshow(I_moy,[]), title('Filtre Moyenneur');
disp(['Erreur quadratique moyenne (filtre moyenneur) = ' num2str(err_moy)]);


I_med = medfilt2(I_bruit, [3 3], 'symmetric');

err_med = sum((I(:) - I_med(:)).^2) / numel(I);
figure, imshow(I_med,[]), title('Filtre Median');
disp(['Erreur quadratique moyenne (filtre médian) = ' num2str(err_med)]);
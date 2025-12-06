image = imread('coloredChips.png');

t = 51;
X = BlocMouse(image, t);

[n, m, nC] = size(image);

X = double(X(:));

d = (t - 1)/2;

C = ones(n, m);

for i=1+d:n-d
    for j=1+d:m-d
        A = image(i-d:i+d, j-d:j+d,:);
        A = double(A(:));
        C(i, j) = A' * X;
    end
end

C = C/(t*t*nC);


figure,
subplot(1,2,1), imshow(C,[]), colorbar, title('Score C (brut)');
subplot(1,2,2), mesh(C), title('Mesh du score de corrélation');
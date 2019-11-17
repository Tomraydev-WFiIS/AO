% t - transformata fouriera
clear; close all; clc;
im = rgb2gray(double(imread('opera.jpg'))/255);
t = fft2(im);
% t = fftshift(fft2(im));
A = abs(t);
phi = angle(t);



% imshow(phi,[-pi, pi]);figure; % mo¿na wykrywac czy obraz by³ edytowany jeœli w tym 'szumie' s¹ jakieœ kszta³ty
% Kt = A.*exp(1i*phi);
% Cim2 = ifft2(Kt); % transformacja odwrotna
% imshow(Cim2);figure;

% zmieniamy faze na przciwna - negatyw
% phi(1) = phi(1) + pi;
% Kt = A.*exp(1i*phi);
% Cim2 = ifft2(Kt);
% im2 = abs(Cim2);
% imshow(im2);

% zmieniamy amplitude
maxA = max(A(:));
lA = log(A);
imshow(lA, [0, log(maxA)]);figure; % rozblyski z rogow, albo ze srodka po shifcie
% dlaczego w rogach? S¹ tam funkcje o najwiekszych czestotliwosciach
% zwiazane z punktami blisko siebie, im bli¿ej œrodka tym bardziej punkty
% s¹ oddalone od siebie
% zamieniamy æwiartki ze sob¹ miejscami ¿eby 'œrodek' by³ w œrodku
A = A .^(1.01);
Kt = A.*exp(1i*phi);
Cim2 = ifft2(Kt); % transformacja odwrotna
imshow(Cim2);



% bia³y piksel, które z naszych funkcji wchodz¹ z najwiêksz¹ wag¹
% A(200,200) = 1e5;
% maxA = max(A(:));
% lA = log(A);
% % imshow(lA, [0, log(maxA)]); % rozblyski z rogow
% imshow(im);figure;
% Kt = A.*exp(1i*phi);
% Cim2 = ifft2(Kt); % transformacja odwrotna
% imshow(Cim2);

% maska na transformacie - filtr dolnoprzypustowy
% dobre do kompresji danych, stosowane np. w .jpg - (kompresja nie jest
% transformat¹ fouriera tylko inn¹)
% "bierzemy piksel i patrzymy jak bardzo jest podobny do s¹siadów"
% maxA = max(A(:));
% lA = log(A);
% [h,w] = size(im);
% m = zeros(h,w);
% x = 300; y = 200; % wymiary prostok¹ta
% m((h-y)/2:end-(h-y)/2,(w-x)/2:end-(w-x)/2) = 1;
% A = A .* fftshift(m);
% lA = lA .* fftshift(m); % tylko zeby zobacyc
% imshow(fftshift(lA), [0, log(maxA)]);figure;
% 
% Kt = A.*exp(1i*phi);
% Cim2 = ifft2(Kt);
% im2 = abs(Cim2);
% imshow(im2);

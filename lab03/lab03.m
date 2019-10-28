clear;close all;clc;
i = 1;h = 1;w = 1;

im = rgb2gray(double(imread('zubr.jpg'))/255);
% subplot(h,w,i);i = i +1;
% imshow(im);figure;

% gaussian blur
k0 = 3;
f0 = -ones(k0);
f0(5) = 8;

% srednia arytmetyczna
% k1 = 3;
% f1 = ones(k1)/k1^2;
% fim = imfilter(im, f1);

% k2 = 11;
% f2 = ones(k2,1)/k2;
% fim = imfilter(im, f2);

% blur ale bez rozmywania krawedzi - mediana
% fim = medfilt2(im, [7,7]);

% wykrywanie krawedzi filtrem sobela - dokumentacja matlaba
% h = fspecial('sobel');
% fim = imfilter(im, h);
% fim = imfilter(im, h.');


% binaryzacja 'recznie'
% T=0.6;
% bim = im>T;
% imshow(bim);figure;

% binaryzacja funkcja
% T = 0.55;
% bim = imbinarize(im);
% patrzymy czy jest jasniejszy od otoczenia
% bim = imbinarize(im, 'adaptive' );


% dla obrazu binarnego moda i mediana dzia³a tak samo
% T=0.6;
% bim = im>T;
% n_bim = medfilt2(bim);
% n_bim = ~n_bim;
% imshow(n_bim);figure;

% min = erozja i max = dylatacja, polaczenie 
T=0.6;
bim = im>T;
imshow(bim);figure;
% e_bim = imerode(bim, ones(3));
% imshow(e_bim);figure;
% d_bim = imdilate(bim, ones(3));
% imshow(d_bim);figure;
% de_bim = imerode(imdilate(bim, ones(5)), ones(5));
% imshow(de_bim);figure;
% erozja+dylatacja="otwarcie"
% ed_bim = imdilate(imerode(bim, ones(5)), ones(5));
% imshow(ed_bim);figure;

% dylatacja+erozja="zamkniecie"
% operacje morfologiczne - operacje które wp³ywaj¹ na kszta³t
% (erozja,dylatacja)
% imshow(imOpen(bim,ones(3)));figure;;
% imshow(imclose(bim,ones(3)));

% te¿ znajdowanie krawêdzi poprzez dylacje albo erozje
% bim = bim - imerode(bim, ones(3));
% imshow(bim);figure;
% 
% bim = imdilate(bim, ones(3)) - bim;
% imshow(bim);figure;

% znowu wykrywanie krawedzi - zastanowic sie dlaczego ten filtr tak dziala
bim = imfilter(bim, f0);
imshow(bim);figure;

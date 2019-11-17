clear;close all;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);
% imshow(im);figure;

% gaussian blur
% f = [   1,2,1;
%         2,4,2;
%         1,2,1;
% ];
% f = f./sum(sum(f));
% fim = imfilter(im, f);
% imshow(fim);
% imwrite(fim,"bison_gauss.png");

% high-pass filter
f = [   -1,-1,-1;
        -1,9,-1;
        -1,-1,-1;
];
fim = imfilter(im, f);
imshow(fim);
imwrite(fim,"bison_high-pass.png");

% srednia arytmetyczna
% k1 = 3;
% f1 = ones(k1)/k1^2;
% fim = imfilter(im, f1);
% imshow(fim);
% imwrite(fim,"bison_avg.png");

% k2 = 11;
% f2 = ones(k2,1)/k2;
% fim = imfilter(im, f2);

% blur ale bez rozmywania krawedzi - mediana
% fim = medfilt2(im, [7,7]);
% imshow(fim);imwrite(fim, "bison_med.png");figure;
% subplot(1,2,1);
% imhist(im);subplot(1,2,2)
% imhist(fim);


% wykrywanie krawedzi filtrem sobela - dokumentacja matlaba
% h = fspecial('sobel');
% fim = imfilter(im, h);
% fim = imfilter(im, h.');
% imshow(fim);
% imwrite(fim, "bison_sobel.png");


% binaryzacja 'recznie'
% T=0.4706;
% bim = im>T;
% imshow(bim);

% binaryzacja funkcja
% bim = imbinarize(im);
% imshow(bim);figure;
% imwrite(bim, "bison_bin_otsu.png");
% patrzymy czy jest jasniejszy od otoczenia
% bim = imbinarize(im, 'adaptive');
% imshow(bim);
% imwrite(bim, "bison_bin_adaptive.png");


% dla obrazu binarnego moda i mediana dzia³a tak samo
% T=0.6;
% bim = im>T;
% n_bim = medfilt2(bim);
% n_bim = ~n_bim;
% imshow(n_bim);figure;

% min = erozja i max = dylatacja, polaczenie 
% T=0.6;
% bim = im>T;
% % imshow(bim);figure;
% e_bim = imerode(bim, ones(3));
% imshow(e_bim);figure;imwrite(e_bim, "bison_erode.png");
% d_bim = imdilate(bim, ones(3));
% imshow(d_bim);figure;imwrite(d_bim, "bison_dilate.png");
% % dylatacja+erozja="zamkniecie"
% de_bim = imerode(imdilate(bim, ones(5)), ones(5));
% imshow(de_bim);figure;imwrite(de_bim, "bison_close.png");

% % erozja+dylatacja="otwarcie"
% ed_bim = imdilate(imerode(bim, ones(5)), ones(5));
% imshow(ed_bim);figure;imwrite(ed_bim, "bison_open.png");


% % operacje morfologiczne - operacje które wp³ywaj¹ na kszta³t
% % (erozja,dylatacja)
% imshow(imopen(bim,ones(3)));figure;
% imshow(imclose(bim,ones(3)));

% te¿ znajdowanie krawêdzi poprzez dylacje albo erozje
% edge_ebim = bim - imerode(bim, ones(3));
% imshow(edge_ebim);figure;imwrite(edge_ebim, "bison_edge_erode.png");
% 
% edge_dbim = imdilate(bim, ones(3)) - bim;
% imshow(edge_dbim);figure;imwrite(edge_dbim, "bison_edge_dilate.png");

% znowu wykrywanie krawedzi - zastanowic sie dlaczego ten filtr tak dziala
% k0 = 3;
% f0 = -ones(k0);
% f0(5) = 8;
% bim = imfilter(bim, f0);imwrite(bim, "bison_edge.png");
% imshow(bim);figure;

% obliczamy iloczyn obrazu binarnego i obrazu bazowego - korzystamy z maski
% 'bim' do wyciecia obrazu
% im = double(imread('zubr.jpg'))/255;
% bim = ~imbinarize(rgb2gray(im));
% output = im .* bim;
% imshow(bim);figure;imwrite(output, "bison_mask.png");
% imshow(output);
clear;
clf;
clc;
ind = 1;
vc = 1;
vh = 1;

opera = double(imread('opera.jpg'))/255; 
%subplot(vc,vh,ind);
%ind = ind +1;
sz_opera = rgb2gray(opera);
%imshow(sz_opera)

%transformata z zamiana cwiartek
TF_opera = fftshift(fft2(sz_opera));
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(TF_opera);

%modul
afim = abs(TF_opera);
%kat
pfim = angle(TF_opera);

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(afim,[0;1000]);

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(pfim,[-pi;pi]);%zmiana zakresu wyswietlania

%powrot do pierwotnego obrazka
%afim(200,200) = 100000;%zmiana jednego pkt 
%tmp = afim.*exp(i*pfim);
%tmp = fftshift(tmp);
%ITF_opera = ifft2(tmp);

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(ITF_opera);

%maska na rozmycie krawedzi
M = zeros(846,1280);
M(280:580,490:790) = 1; %maska 300x300 kompresja danych (zapisanie najwazniejszych informacji)

tmp2 = M.*afim;
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(tmp2);
%afim(200,200) = 100000;%zmiana jednego pkt 
%tmp = afim.*exp(i*pfim);
%tmp = fftshift(tmp2);

tmp = tmp2.*exp(i*pfim);
tmp = abs(ifft2(tmp));
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(tmp);

%maska na wyostrzenie krawedzi
%M = ones(846,1280);
%M(370:470,590:690) = 0;
M = zeros(846,1280);
M(410:430,630:640) = 1;
tmp2 = M.*afim;

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(tmp2);

%afim(200,200) = 100000;%zmiana jednego pkt 
%tmp = afim.*exp(i*pfim);

%tmp = fftshift(tmp2);
tmp = tmp2.*exp(i*pfim);
tmp = abs(ifft2(tmp));
subplot(vc,vh,ind);
ind = ind +1;
imshow(tmp);




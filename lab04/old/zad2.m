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
%TF_opera = fftshift(fft2(sz_opera));
TF_opera = fftshift(fft2(sz_opera));
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(TF_opera);

%modul
afim = abs(TF_opera);
%kat
pfim = angle(TF_opera);

M = zeros(846,1280);
M(410:430,630:640) = 1;
fm = fft2(M);
afm = abs(fm);%widmo amplitudowe

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(fm,[0,10000]);
afm = afim.*afm;
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(afm);

tmp = afm.*exp(i*pfim);
subplot(vc,vh,ind);
ind = ind +1;
imshow(tmp);



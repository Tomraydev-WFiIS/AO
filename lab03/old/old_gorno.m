clear;clf;clc;
i = 1;h = 1;w = 2;

zubr = double(imread('zubr.jpg'))/255; 

subplot(h,w,i);i = i +1;
sz_zubr = rgb2gray(zubr);
imshow(sz_zubr);

f = [-1,-1,-1;-1,9,-1;-1,-1,-1];
f = f / sum(sum(f));
%filtrowanie obrazka 
sz_zubr2 = imfilter(sz_zubr,f);

subplot(h,w,i);i = i +1;
imshow(sz_zubr2);
f1 = ones(51,51);
f1 = f1 / sum(sum(f1));

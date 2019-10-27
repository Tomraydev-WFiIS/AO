clear;clf;clc;
i = 1;h = 1;w = 2;

zubr = double(imread('zubr.jpg'))/255; 

sz_zubr = rgb2gray(zubr);

f1 = ones(51,51);
f1 = f1 / sum(sum(f1));

%progowanie 
sz_zubr1 = sz_zubr;
sz_zubr1(sz_zubr1 <= 0.65) = 0;
sz_zubr1(sz_zubr1 > 0.65) = 1;

subplot(h,w,i);i = i +1;
imshow(sz_zubr1);

sz_zubr2 = medfilt2(sz_zubr1);
subplot(h,w,i);i = i +1;
imshow(sz_zubr2);

f = [-1,-1,-1;-1,8,-1;-1,-1,-1];
sz_zubr3 = imfilter(sz_zubr2,f);
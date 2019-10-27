clear;clf;clc;
i = 1;h = 1;w = 2;

subplot(h,w,i);i = i +1;
zubr = double(imread('zubr.jpg'))/255; 
imshow(zubr);

% subplot(h,w,i);i = i +1;
% sz_zubr = rgb2gray(zubr);
% imshow(sz_zubr);

f = [1,1,1;1,4,1;1,1,1];
f = f / sum(sum(f));

f1 = ones(51,51);
f1 = f1 / sum(sum(f1));

f = fspecial('sobel');

zubr2 = imfilter(zubr,f);

subplot(h,w,i);i = i +1;
imshow(zubr2);
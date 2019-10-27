clear;clf;clc;
i = 1;h = 2;w = 1;

zubr = double(imread('zubr.jpg'))/255; 

% subplot(h,w,i);i = i +1;
sz_zubr = rgb2gray(zubr);
% imshow(sz_zubr);

% subplot(h,w,i);i = i +1;
% imhist(sz_zubr);

f = [0,1,0;1,1,1;0,1,0];
f = f / sum(sum(f));

sz_zubr2 = imerode(sz_zubr,f);

subplot(h,w,i);i = i +1;
imshow(sz_zubr2);
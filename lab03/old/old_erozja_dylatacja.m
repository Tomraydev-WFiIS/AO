clear;clf;clc;
i = 1;h = 2;w = 3;

zubr = double(imread('zubr.jpg'))/255; 

subplot(h,w,i);i = i +1;
sz_zubr = rgb2gray(zubr);
imshow(sz_zubr);

subplot(h,w,i);i = i +1;
imhist(sz_zubr);

level = graythresh(sz_zubr); % - obliczenie progu do binaryzacji 
BW1 = im2bw(sz_zubr,level); % - binaryzacja  
subplot(h,w,i);i = i +1;
imshow(BW1);
sz_zubr2 = bwmorph(BW1,'dilate');  

subplot(h,w,i);i = i +1;
imshow(sz_zubr2);


sz_zubr2 = bwmorph(sz_zubr2,'erode');  


subplot(h,w,i);i = i +1;
imshow(sz_zubr2);
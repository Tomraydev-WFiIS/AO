clear;clc;close all;
im = imread('pictures/cat.jpg');
im = double(im)/255;
gim = rgb2gray(im);


% **** base image

% imshow(gim);figure;
% imhist(gim);
% subplot(h,w,i);i = i+1;
% x = 0:0.1:1;
% y = x;
% plot(x,y);

% brightness correction
% a = .2;
% b_gim = gim + a;
% imshow(b_gim);figure;
% imhist(b_gim);figure
% x = 0:0.1:1;
% b_x = x+a;
% b_x(b_x>1)=1;
% b_x(b_x<0)=0;
% plot(x,b_x);

% contrast change
% c = 0.5;
% c_gim = gim*c;figure;
% imshow(c_gim);figure;
% imhist(c_gim);

% gamma correction
% g = 0.2;
% g_gim = gim.^g;figure;
% imshow(g_gim);figure;
% imhist(g_gim);

% histogram correction
[e_gim, T] = histeq(gim);figure;
imshow(e_gim);figure
imhist(e_gim);
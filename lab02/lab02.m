clear;clc;
im = imread('pictures/cat.jpg');
im = double(im)/255;
gim = rgb2gray(im);
h =3;w = 3;i = 1;

% **** base image
subplot(h,w,i);i = i+1;
imshow(gim);
subplot(h,w,i);i = i+1;
imhist(gim);
subplot(h,w,i);i = i+1;
x = 0:0.1:1;
y = x;
plot(x,y);

% brightness correction
a = .2;
b_gim = gim + a;
subplot(h,w,i);i = i+1;
imshow(b_gim);
subplot(h,w,i);i = i+1;
imhist(b_gim);
subplot(h,w,i);i = i+1;
x = 0:0.1:1;
b_x = x+a;b_x(b_x>1)=1;b_x(b_x<0)=0;
plot(x,b_x);

% contrast change
% c = .5;
% c_gim = gim*c;
% subplot(h,w,i); i = i+1;
% imshow(c_gim);
% subplot(h,w,i); i = i+1;
% imhist(c_gim);

% gamma correction
% g = .2;
% g_gim = gim.^g;
% subplot(h,w,i); i = i+1;
% imshow(g_gim);
% subplot(h,w,i); i = i+1;
% imhist(g_gim);

% histogram correction
e_gim = histeq(gim);
subplot(h,w,i);i = i+1;
imshow(e_gim);
subplot(h,w,i);i = i+1;
imhist(e_gim);
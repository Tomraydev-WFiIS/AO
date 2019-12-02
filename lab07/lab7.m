% ptaki 2
clear; close all; clc;

fun = {
    @AO5RShape,
    @AO5RMalinowska,
    @AO5RHaralick,
    @AO5RFeret,
    @AO5RDanielsson,
    @AO5RCircularityS,
    @AO5RCircularityL,
    @AO5RBlairBliss
};


im = double(imread('ptaki2.jpg'))/255;
% imshow(im); figure


bim =  ~imbinarize(im(:,:,3), .6);
% r = im(:,:,1);r(r<.15); % wartosc z histogramu
% r = imbinarize(r,.3); % wartosc z histogramu
% 
% bim = r|b;
% pozbywamy sie szumu
bim = imclose(bim, ones(3));
bim = imopen(bim, ones(3));
% imshow(bim);figure;

% segmentacja
l2 = bwlabel(bim);
for i = 1: max(l2(:))
    if length(l2(l2==i)) < 1000
        l2(l2==i) = 0;
    end
end
% reindeksujemy
l2 = bwlabel(l2>0);
% imshow(label2rgb(l2));

% liczymy wspolczynniki
wsp2 = zeros(max(l2(:)), length(fun)); % j ptaki, k wspolczynniki
for i = 1:max(l2(:))
   for j = 1:length(fun)
       wsp2(i,j) = fun{j}(l2==i);
   end
end
% ptaki
im1 = double(imread('ptaki.jpg'))/255;
b = ~imbinarize(im1(:,:,3), .6);
r = im1(:,:,1);r(r<.15); % wartosc z histogramu
r = imbinarize(r,.3); % wartosc z histogramu
bim1 = r|b;
% pozbywamy sie szumu
bim1 = imclose(bim1, ones(5));
bim1 = imopen(bim1, ones(5));
% imshow(bim1); figure;

% segmentacja
l1 = bwlabel(bim1);


wsp1 = zeros(max(l1(:)), length(fun)); % j ptaki, k wspolczynniki
for i = 1:max(l1(:))
   for j = 1:length(fun)
       wsp1(i,j) = fun{j}(l1==i);
   end
end

% kaczki
im3 = rgb2gray(double(imread('kaczki.jpg'))/255);
bim3 = ~imbinarize(im3, .55);
bim3 = imclose(bim3, ones(8));
l3 = bwlabel(bim3);
% imshow(label2rgb(l3));

for i = 1:max(l3(:))
   for j = 1:length(fun)
       wsp3(i,j) = fun{j}(l3==i);
   end
end


% bedziemy rozrozniac ptaki.jpg od ptaki2.jpg
% net = feedforwardnet([5 5]);
% net.trainParam.epochs = 100;
% [net, tr] = train(net, wsp3', zeros(max(l2)));


% dzieliemy na zbiory do uczenia i target
ucz = [wsp1; wsp2]';
uczout = [zeros(1,size(wsp1,1)), ones(1, size(wsp2,1)) ];
net = feedforwardnet;
[net, tr] = train(net, ucz, uczout);

% patrzymy gdzie sie zgadza
res = imbinarize(net(ucz), .5);

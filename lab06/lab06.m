% kszta�ty geometryczne
clear; close all; clc;
im = double(imread('ptaki.jpg'))/255;
% imshow(im); figure;
bim = ~imbinarize(im, .30);


i = 1;
h = 3;
w = 2;

red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

% for j = 1:3 
%     subplot(h,w,2*j-1);
%     imshow(im(:,:,j));
%     subplot(h,w,2*j);
%     imhist(im(:,:,j));
% end
% w kanale zielonym ptaki i tlo sa zbyt blisko siebie

b = ~imbinarize(im(:,:,3), .6);
r = im(:,:,1);r(r<.15); % wartosc z histogramu
r = imbinarize(r,.3); % wartosc z histogramu

bim = r|b;
% pozbywamy sie szumu
bim = imclose(bim, ones(5));
bim = imopen(bim, ones(5));
% imshow(bim); figure;

% segmentacja
l = bwlabel(bim);
prop = regionprops(l == 4, 'all');
for j = 1: max(l(:))
   all_props(j) =  regionprops(l == j, 'all');
   imshow(all_props(j).Image); figure;
end

% Centroid - �rodek geometryczny
% BoundingBox - najmniejszy prostok�t kt�ry zawiera figur� (i jest
% r�wnoleg�y do osi wsp�rz�dnych)
% Image - przyci�ty obrazek
% ... i tak dalej

% g��wna idea wsp�czynnik�w to odr�nianie obiekt�w od siebie, a nie
% grupowanie

% przyklad z ko�ami
% ds - circularity S, dl - circularity L
% ds = 2 sqrt(S/pi)
% dl = L/pi

% dla kola dl/ds = 1
% dl/ds - 1 = wsp�czynnik Malinowskiej - 
% ds/dl = wsp�czynnik kszta�tu

% por�wnujemy jak�s miare na obiekcie do tego ile wynosi dla ko�a.


% Wsp�czynnik Blair Blissa - �rednia odleg�o�� od �rodka dla ka�dego
% piksela.

% wsp. Danielsson'a - �rednia odleg�o�� piksela od kraw�dzi, dla ko�a najwi�ksza mo�liwa
% wartos�

% wsp. Haralicka

% �rednica Fereta - stosunek �rednic z bounding box (bok poziomy do boku
% pionowego)

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

% wyrusuj kazda z osobna
% params = zeros(max(l(:)), length(fun)); % j kaczki, k wspolczynniki
% for j = 1:max(l(:))
%    for k = 1:8
%        params(j,k) = fun{k}(l==j);
%    end
% end

m = mean(params);
s =std(params);

err = abs(params-m) ./s;
T = 2; % threshold


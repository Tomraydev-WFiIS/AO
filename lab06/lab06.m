% kszta³ty geometryczne
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

% Centroid - œrodek geometryczny
% BoundingBox - najmniejszy prostok¹t który zawiera figurê (i jest
% równoleg³y do osi wspó³rzêdnych)
% Image - przyciêty obrazek
% ... i tak dalej

% g³ówna idea wspó³czynników to odró¿nianie obiektów od siebie, a nie
% grupowanie

% przyklad z ko³ami
% ds - circularity S, dl - circularity L
% ds = 2 sqrt(S/pi)
% dl = L/pi

% dla kola dl/ds = 1
% dl/ds - 1 = wspó³czynnik Malinowskiej - 
% ds/dl = wspó³czynnik kszta³tu

% porównujemy jak¹s miare na obiekcie do tego ile wynosi dla ko³a.


% Wspó³czynnik Blair Blissa - œrednia odleg³oœæ od œrodka dla ka¿dego
% piksela.

% wsp. Danielsson'a - Œrednia odleg³oœæ piksela od krawêdzi, dla ko³a najwiêksza mo¿liwa
% wartosæ

% wsp. Haralicka

% œrednica Fereta - stosunek œrednic z bounding box (bok poziomy do boku
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


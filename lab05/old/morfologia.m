clear;
clf;
clc;
ind = 1;
vc = 1;
vh = 1;

kaczki = double(imread('jablka.png'))/255; 
%subplot(vc,vh,ind);
%ind = ind +1;
sz_kaczki = rgb2gray(kaczki); %odcienie szaro�ci
%imshow(sz_kaczki)


T = graythresh(sz_kaczki+.15);% wyznaczamy warto�� progu
% ta funkcja zosta�a zaprojektowana do wsp�pracy z funkcj� im2bw
% pobiera zdj�cie w skali szaro�ci i zwraca znormalizowany T ktory uzywamy
% w im2bw
kaczki1 = im2bw(sz_kaczki,T); % konwetruje zdj�cie do bieli i czernie poprzez progowanie
% zamienia zdj�cie w odcieniach szaro�ci do bieli i czerni
% kaczki1 jest 0 (czarny) wsz�dzie tam gdzie pixel ma warto�� mniejsz� ni�
% T i 1 (bia�y) dla wszystkich innych warto�ci

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki1);

Z = ones(7);

kaczki2 = imopen(kaczki1,Z);% morfologiczne otwarcie


%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki2);

%odwrocenie (kaszki biale, tlo czarne)
kaczki3 = 1 - kaczki2;
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki3);

%szkilet obrazu
kaczki4 = bwmorph(kaczki3,'skel',Inf);
% bwmorph - operacje morfologiczne na obrazach binarnych
% Inf - powtarza operacje na obrazie dop�ki nie b�dzie si� on zmienia�

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki4);

kaczki5 = bwmorph(kaczki3,'thin',Inf);
%
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki5);

kaczki6 = bwmorph(kaczki3,'thicken',Inf);
%zag�szcza obiekty poprzez dodanie pikseli do cz�sci zewnetrzenj obiektu 
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki6);

kaczki7 = bwmorph(kaczki4,'endpoint',Inf);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki7);

kaczki8 = bwdist(kaczki2);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki8);
kaczki8 = kaczki8/max(max(kaczki8));%u�rednianie obrazu
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki8);


%kaczki9 = bwmorph(kaczki3,'remove',Inf);


kaczki9 = bwmorph(kaczki3,'remove',Inf);

kaczki9(1,:)=1; % pierwszy wiersz macierzy na 1
kaczki9(end,:)=1; % ostatni wiersz
kaczki9(:,1)=1;% pierwsza kolumna
kaczki9(:,end)=1;% ostatnia kolumna

kaczki9 = bwdist(kaczki9);

kaczki9 = kaczki9/max(max(kaczki9));
subplot(vc,vh,ind);
ind = ind +1;
imshow(kaczki9);


kaczki9w = watershed(kaczki9);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki9w);
kaczki9 = label2rgb(kaczki9w);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki9);

kaczki10 = kaczki9w;
kaczki10(kaczki10==3)=255;
kaczki10(kaczki10<255) = 0;
kaczki10(kaczki10==255) = 1;
%
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki10*255);

kaczki11 = kaczki.*repmat(double(kaczki10),[1,1,3]);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki11);

kaczki12 = bwlabel(kaczki3);
kaczki12(kaczki12==2)=255;
kaczki12(kaczki12<255) = 0;
kaczki12(kaczki12==255) = 1;
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki12);

kaczki13 = kaczki.*repmat(double(kaczki12),[1,1,3]);
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(kaczki13);



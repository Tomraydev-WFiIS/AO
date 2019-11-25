clear; close all; clc;
im = rgb2gray(double(imread('kaczki.jpg'))/255);
cim = double(imread('kaczki.jpg'))/255;

bim = ~imbinarize(im, .55);
% imshow(bim);figure;

% de_bim = imclose(bim, ones(8));
% imshow(de_bim);figure;
bim = imclose(bim, ones(8));
% imshow(bim);figure;
% wykrylismy obiekty poprzez binaryzacje i zamkniecie.

% liczba eulera - interpretacja - ile obiektow znajduje sie na obrazie
% chcemy zeby liczba eulera w kolejnych operacjach by�a sta�a. Nie
% zmieniamy topologii.

% bwmorph - Morphological operations on binary images
% https://www.mathworks.com/help/images/ref/bwmorph.html

% skel - tworzenie szkieletu obiektu
% szkielet - zbior punktow r�wnoodleg�ych od r�nych kraw�dzi
% jest to wygodna postac do niekt�rych analiz, w szkielecie zachowujemy
% du�o informacji o kszta�cie.
% bim2 = bwmorph(de_bim, 'skel', 1);
% imshow(bim2);

% remove - zwraca obw�d
% bim2 = bwmorph(de_bim, 'skel', 1);
% imshow(bim2);

% shrink - zmniejsza obiekty, zachowuje liczbe eulera, nie jest to �rodek
% masy.
% bim2 = bwmorph(de_bim, 'shrink', 1);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'shrink', 3);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'shrink', 5);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'shrink', Inf);
% imshow(bim2);


% thin - zadna linia nie zostanie przerwana, punkt nie zostanie usuniety
% je�eli ma 2 czarnych s�siad�w
% zastosowanie - zdj�cie satelitarne - gdzie si� znajduj� rzeki, drogi itp.
% bim2 = bwmorph(de_bim, 'thin', 1);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thin', 5);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thin', 10);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thin', Inf);
% imshow(bim2);

% r�ne funkcje, endpoints, branchpoints
% bim2 = bwmorph(de_bim, 'thin', Inf);
% bim2 = bwmorph(bim2, 'branchpoints');
% imshow(bim2);

% dostajemy wsp�rz�dne obiektu, mo�emy tego u�y� do szkolenia sieci
% neuronowej do rozpoznawania obiekt�w
% k nearest neighbours


% mamy dwie funkcje kt�re imituj� erozj�, terez funkcja kt�ra imituje
% dylatacje
% w ka�dym z tch obszar�w na pewno znajduje sie ca�a kaczka
% w danym obszarze znajduje si� dok�adnie jedna kaczka.
% bim2 = bwmorph(de_bim, 'thicken', 10);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thicken', 20);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thicken', 50);
% imshow(bim2);figure;
% bim2 = bwmorph(de_bim, 'thicken', Inf);
% imshow(bim2);

% numerujemy kaczki, kolorujemy

% l = bwlabel(bim);
% duck3 = cim .* (l==3);

% te� dostajemy 3 kaczke ale innym sposobem, ale mamy osobne informacje w
% r�nych obiektach: im, bim, l
% O = bwmorph(bim, 'thicken', Inf);
% l = bwlabel(O);
% imshow(im .* (l==3) .* bim);


% transformata odleg�o�ciowa - odleg�o�� piksela od najbli�szego bia�ego
% piskela, kaczka jest sygna�em, a niebo jest t�em.

% d = bwdist(bim); % d = bwdist(~bim);
% d = d/max(d(:));
% imshow(d);figure;

% segmentacja wododzia�owa - watershed
% l  = watershed(d);
% imshow(label2rgb(l));

% segmentacja z ramk�
bim([1,end],:) = 1;
bim(:,[1,end]) = 1;
imshow(bim);figure;

% r�ne metryki, L1, L2 L_inf - max(a,b)
% d = bwdist(bim, 'cityblock');
% d = bwdist(bim);
d = bwdist(bim, 'chessboard');
% d = bwdist(bim, 'quasi-euclidean'); % metryka - domy�lna jest euklidesowa
d = d/max(d(:));
imshow(d);figure;

% segmentacja z ramk� - segmentacja wododzia�owa - watershed
l  = watershed(d);
imshow(label2rgb(l));



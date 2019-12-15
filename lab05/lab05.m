clear; close all; clc;
im = rgb2gray(double(imread('kaczki.jpg'))/255);
cim = double(imread('kaczki.jpg'))/255;

bim = ~imbinarize(im, .55);
% imshow(bim);figure;

bim = imclose(bim, ones(8));
% imshow(bim);figure;
% wykrylismy obiekty poprzez binaryzacje i zamkniecie.

% liczba eulera - interpretacja - ile obiektow znajduje sie na obrazie
% chcemy zeby liczba eulera w kolejnych operacjach by³a sta³a. Nie
% zmieniamy topologii.

% bwmorph - Morphological operations on binary images
% https://www.mathworks.com/help/images/ref/bwmorph.html

% skel - tworzenie szkieletu obiektu
% szkielet - zbior punktow równoodleg³ych od ró¿nych krawêdzi
% jest to wygodna postac do niektórych analiz, w szkielecie zachowujemy
% du¿o informacji o kszta³cie.
% bim2 = bwmorph(bim, 'skel', Inf);imshow(bim2);figure;


% remove - zwraca obwód
% bim2 = bwmorph(bim, 'remove');
% imshow(bim2);
% imwrite(bim2, "kaczki_perimeter.png")

% shrink - zmniejsza obiekty, zachowuje liczbe eulera, nie jest to œrodek
% masy.
% bim2 = bwmorph(bim, 'shrink', 1);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'shrink', 3);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'shrink', 5);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'shrink', Inf);
% imshow(bim2);


% thin - zadna linia nie zostanie przerwana, punkt nie zostanie usuniety
% je¿eli ma 2 czarnych s¹siadów
% zastosowanie - zdjêcie satelitarne - gdzie siê znajduj¹ rzeki, drogi itp.
% bim2 = bwmorph(bim, 'thin', 1);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thin', 5);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thin', 10);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thin', Inf);
% imshow(bim2);
% imwrite(bim2, "kaczki_thin.png")

% ró¿ne funkcje, endpoints, branchpoints
% bim2 = bwmorph(bim, 'thin', Inf);
% bim3 = bwmorph(bim2, 'branchpoints');
% imshow(bim3);

% dostajemy wspó³rzêdne obiektu, mo¿emy tego u¿yæ do szkolenia sieci
% neuronowej do rozpoznawania obiektów
% k nearest neighbours


% mamy dwie funkcje które imituj¹ erozjê, terez funkcja która imituje
% dylatacje
% w ka¿dym z tch obszarów na pewno znajduje sie ca³a kaczka
% w danym obszarze znajduje siê dok³adnie jedna kaczka.
% bim2 = bwmorph(bim, 'thicken', 10);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thicken', 20);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thicken', 50);
% imshow(bim2);figure;
% bim2 = bwmorph(bim, 'thicken', Inf);
% imshow(bim2);

% numerujemy kaczki, kolorujemy

% l = bwlabel(bim);
% duck3 = cim .* (l==3);

% te¿ dostajemy 3 kaczke ale innym sposobem, ale mamy osobne informacje w
% ró¿nych obiektach: im, bim, l
% O = bwmorph(bim, 'thicken', Inf);
% l = bwlabel(bim);
% imshow(im .* (l==3) .* bim);figure;


% transformata odleg³oœciowa - odleg³oœæ piksela od najbli¿szego bia³ego
% piskela, kaczka jest sygna³em, a niebo jest t³em.

% d = bwdist(bim); % d = bwdist(~bim);
% d = d/max(d(:));
% imshow(d);figure;

% segmentacja wododzia³owa - watershed
% l  = watershed(d);
% imshow(label2rgb(l));

% % segmentacja z ramk¹
% bim([1,end],:) = 1;
% bim(:,[1,end]) = 1;
% imshow(bim);figure;

% ró¿ne metryki, L1, L2 L_inf - max(a,b)
% d = bwdist(bim, 'cityblock');
% d = bwdist(bim);
d = bwdist(bim, 'chessboard');
% d = bwdist(bim, 'quasi-euclidean'); % metryka - domyœlna jest euklidesowa
d = d/max(d(:));
imshow(d);figure;

% segmentacja z ramk¹ - segmentacja wododzia³owa - watershed
l  = watershed(d);
imshow(label2rgb(l));
imwrite(label2rgb(l), "kaczki_chessboard.png")



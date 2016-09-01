clc;
close all;
clear;
I = double(imread('Assignment2/eiffel.jpg'));
inp = input('enter integer number');

IM = I;
for i=1:inp
    G = fspecial('gaussian',[3 3],1);
    h = imfilter(I,G);
    bkp = h;
    I = imresize(bkp,0.5);
end
subplot (1,inp,1);
imshow(uint8(I));
I = IM;

for j=1:inp-1
    Gn = I;
    for i=1:inp+1-j
        G = fspecial('gaussian',[3 3],1);
        h = imfilter(Gn,G);
        Gn = imresize(h,0.5);
    end
    
    Gn1 = I;
    for i=1:inp-j
        G = fspecial('gaussian',[3 3],1);
        h = imfilter(Gn1,G);
        Gn1 = imresize(Gn1,0.5);
    end
     
    Gn = imresize(Gn,2);
    Gnsz = size(Gn)
    Gn1sz = size(Gn1)
    
     if size(Gn) == size(Gn1)
        lapim = Gn1 - Gn;
        subplot (1,inp,j+1);
        imshow(uint8(lapim));
     end
end
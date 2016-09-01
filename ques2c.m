clc;
close all;
clear;
I = double(imread('Assignment2/eiffel.jpg'));
inp = input('enter integer number');

for i=1:inp
    subplot (1,inp,i);
    array(i).img = I;
    imshow(uint8(array(i).img));
    G = fspecial('gaussian',[3 3],1);
    h = imfilter(I,G);
    bkp = h;
    I = imresize(bkp,0.5);
end
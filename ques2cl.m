clc;
close all;
clear;
I = double(imread('Assignment2/eiffel.jpg'));
inp = input('enter the number of levels');

for i=1:inp
    array(i).img = I;
    G = fspecial('gaussian',[3 3],1);
    h = imfilter(I,G);
    bkp = h;
    I = imresize(bkp,0.5);
end

arrlap(inp).img = array(i).img;

for i=1:inp-1
    arrlap(inp-i).img = array(inp-i).img - imresize(array(inp+1-i).img,2);
end
figure

for i=1:inp
    subplot(1,inp,i);
    imshow(uint8(arrlap(i).img));
end

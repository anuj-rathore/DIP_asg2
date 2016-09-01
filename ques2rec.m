clc;
close all;
clear;
I = double(imread('Assignment2/eiffel.jpg'));
inp = input('enter number of levels');

for i=1:inp
    array(i).img = I;
    G = fspecial('gaussian',[3 3],1);
    h = imfilter(I,G);
    bkp = h;
    I = imresize(bkp,0.5);
end
arrlap(inp).img = array(i).img;
img = zeros(512,512,3);
for i=1:inp-1
    arrlap(inp-i).img = array(inp-i).img - imresize(array(inp+1-i).img,2);
end

for i=1:inp
    img = img + imresize(arrlap(i).img,power(2,i-1));
end

imshow(uint8(img));



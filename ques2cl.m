clc;
close all;
clear;
I = double(imread('Assignment2/source.jpg.jpg'));
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


I1 = double(imread('Assignment2/target.jpg.jpg'));

for i=1:inp
    array1(i).img = I1;
    G1 = fspecial('gaussian',[3 3],1);
    h1 = imfilter(I1,G1);
    bkp1 = h1;
    I1 = imresize(bkp1,0.5);
end
arrlap1(inp).img = array1(i).img;
for i=1:inp-1
    arrlap1(inp-i).img = array1(inp-i).img - imresize(array1(inp+1-i).img,2);
end

% for i=1:inp
%     subplot (1,inp,i);
%     imshow(uint8(arrlap(i).img));
% end

I2 = double(imread('Assignment2/mask.png'));
I2 = I2*255;
for i=1:inp
%     subplot (1,inp,i);
    array2(i).img = I2;
%     imshow(uint8(array2(i).img));
    G2 = fspecial('gaussian',[15 15],10);
    h2 = imfilter(I2,G2);
    bkp2 = h2;
    I2 = imresize(bkp2,0.5);
end

I3 = double(imread('Assignment2/mask.png'));
I3 = I3*255;
I3 = 255-I3;
for i=1:inp
%     subplot (1,inp,i);
    array3(i).img = I3;
%     imshow(uint8(array3(i).img));
    G3 = fspecial('gaussian',[15 15],10);
    h3 = imfilter(I3,G3);
    bkp3 = h3;
    I3 = imresize(bkp3,0.5);
end

for i=1:inp
    array2(i).img = array2(i).img/255;
    array3(i).img = array3(i).img/255;
end


for i=1:inp
    finallap(i).img(:,:,1) = (arrlap(i).img(:,:,1) .* array2(i).img) + (arrlap1(i).img(:,:,1) .* array3(i).img);
    finallap(i).img(:,:,2) = (arrlap(i).img(:,:,2) .* array2(i).img) + (arrlap1(i).img(:,:,2) .* array3(i).img);
    finallap(i).img(:,:,3) = (arrlap(i).img(:,:,3) .* array2(i).img) + (arrlap1(i).img(:,:,3) .* array3(i).img);

end

img = zeros(640,1024,3);
for i=1:inp
    img = img + imresize(finallap(i).img,power(2,i-1));
end
imshow(uint8(img));
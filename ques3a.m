clc;
close all;
clear;
I = double(imread('Assignment2/face.jpg'));
imsz = size(I);
k = zeros(imsz(1)+1,imsz(2)+1,3);

for ch=1:3
    for x=2:imsz(1)+1
        for y=2:imsz(2)+1
        k(x,y,ch) = I (x-1,y-1,ch) + k(x-1,y,ch) + k(x,y-1,ch) - k(x-1,y-1,ch);
        end
    end
end
h = [1 -1; -1 1];
final = imfilter(k,h);
imshow(uint8(final));
clc;
clear;
close all;
img = double(imread('Assignment2/boy_smiling.jpg'));

sz = size(img);
[x,y] = meshgrid(1:sz(2), 1:sz(1));
x1 = x - 0.1*x;
y1 = y - 0.1*y;
x1 = floor(min(1, min(sz(2), x1)));
y1 = floor(min(1, min(sz(1), y1)));
out = uint8(zeros(sz(1), sz(2), sz(3)));
for i=1:sz(1)
    for j=1:sz(2)
        out(i,j,:) = img(y1(i,j),x1(i,j),:);
    end
end
imshow(uint8(out));
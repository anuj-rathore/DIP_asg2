clc;
clear;
close all;

I= imread('Assignment2/face.jpg');
subplot(1,2,1);
imshow(I);
sz = size(I);

[x, y,z] = meshgrid(1:sz(2), 1:sz(1), 1:sz(3));
vx = 0.1*y;  
vy = 0.1*x;
D = interp2(double(I), x-vx, y-vy);

subplot(1,2,2);
imshow(uint8(result));
clc;
close all;
clear;
im = double(imread('Assignment2/eiffel.jpg'));
inp = input('enter the number of levels');
arrlap = laplasian(im,inp);
im = laplacerec(arrlap,inp);
imshow(uint8(im));
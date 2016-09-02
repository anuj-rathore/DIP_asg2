clc;
close all;
clear;
I = double(imread('Assignment2/source.jpg.jpg'));
inp = input('enter the number of levels');
subplot(1,2,1);
imshow(uint8(I));
array = gaussian(I,inp);
arrlap = laplasian(I,inp);

I1 = double(imread('Assignment2/target.jpg.jpg'));
array1 = gaussian(I1,inp);
arrlap1 = laplasian(I1,inp);

I2 = double(imread('Assignment2/mask.png'));
I2 = I2*255;
array2 = gaussian(I2,inp);
I3 = double(imread('Assignment2/mask.png'));
I3 = I3*255;
I3 = 255-I3;
array3 = gaussian(I3,inp);

for i=1:inp
    array2(i).img = array2(i).img/255;
    array3(i).img = array3(i).img/255;
end

for i=1:inp
    finallap(i).img(:,:,1) = (arrlap(i).img(:,:,1) .* array2(i).img) + (arrlap1(i).img(:,:,1) .* array3(i).img);
    finallap(i).img(:,:,2) = (arrlap(i).img(:,:,2) .* array2(i).img) + (arrlap1(i).img(:,:,2) .* array3(i).img);
    finallap(i).img(:,:,3) = (arrlap(i).img(:,:,3) .* array2(i).img) + (arrlap1(i).img(:,:,3) .* array3(i).img);

end
img = laplacer(finallap,inp);
subplot(1,2,2);
imshow(uint8(img));
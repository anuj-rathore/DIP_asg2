clc;
clear;
close all;
img = double(imread('Assignment2/boy_smiling.jpg'));
sz = size(img);
yc = sz(1)/2; 
xc = sz(2)/2;
[x,y] = meshgrid(1:sz(2), 1:sz(1));

r = sqrt( (x-xc).^2+ (y-yc).^2);
rmax = 200;
theta = atan2(y-yc, x-xc);
alpha = 2;

thetat = theta + alpha * (rmax-r)/rmax;
x1 = r.*cos(thetat) + xc;
y1 = r.*sin(thetat) + yc;

out = uint8(zeros(sz(1), sz(2), sz(3)));
x1 = floor(max(1, min(sz(2), x1)));
y1 = floor(max(1, min(sz(1), y1)));

for i=1:sz(1)
    for j=1:sz(2)
        out(i,j,:) = img(y1(i,j),x1(i,j),:);
    end
end
imshow(uint8(out));
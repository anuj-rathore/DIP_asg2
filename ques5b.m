clc;
clear;
close all;
im = double(imread('Assignment2/face.jpg'));
subplot(1,2,1)
imshow(uint8(im));
output = zeros(size(im));
sz = size(im);
xc = round(sz(1)/2);
yc = round(sz(2)/2);
alpha = 2;
rmax = 200; 
for x=1:sz(1)
    for y=1:sz(2)
        dx = x - xc;
        dy = y - yc;
        r = sqrt (dx*dx + dy*dy);
        beta = atan2(dy,dx) + (alpha*((rmax-r)/rmax));
        
        if r <= rmax
            xop = round(xc + r*cos(beta));
            yop = round(yc + r*cos(beta));
        else
            xop = x;
            yop = y;
        end
        output(x,y,:) = im(xop, yop,:);
    end
end
subplot(1,2,2);
imshow(uint8(output));

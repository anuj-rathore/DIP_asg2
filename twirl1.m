img = double(imread('Assignment2/boy_smiling.jpg'));
sz = size(img);
yc = sz(1)/2; 
xc = sz(2)/2;
[x,y] = meshgrid(1:Ncolumns, 1:Nrows);

r = sqrt( (x-xc).^2+ (y-yc).^2);
theta = atan2(y-yc, x-xc);
a = 1.5;b = 10; c = 0.6; 
d = 1/150;
s = 1./(1+exp(b*(c-d*r)));

thetatilde = theta + (1.0 - s)*a;
xtilde = r.*cos(thetatilde) + xc;
ytilde = r.*sin(thetatilde) + yc;

out = uint8(zeros(sz(1), sz(2), sz(3)));
xtilde = floor(max(1, min(sz(2), xtilde)));
ytilde = floor(max(1, min(sz(1), ytilde)));

for n=1:sz(1)
    for m=1:sz(2)
        out(n,m,:) = img(ytilde(n,m),xtilde(n,m),:);
    end
end
imshow(out);
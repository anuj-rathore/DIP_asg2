I= imread('Assignment2/face.jpg');
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

szr = size(R);
szg = size(G);
szb = size(B);

[xr, yr] = meshgrid(1:szr(2), 1:szr(1));
vxr = 0.1*yr;  
vyr = 0.1*xr;   
Dr = interp2(double(R), xr-vxr, yr-vyr);

[xg, yg] = meshgrid(1:szg(2), 1:szg(1));
vxg = 0.1*yg;  
vyg = 0.1*xg;   
Dg = interp2(double(G), xg-vxg, yg-vyg);

[xb, yb] = meshgrid(1:szb(2), 1:szb(1));
vxb = 0.1*yb;  
vyb = 0.1*xb;   
Db = interp2(double(B), xb-vxb, yb-vyb);

result(:,:,1) = Dr;
result(:,:,2) = Dg;
result(:,:,3) = Db;

imshow(uint8(result));
clc;
clear;
close all;
I= imread('Assignment2/boy_smiling.jpg');
% subplot(1,2,1);
% imshow(I);

R = I(:,:,1);
szr = size(R);
[xr, yr] = meshgrid(1:szr(2), 1:szr(1));

xc = floor(szr(1)/2);
yc = floor(szr(2)/2);

A = R(xc-100:xc+100,yc-100:yc+100);
B=uint8(zeros(size(A)));
subplot(1,2,1);
imshow(A);

midx=ceil((size(A,1)+1)/2);
midy=ceil((size(A,2)+1)/2);
K=100;
x2=zeros([size(A,1) size(A,2)]);
y2=zeros([size(A,1) size(A,2)]);
for i=1:size(A,1)
    x=i-midx-K;
    for j=1:size(A,2)

        %Cartesian to Polar co-ordinates
        [theta1,rho1]=cart2pol(x,j-midy+K);               
        phi=theta1+(rho1/K);
       

        %Polar to Cartesian co-ordinates
        [l,m]=pol2cart(phi,rho1);
        x2(i,j)=ceil(l)+midx;
        y2(i,j)=ceil(m)+midy;
       
    end
end
x2=max(x2,1);
x2=min(x2,size(A,1));

y2=max(y2,1);
y2=min(y2,size(A,2));
        
       
        for i=1:size(A,1)
            for j=1:size(A,2)
                B(i,j,:)=A(x2(i,j),y2(i,j),:);
            end
        end
        
        subplot(1,2,2);
        imshow(B);
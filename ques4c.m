im = double(imread('Assignment2/boy_smiling.jpg'));
subplot(1,2,1);
imshow(uint8(im));
im = im/255;
w = 2;
sigma_d = 2;
sigma_r =0.1;

im = applycform(im,makecform('srgb2lab'));

% Pre-compute Gaussian domain weights.
[X,Y] = meshgrid(-w:w,-w:w);
G = exp((X.^2+Y.^2)/(2*sigma_d^2));

% Rescale range variance (using maximum luminance).
sigma_r = 100*sigma_r;


% Apply bilateral filter.
sz = size(im);
result = zeros(sz);
for i = 1:sz(1)
   for j = 1:sz(2)
      
         % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,sz(1));
         jMin = max(j-w,1);
         jMax = min(j+w,sz(2));
         I = im(iMin:iMax,jMin:jMax,:);
      
         % Compute Gaussian range weights.
         dL = I(:,:,1)-im(i,j,1);
         da = I(:,:,2)-im(i,j,2);
         db = I(:,:,3)-im(i,j,3);
         H = exp((dL.^2+da.^2+db.^2)/(2*sigma_r^2));
      
         % Calculate bilateral filter response.
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         norm_F = sum(F(:));
         result(i,j,1) = sum(sum(F.*I(:,:,1)))/norm_F;
         result(i,j,2) = sum(sum(F.*I(:,:,2)))/norm_F;
         result(i,j,3) = sum(sum(F.*I(:,:,3)))/norm_F;
                
   end
end
result = applycform(result,makecform('lab2srgb'));
result = result *255;
subplot(1,2,2);
imshow(uint8(result));
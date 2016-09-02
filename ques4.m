im = double(imread('Assignment2/face.png'));
subplot(1,2,1);
imshow(uint8(im));

im = im/255;
w = 2;
sigma_d = 2;
sigma_r = 0.1;

% Pre-compute Gaussian distance weights.
[x,y] = meshgrid(-w:w,-w:w);
G = exp(-(x.^2+y.^2)/(2*sigma_d^2));

sz = size(A);
result = zeros(sz);
for i = 1:sz(1)
   for j = 1:sz(2)       
        % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         I = im(iMin:iMax,jMin:jMax);
      
         % Compute Gaussian intensity weights.
         H = exp(-(I-A(i,j)).^2/(2*sigma_r^2));
      
         % Calculate bilateral filter response.
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         result(i,j) = sum(F(:).*I(:))/sum(F(:));
   end
end

result = result*255;
subplot(1,2,2);
imshow(uint8(result));

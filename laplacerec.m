function [img] = laplacerec (arrlap,inp)
   img = zeros(512,512,3);
    for i=1:inp
        img = img + imresize(arrlap(i).img,power(2,i-1));
    end

    
end


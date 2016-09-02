function [array] = gaussian(I,inp)
    for i=1:inp
        array(i).img = I;
        G = fspecial('gaussian',[3 3],1);
        h = imfilter(I,G);
        bkp = h;
        I = imresize(bkp,0.5);
    end
end
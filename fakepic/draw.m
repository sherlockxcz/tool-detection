subplot(2,1,1);
i2=imread('.tif');
gray2=rgb2gray(i2);
imhist(gray2); 


subplot(2,1,2);
i1=imread('4.tif');
gray1=rgb2gray(i1);
imhist(gray1); 
ylabel('像素数量')
ylabel('像素数量')


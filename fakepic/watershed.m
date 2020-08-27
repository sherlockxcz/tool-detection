img=imread('4-major flank.png');
I=rgb2gray(img);
I1=imtophat(I,strel('disk',10));
figure,imshow(I1);

I2=imadjust(I1);
figure,imshow(I2);

level=graythresh(I2);
BW=im2bw(I2,level);
figure,imshow(BW);

C=~BW;
figure,imshow(C);
D=-bwdist(C);

D(C)=-Inf;

L=watershed(D);
figure,imshow(L);
w1=label2rgb(L,'hot','w');
figure,imshow(w1);
im=I;
im(L==0)=0;
figure,imshow(im);






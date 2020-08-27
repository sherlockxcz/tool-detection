clear
clc
img=imread('3-major flank.png');
imshow(img);title('原图');
figure();
f=rgb2gray(img);    %对于RGB图像必须做的一步，也可以用im2double函数
imshow(f);title('灰度图');
figure;
F=fft2(f);          %傅里叶变换
F1=log(abs(F)+1);   %取模并进行缩放
imshow(F1,[]);title('傅里叶变换频谱图');
figure();
Fs=fftshift(F);      %将频谱图中零频率成分移动至频谱图中心
S=log(abs(Fs)+1);    %取模并进行缩放
imshow(S,[]);title('频移后的频谱图');
figure();
fr=real(ifft2(ifftshift(Fs)));  %频率域反变换到空间域，并取实部
ret=im2uint8(mat2gray(fr));    %更改图像类型
imshow(ret),title('逆傅里叶变换');







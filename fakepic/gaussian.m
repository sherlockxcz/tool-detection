close all;

image=imread('time33.png');
image=rgb2gray(image);
imshow(image);title('');figure;

img_f = fft2(double(image));%傅里叶变换得到频谱
img_f=fftshift(img_f);  %移到中间
F1=log(abs(img_f)+1);   %取模并进行缩放
imshow(F1,[]);title('');figure;

[M ,N]=size(img_f);
m_mid=floor(M/2);%中心点坐标
n_mid=floor(N/2);  
d0=100;  %阈值
img_lpf=zeros(M,N);
for i = 1:M
    for j = 1:N
        d = ((i-m_mid)^2+(j-n_mid)^2);
        h = exp(-d/(2*(d0^2)));    
        img_lpf(i,j) = h*img_f(i,j);
    end
end

F2=log(abs(img_lpf)+1);    %取模并进行缩放
imshow(F2,[]);title('');figure;

img_lpf=ifftshift(img_lpf);    %中心平移回原来状态
img_lpf=uint8(real(ifft2(img_lpf)));  %反傅里叶变换,取实数部分

imshow(img_lpf);title('');

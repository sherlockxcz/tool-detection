close all;

image=imread('time33.png');
image=rgb2gray(image);
imshow(image);title('');figure;

img_f = fft2(double(image));%����Ҷ�任�õ�Ƶ��
img_f=fftshift(img_f);  %�Ƶ��м�
F1=log(abs(img_f)+1);   %ȡģ����������
imshow(F1,[]);title('');figure;

[M ,N]=size(img_f);
m_mid=floor(M/2);%���ĵ�����
n_mid=floor(N/2);  
d0=100;  %��ֵ
img_lpf=zeros(M,N);
for i = 1:M
    for j = 1:N
        d = ((i-m_mid)^2+(j-n_mid)^2);
        h = exp(-d/(2*(d0^2)));    
        img_lpf(i,j) = h*img_f(i,j);
    end
end

F2=log(abs(img_lpf)+1);    %ȡģ����������
imshow(F2,[]);title('');figure;

img_lpf=ifftshift(img_lpf);    %����ƽ�ƻ�ԭ��״̬
img_lpf=uint8(real(ifft2(img_lpf)));  %������Ҷ�任,ȡʵ������

imshow(img_lpf);title('');

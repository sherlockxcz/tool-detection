clear
clc
img=imread('3-major flank.png');
imshow(img);title('ԭͼ');
figure();
f=rgb2gray(img);    %����RGBͼ���������һ����Ҳ������im2double����
imshow(f);title('�Ҷ�ͼ');
figure;
F=fft2(f);          %����Ҷ�任
F1=log(abs(F)+1);   %ȡģ����������
imshow(F1,[]);title('����Ҷ�任Ƶ��ͼ');
figure();
Fs=fftshift(F);      %��Ƶ��ͼ����Ƶ�ʳɷ��ƶ���Ƶ��ͼ����
S=log(abs(Fs)+1);    %ȡģ����������
imshow(S,[]);title('Ƶ�ƺ��Ƶ��ͼ');
figure();
fr=real(ifft2(ifftshift(Fs)));  %Ƶ���򷴱任���ռ��򣬲�ȡʵ��
ret=im2uint8(mat2gray(fr));    %����ͼ������
imshow(ret),title('�渵��Ҷ�任');







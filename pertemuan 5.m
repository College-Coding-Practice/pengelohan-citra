clc
clear all
close all
a=imread('D:\pak aviv\pengolahan citra\matlab\Profil.jpg');
b=size(a);

n=input('enter the size of mask:');
n1=ceil(n/2);
a=double(a);
ipf=(1/n^2)*ones(n);
hpf=-ipf;
hpf(n1,n1)=(n^2-1)/n^2;

c=0;
h=0;
for i=n1:b(1)-n1+1
    for j=n1:b(2)-n1+1
        for k=1:n
            for l=1:n
            c=c+a(i-n1+k,j-n1+l)*ipf(k,l);
            end
        end
        
        d(i,j)=c;
        c=0;
    end
end
e=uint8(d);
figure;imshow(e);title('low pass image');

for i=n1:b(1)-n1
    for j=n1:b(2)-n1
        for k=1:n
            for l=1:n
            h=h+a(i-n1+k,j-n1+1)*hpf(k,l);
            end
        end
        
        g(i,j)=h;
        h=0;
    end
end
f=uint8(g);
figure;imshow(f);title('high pass image');
figure;imshow(uint8(a));title('Original image');
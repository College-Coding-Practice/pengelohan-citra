M=8; N=8;
B=zeros([8,8]);
for P=1:M
    p=P-1;
    for Q=1:N
        q=Q-1;
        if (p)==0 && (q)==0
            ap=1/(sqrt(M));
            aq=1/(sqrt(N));
        else
            ap=sqrt(2/M);
            aq=sqrt(2/N);
        end
        for x=1:M
            for y=1:N
                B(x,y)=ap*aq*cos((pi*(p)*(2*(x-1)+1))/(2*M))*cos((pi*(q)*(2*(y-1)+1))/(2*N));
            end
        end
        basisimg = ind2rgb(im2uint8(B),copper);
        filename=strcat(num2str(p),num2str(q),'D:\pak aviv\pengolahan citra\pertemuan 6\DCT\aku.png');
        imwrite(imresize(basisimg,[64,64],'nearest'),filename);
    end
end
path='D:\pak aviv\pengolahan citra\pertemuan 6\DCT\aku.png';
imds=imgeDatastore(fullfile(path,'*.png'));
montage(imds,'BackgroundColor','white','BorderSize',[2,2]);

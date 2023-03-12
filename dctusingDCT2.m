[filename,pathname]=uigetfile('','Select grayscale Image');
filewithpath=strcat(pathname,filename);
img=imread(filewithpath); %reading Image
C=dct2(double(img)); %Finding DCT

figure
imshow(Log(abs(C)),[]) %Displayuing DCT coefficients
title('DCT Coeffs. before truncation');
colormap(gca,jet(64))
colorbar

C(abs(C)<10)=0; %Coefficients Truncation

figure
imshow(log(abs(C)),[]); %Displaaying DCT coefficients
title('DCT Coeffs. after truncation');
colormap(gca,jet(64))
colorbar

Ct=idct2(C); %Taking Inverse DCT

%Writing Images for size comparison
imwrite(img,'Original_Image.jpg','quality',100);
imwrite(uint8(Ct),'DCT_Compressed_Image.jpg','quality',100);

figure
imshowpair(img,Ct,'montage') %Displaying Image
title('Original Grayscale Image (Left) and DCT Compressed Image (Right)');

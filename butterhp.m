function [ out ] = butterhp( im,d,n )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
b=size(im,1);
w=size(im,2);
[x,y]=meshgrid(-floor(w/2):floor(w-1)/2; -floor(h/2):floor(h-1)/2);
out=1./(1.+(d./(x.^2+y.^2).^0.5).^(2*n));

end


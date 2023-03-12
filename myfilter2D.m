%Function to implement filter's frequency response H(u,v)
function H=myfilter2D(type,M,N,D0,n)
P=floor (M/2); Q=floor(N/2);
D=zeros(M,N); H=zeros(M,N);
switch type
    case 'idealLPF'
        for u=1:M
            for v=1:N
                D(u,v)=sqrt((u-P)^2+(v-Q)^2);
                if D(u,v)<=D0
                    H(u,v)=1;
                end
            end
        end
    case 'butterLPF'
        for u=1:M
            for v=1:N
                D(u,v)=sqrt((u-P)^2+(v-Q)^2);
                H(u,v)=exp(-((D(u,v)^2)/(2*D0^2)));
            end
        end
    case 'gaussianLPF'
        for u=1:M
            for v=1:N
                D(u,v)= sqrt ((u-P)^2+(v-Q)^2);
                H(u,v)=1-exp(-((D(u,v)^2)/(2*D0^2)));
            end
        end
end
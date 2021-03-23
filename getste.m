function STE=getste(x,y,n,p_sig)
ste=0;
for i=0:3
    for j=0:3
        for k=0:3
p1=getp1(i,j,x,n);
p2=getp2(i,j,k,x,y,n);
p3=getp3(j,k,x,y,n);
p4=getp4(i,p_sig);
p6=p2*p4;
p7=p1*p3;
%p5=(p2/p3)/(p1/p4)=p2*p4/(p1*p3);

if(p2==0||p7==0)
   % ste(i*16+j*4+k+1)=0;
    else p5=p6/p7;
       % ste(i*16+j*4+k+1)=p2*log(p5)./log(2);
%       ste=ste+p2*log(p5)./log(2);
       ste=ste+p2*log2(p5);
         end
     end
     end
end
%STE=sum(ste);
STE=ste;
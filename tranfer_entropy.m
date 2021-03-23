function e1=tranfer_entropy(path,n,m)
data1=dlmread(path,'\t',[m,1,n+m,1]);
data2=dlmread(path,'\t',[m,2,n+m,2]);
%+++++++++++++++++++++++++++++++++X时间序列化为符号序列+++++++++++++++++++++++++++++++
n0=0;
n1=0;
n2=0;
n3=0;
R=data1;
data_num_end=n;
X=R(1:data_num_end,1);
%X(1:1);
length=size(X,1);
a=0.05;
u1=0;
u2=0;
count_u1=0;
count_u2=0;
for ix=1:length
    if X(ix)>=0
        u1=u1+X(ix);
        count_u1=count_u1+1;
    else
        u2=u2+X(ix);
        count_u2=count_u2+1;
    end
end
u1=u1/count_u1;
u2=u2/count_u2;
for j=1:length
    if ((X(j)>u1)&(X(j)<=(1+a)*u1))|((X(j)<u2)&(X(j)>=(1+a)*u2))
        S(j)=0;
        n0=n0+1;
    else if ((X(j)>(1+a)*u1)&(X(j)<inf))|((X(j)<(1+a)*u2))
            S(j)=1;
            n1=n1+1;
        else if ((X(j)>(1-a)*u1)&(X(j)<u1))|((X(j)<(1-a)*u2)&(X(j)>u2))
               S(j)=2; 
               n2=n2+1;
            else if ((X(j)<=(1-a)*u1)&(X(j)>=0))|((X(j)>=(1-a)*u2)&(X(j)<0))
                    S(j)=3; 
                    n3=n3+1;
                else error;
                end
            end
        end
    end
end
%S
p0=n0/length;
p1=n1/length;
p2=n2/length;
p3=n3/length;
p_sig=[p0,p1,p2,p3];
%++++++++++++++++++++++++++原始序列转化成3-bit word并计算概率++++++++++++++++++++++++++++++
Z=zeros(1,64);
for r=1:64
    for t=1:length-2
        W(t)=S(t)*16+S(t+1)*4+S(t+2)+1;
            if W(t)==r
               Z(r)=Z(r)+1;  
            end
    end
    P(r)=Z(r)/(length-2);
end
% subplot(1,2,1);
% plot(P);
% xlabel('字符编码');
% ylabel('概率');
%P
%+++++++++++++++++++++++++++++++++++++X的熵++++++++++++++++++++++++++++++++++++++++
for i=1:64
    if (P(i)>1.0e-12)
        hx(i)=(-1)*P(i)*log2(P(i));
    else
        hx(i)=0;
    end
end
Hx=sum(hx);




%+++++++++++++++++++++++++++++++++Y时间序列化为符号序列+++++++++++++++++++++++++++++++
R2=data2;
data_num_end=n;
Y=R2(1:data_num_end,1);
u3=0;
u4=0;
count_u3=0;
count_u4=0;
for iy=1:length
   if Y(iy)>=0
       u3=u3+Y(iy);
       count_u3=count_u3+1;
   else u4=u4+Y(iy);
       count_u4=count_u4+1;
   end
end
u3=u3/(count_u3+eps);
u4=u4/count_u4;
for iy=1:length
   if ((Y(iy)>u3)&(Y(iy)<=(1+a)*u3))|((Y(iy)<u4)&(Y(iy)>=(1+a)*u4))
       O(iy)=0;
   else if ((Y(iy)>(1+a)*u3)&(Y(iy)<inf))|((Y(iy)<(1+a)*u4))
           O(iy)=1;
       else if ((Y(iy)>(1-a)*u3)&(Y(iy)<u3))|((Y(iy)<(1-a)*u4)&(Y(iy)>u4))
              O(iy)=2; 
           else if ((Y(iy)<=(1-a)*u3)&(Y(iy)>=0))|((Y(iy)>=(1-a)*u4)&(Y(iy)<0))
                   O(iy)=3; 
               else error;
               end
           end
       end
   end
end
%subplot(2,2,3);
%plot(my,'.');
%plot(my);
%grid on;
%xlabel('次数');
%ylabel('abs(Y)');

%++++++++++++++++++++++++++++++++++++++++3-bit word及其概率+++++++++++++++++++++++++++
M=zeros(1,64);
for r=1:64
   for t=1:length-2
       N(t)=O(t)*16+O(t+1)*4+O(t+2)+1;        
       if N(t)==r
          M(r)=M(r)+1; 
       end
   end
   PY(r)=M(r)/(length-2);
end 
% subplot(1,2,2);
%     plot(PY);
%     xlabel('字符编码');
%     ylabel('概率');
    
%+++++++++++++++++++++++++++++++++++++Y的熵++++++++++++++++++++++++++++++++++++++++
for j=1:64
   if (PY(j)>1.0e-12)
       hy(j)=(-1)*PY(j)*log2(PY(j));
   else
       hy(j)=0;
   end
end
Hy=sum(hy);

%++++++++++++++++++++++++++++++++++++++传输熵+++++++++++++++++++++++++++++++++++++++
STE=getste(S,O,n,p_sig);
e1=STE;
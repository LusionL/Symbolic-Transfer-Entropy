
%data1=dlmread('D:\data\Vpc_119_1.39.txt','\t',[1,1,500,1]);
data1=dlmread('Vpc_119_1.39.txt','\t',[1,1,500,1]);
n0=0;
n1=0;
n2=0;
n3=0;
R=data1;
data_num_end=500;
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
 x=1:500;
plot(x,data1);
axis([1 500 -2 3]);
for i=1:10:500
    ay(i)=-1.5;
end
for x=1:10:500
text(x,ay(x),num2str(S(x)));
end
%scatter(x,S);
%plot(x,S);
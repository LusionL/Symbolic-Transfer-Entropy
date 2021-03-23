clear;
clc;
N_num=1000;

for j=1:10
    
 m(j)=1+j*500;
end
 
  for i=1:10 
 norm(i)=tranfer_entropy('D:\data\nsrdb-16483.txt',N_num,m(i));%m为起始位置

end
 plot(m,norm,'-r.','MarkerSize',20,'LineWidth',2); hold on;
%  axis([500 5500 0 0.05]);
%  xlabel('time');
%  ylabel('tranfer entropy');
%  legend('NOR');
 for i=1:10 
 norm(i)=tranfer_entropy('D:\data\Apb_113_24.01.txt',N_num,m(i));%m为起始位置

end

 plot(m,norm,'-b*','MarkerSize',10,'LineWidth',2); hold on;
% axis([500 5500 0 0.05]);
%  xlabel('time');
%  ylabel('tranfer entropy');
%  legend('APB');
 for i=1:10 
 norm(i)=tranfer_entropy('D:\data\Vpc_105_15.44.txt',N_num,m(i));%m为起始位置

end

 plot(m,norm,'-g+','MarkerSize',10,'LineWidth',2); hold on;

axis([500 5500 0 0.05]);
 xlabel('time');
 ylabel('tranfer entropy');
 legend('NOR','APB','VPC');
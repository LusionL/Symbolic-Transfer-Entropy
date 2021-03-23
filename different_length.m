clear;
clc;

i=1;
m=8000;
for N_num=1000:1000:8000
norm1=tranfer_entropy('D:\data\nsrdb-16265.txt',N_num,m);
    norm_all(i)=norm1;
    
vpc1=tranfer_entropy('D:\data\Vpc_105_15.44.txt',N_num,m);

Vpc_all(i)=vpc1;

apb1=tranfer_entropy('D:\data\Apb_101_6.15.83.txt',N_num,m);

Apb_all(i)=apb1;

i=i+1;

end

N_num=1000:1000:8000;
plot(N_num,norm_all,'-k.','MarkerSize',20,'LineWidth',2); hold on
plot(N_num,Vpc_all,'-kx','MarkerSize',10,'LineWidth',2); hold on
plot(N_num,Apb_all,'-k^','MarkerSize',10,'LineWidth',2); hold on

legend('NSR','VPC','APB');

xlabel('Length Of Series','fontsize',12,'fontweight','b');
ylabel('Transfer Entropy','fontsize',12,'fontweight','b');

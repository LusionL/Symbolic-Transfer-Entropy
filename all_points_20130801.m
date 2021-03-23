clear;
clc;
N_num=2000;
m=3000;
norm(1)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16420.txt',N_num,m);
norm(2)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16483.txt',N_num,m);
norm(3)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16539.txt',N_num,m);
norm(4)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16773.txt',N_num,m);
norm(5)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16786.txt',N_num,m);
norm(6)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-16795.txt',N_num,m);
norm(7)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-17052.txt',N_num,m);
norm(8)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-17453.txt',N_num,m);
norm(9)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-18177.txt',N_num,m);
norm(10)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\nsrdb-18184.txt',N_num,m);
M1=10;
norm_average=sum(norm)/M1
norm_max=max(norm)
norm_min=min(norm)
norm_std=std(norm)
norm_all=[norm_max,norm_average,norm_min]
norm_all_points=norm;
x_norm=[3,3,3,3,3,3,3,3,3,3];
plot(x_norm,norm_all_points,'-r.','MarkerSize',20,'LineWidth',2); hold on

vpc(1)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_105_15.44.txt',N_num,m);
vpc(2)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_106_1.31.29.txt',N_num,m);
vpc(3)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_116_13.52.65.txt',N_num,m);
vpc(4)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_119_1.39.txt',N_num,m);
vpc(5)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_121_16.53.txt',N_num,m);
vpc(6)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_123_7.03.53.txt',N_num,m);
vpc(7)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_200_0.62.txt',N_num,m);
vpc(8)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_202_28.73.txt',N_num,m);
vpc(9)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_203_1.48.68.txt',N_num,m);
vpc(10)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Vpc_205_24.43.79.txt',N_num,m);
vpc_average=sum(vpc)/M1
vpc_max=max(vpc)
vpc_min=min(vpc)
vpc_std=std(vpc)
vpc_all=[vpc_max,vpc_average,vpc_min]
vpc_all_points=vpc;
x_vpc=[4,4,4,4,4,4,4,4,4,4];
plot(x_vpc,vpc_all_points,'-rx','MarkerSize',10,'LineWidth',2); hold on

apb(1)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_100_5.68.txt',N_num,m);
apb(2)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_101_6.15.83.txt',N_num,m);
apb(3)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_103_19.21.87.txt',N_num,m);
apb(4)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_112_11.44.txt',N_num,m);
apb(5)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_113_24.01.txt',N_num,m);
apb(6)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_114_26.38.txt',N_num,m);
apb(7)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_201_48.75.txt',N_num,m);
apb(8)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_209_53.18.txt',N_num,m);
apb(9)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_220_49.82.txt',N_num,m);
apb(10)=tranfer_entropy('D:\数据\MIT data\MIT-BIH Normal Sinus Rhythm Database (nsrdb)\Apb_223_5.50.37.txt',N_num,m);
apb_average=sum(apb)/M1
apb_max=max(apb)
apb_min=min(apb)
apb_std=std(apb)
apb_all=[apb_max,apb_average,apb_min]
apb_all_points=apb;

x_apb=[5,5,5,5,5,5,5,5,5,5];
plot(x_apb,apb_all_points,'-r^','MarkerSize',10,'LineWidth',2); hold on
axis([2 6 0 0.1]);
set(gca,'xticklabel','||NSR||VPC||APB');
legend('NSR','VPC','APB');
ylabel('tranfer entropy','fontsize',12,'fontweight','b');
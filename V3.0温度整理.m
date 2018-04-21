%V3.0数据整理温度
clc;
clear;
file=dir('SURF_CLI_CHN_MUL_DAY-WIN-11002-*.txt');        %列出所有的txt文件，EVP蒸发
loaction=53614;                                          %各地的代码
%loaction=(57046,54416,58238,59287)                      %读取西安，北京，南京，广州各地的代码
a=0;
t=3;                                                     %年份
 A=zeros(365*t,7);                                       %三年 ，365*4=1460
 A(:,1)=linspace(1,365*t,365*t);
for i=1:length(file);                                    %读取每个月的数据
     temp=importdata(file(i).name);                      %读取每一个的降雨输入数据
     [m,n]=size(temp);
         for k=1:m;                                      % k标记temp行数
              if temp(k,1)==loaction  ;                  %选中站点的行
                  a=a+1;                                 %A中行数的标记
                  A(a,2)=temp(k,5);                      %年
                  A(a,3)=temp(k,6);                      %月
                  A(a,4)=temp(k,7);                      %日
                  if temp(k,8)==32700;
                      temp(k,8)=0;
                  end
                  if temp(k,9)==32700;
                      temp(k,9)=0;
                  end
                  if temp(k,10)==32700;
                      temp(k,10)=0;
                  end
                  A(a,5)=temp(k,8)*0.1;                     %单位m/s
                  A(a,6)=A(a,5)*0.0006214*60*60;            %单位 mile/h
                 % A(a,6)=temp(k,9)*0.1;                     %日最高气温
                %  A(a,7)=temp(k,10)*0.1;                    %日最低气温
              end
         end
end
xlswrite('银川2015风速.xlsx',A)                              %保存文件格式
%o1=sum(A(1:365,6))
%o2=sum(A(1:365,7))
%p1=sum(A((1+365):(365+365),6))
%p2=sum(A((1+365):(365+365),7))
%q1=sum(A((1+365*2):(365+365*2),6))
%q2=sum(A((1+365*2):(365+365*2),7))

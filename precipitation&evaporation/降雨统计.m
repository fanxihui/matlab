%V3.0数据整理降雨
clc;
clear;
load sation.mat;
year=2016;
file=dir('S20180131*.txt');        %列出所有的txt文件，EVP蒸发
%loaction=(57046,54416,58238,59287)         %读取西安，北京，南京，广州各地的代码
A=zeros(756,3);                             %A,保存格式，三列分别是station,year,precipation
for s=1:756;
    s
    A(s,1)=station(s);                      %第一列为station
    A(s,2)=year;                            %第二列为year;
    flag=0;
    for i=1:length(file);                   %读取每个月的数据
     temp=importdata(file(i).name);         %读取每一个的蒸发数据
     xx=temp.data;
     [m,n]=size(xx);
         if flag==1;
         break
         end
         for k=1:m;                                    % k标记temp行数
              if xx(k,2)==station(s) & xx(k,3)==year   ;% 年和站点相同
				for tt=0:11;
					if xx(k+tt,4)==32766;              %判断是否存在错误
					xx(k+tt,4)=0;
                    end
                end
              A(s,3)=sum(xx(k:(k+11),4));
              flag=1;
              break
              end
         end

    end
end
xlswrite([num2str(year),'.xlsx'],A)                     %保存文件格式

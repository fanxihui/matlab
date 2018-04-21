clear all
clc;
%取所有文件
%
for i=[617 618 619 620 621 622 623 624 625 626 627 628];        %获取所需的月份
    for j=00:23;
    % eg filename = '.\RAD_2012060105.dat';
    filename=['.\RAD_20120',num2str(i),num2str(j)];
    %读取filename的内容，只读
    fid = fopen(filename,'r');
    %显示需要显示的内容
    disp(filename);
    %fread 读取901*1401个数，以real*4的格式读取
    a = fread(fid,901*1401,'real*4');
    %重新保存数据，以901行，1401列保存
    b = reshape(a,901,1401);
    xa=70.025:0.05:140.025;
    ya=59.975:-0.05:14.975;
    [x,y]=meshgrid(xa,ya);
    %关闭文件
    fclose(fid);
    %取出杭州所在的经纬值
    %杭州 120.2E,30.3N

	end
end

% data input
clc  
clear   
data = xlsread('data.xlsx');
format long
for test=1:20;                  %计算的项目
    h=data(:,2*test-1);
    h=h(~ isnan(h));    % 删除Nan值
    theta= data(:,2*test);
    theta=theta(~ isnan(theta));
    semilogx(h,theta,'o');
    X0=[0.3,0.4,3000,0.1,100];
    X(test,:)=lsqcurvefit(@bimodal,X0,h,theta)
    %决定系数R2计算
    mean_theta = mean(theta);
    ssr = sum((theta-(X(test,1)+X(test,2)*exp(-h/X(test,3))+X(test,4)*exp(-h/X(test,5)))).^2);
    sst = sum((theta-mean_theta).^2);
    R2(test)=1-ssr/sst
    hold on;
    %输出参数
    str=['C=' num2str(X(test,1))  ' A1=' num2str(X(test,2)) ' h1=' ...
        num2str(X(test,3)) ' A2=' num2str(X(test,4)) ' h2=' num2str(X(test,5))];
    display(str)
    %求导过程,10000份数值计算
    head=logspace(0,4,10000);
    theta_c=X(test,1)+X(test,2)*exp(-head/X(test,3))+X(test,4)*exp(-head/X(test,5));
    semilogx(head,theta_c)
    for i=1:9999
        de_head=log10(head(i+1))-log10(head(i));
        de_theta_c=theta_c(i+1)-theta_c(i);
        k(i)=-de_theta_c/de_head;
    end
    %偏导数的峰值
    %最大值，位置
    [a b]=max(k)
    c(test,1)=head(b)    %Peak of head
    yyaxis right
    semilogx(head(1:9999),k)
end
    R2=R2'
    %function 
    %参数   C A1  h1 A2 h2
    %X0=[C,A1,A2,h1,h2]
function y=bimodal(X0,h)
y=X0(1)+X0(2)*exp(-h/X0(3))+X0(4)*exp(-h/X0(5));
end 
%采用Green_Ampt方程计算张文杰
%锐利湿润锋的前进,垂直方向
%--------
%非饱和参数
theta0=0.5       ; %dimensionless
thetar=0.08     ;%dimensionless
a=0.16          ;%kPa-1
n=1.21          ; %dimensionless
m=1-1/n     ; %dimensionless
k0=3.7e-7         ;%m/s
h0=0         ;%上部水头
hi=-22.9      ;       %干燥水头 m
thetai=0.2797  ;

%-------------
%计算过程
%单位换算
Q=8:1:200     ;%单位  mm
Q=Q/1000;  %单位m
%关于单位
t=1/k0*(Q-(h0-hi)*(theta0-thetai)*log(1+Q/((h0-hi)*(theta0-thetai))));      %单位为s


%转换单位
t=t/60/60           ;%单位为hour
Q=Q*100              ;%单位为cm
plot(t,Q) %     (hour~cm)
xlabel('t/hour');
ylabel('入渗量/cm')

%----------------
%绘图
figure;
L=Q/(theta0-thetar)    %cm


plot(t,L) %     (hour~cm)
xlabel('t/hour');
ylabel('入渗深度/cm')

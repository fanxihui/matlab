%
clc;
clear;
%prameter

y2=12;%y轴范围 y^y2


% sand1
thetas1=0.417;
thetar1=0.02;
alfa1=0.138;
n1=1.592;
fai1=logspace(0.0001,y2,100);
theta1=(thetas1-thetar1)*(1./(1+(alfa1*fai1).^n1)).^(1-1/n1)+thetar1;
%loam2
thetas2=0.434;
thetar2=0.027;
alfa2=0.09;
n2=1.22;
fai2=logspace(0.0001,y2,100);
theta2=(thetas2-thetar2)*(1./(1+(alfa2*fai2).^n2)).^(1-1/n2)+thetar2;
%silty clay3
thetas3=0.423;
thetar3=0.056;
alfa3=0.027;
n3=1.127;
fai3=logspace(0.0001,y2,100);
theta3=(thetas3-thetar3)*(1./(1+(alfa3*fai3).^n3)).^(1-1/n3)+thetar3;
%clay4
thetas4=0.446;
thetar4=0;
alfa4=0.00152;
n4=1.17;
fai4=logspace(0.0001,y2,100);
theta4=(thetas4-thetar4)*(1./(1+(alfa4*fai4).^n4)).^(1-1/n4)+thetar4;
% %clay2gbx
% thetas4=0.446;
% thetar4=0;
% alfa4=0.00152;
% n4=1.17;
% fai4=logspace(0.0001,y2,100);
% theta4=(thetas4-thetar4)*(1./(1+(alfa4*fai4).^n4)).^(1-1/n4)+thetar4;

%%cs5
thetas5=0.507;
thetar5=0;
alfa5=0.004;
n5=1.057;
fai5=logspace(0.0001,y2,100);
theta5=(thetas5-thetar5)*(1./(1+(alfa5*fai5).^n5)).^(1-1/n5)+thetar5;
% MSW6
thetas6=0.13;
thetar6=0.55;
alfa6=0.036;
n6=1.56;
fai6=logspace(0.0001,y2,100);
theta6=(thetas6-thetar6)*(1./(1+(alfa6*fai6).^n6)).^(1-1/n6)+thetar6;

%print
semilogy(theta1,fai1,'b',theta2,fai2,'r',theta3,fai3,'g',theta4,fai4,'y');
legend('sand','loam','silty clay','clay1');
xlabel('\theta')
ylabel('water head(cm)')

%output
theta1=theta1';
fai1=fai1';
theta2=theta2';
fai2=fai2';
theta3=theta3';
fai3=fai3';
theta4=theta4';
fai4=fai4';
theta5=theta5';
fai5=fai5';
theta6=theta6';
fai6=fai6';
output(:,1)=theta1';
output(:,2)=fai1';
output(:,3)=theta2';
output(:,4)=fai2';
output(:,5)=theta3';
output(:,6)=fai3';
output(:,7)=theta4';
output(:,8)=fai4';
output(:,9)=theta5';
output(:,10)=fai5';
output(:,11)=theta5';
output(:,12)=fai5';
xlswrite('date',output);

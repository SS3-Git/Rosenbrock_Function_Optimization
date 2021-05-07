%Goldendsection method code
function [lower,upper] = goldsection(f,a,b,c) %a=lower limit ,b=upper limit
clc;
T=(-1+sqrt(5))/2;
I1=(b-a)*T;
x1=b-I1;
x2=a+I1;
temp=0;
while temp==0
if f(x1)<f(x2)
error= b-x2;
if error<c
temp=1;
end
b=x2;
x2=x1;
I1=(b-a)*T;
x1=b-I1;
else
error= x1-a;
if error<c
temp=1;
end
a=x1;
x1=x2;
I1=(b-a)*T;
x2=a+I1;
end
end
lower=x1;
upper=x2;
end

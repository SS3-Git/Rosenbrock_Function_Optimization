f = @(x,y) (1-x).^2 + 100*(y-x.^2).^2;
x = linspace(-1.5,1.5); y = linspace(-1,3);
[xx,yy] = meshgrid(x,y); ff = f(xx,yy);
levels = 10:10:300;
LW = 'linewidth'; FS = 'fontsize'; MS = 'markersize';
%figure, contour(x,y,ff,levels,LW,1.2), colorbar
%axis([-1.5 1.5 -1 3]), axis square, hold on
e=10^-9; %tolerance
i=1; %iteration number
c=1;
x = zeros(10000,1);
y= zeros(10000,1);
%Rosenbrock function
f = @(x,y) (1-x).^2 + 100*(y-x.^2).^2;
%Gradient
grad = @(x,y) [-400*(y-x^2)*x - 2*(1-x), 200*(y-x^2) ];
x(1) = 0;
y(1) = 0;
d= zeros(2,1);
while c>e
grad_i=grad(x(i),y(i));
d(1)=-grad_i(1);
d(2)=-grad_i(2);
%f in terms of alpha;
p = @(alpha) (1 - x(i) - alpha*d(1))^2 + 100*(y(i) + alpha*d(2) - (x(i) + alpha*d(1))^2)^2; 
%p is fin alpha terms
[alpha_l,alpha_u]= goldsection(p,0,10,0.000001);
alpha_0 = (alpha_l + alpha_u)/2;
a2 =( 1/(alpha_u -alpha_l))*((p(alpha_u)-p(alpha_l))/(alpha_u - alpha_l)-(p(alpha_0)-p(alpha_l))/(alpha_0 - alpha_l));
a1 = (p(alpha_0)-p(alpha_l))/(alpha_0 - alpha_l) -a2*(alpha_l+alpha_0);
a0 = p(alpha_l) - a1*alpha_l - a2*alpha_l^2;
alpha_opt = -a1/(2*a2); %stepsize
%updating x,y
x(i+1)=x(i)+alpha_opt*d(1);
y(i+1)=y(i)+alpha_opt*d(2);
c= abs(f(x(i+1),y(i+1))-f(x(i),y(i)));
i=i+1;
end
plot(x,y);
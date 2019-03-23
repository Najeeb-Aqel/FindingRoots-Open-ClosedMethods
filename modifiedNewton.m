clc;
f= @(x) x*sin(4*x);
f1=@(x) sin(4*x)+4*x*cos(4*x);
f2=@(x) 8*cos(4*x)-16*x*sin(4*x);


    a = input('enter the value of x0 = ');
   

for i=1:10
    x0=a;
    x2(i)=x0-((f(x0)*f1(x0))/((f1(x0)^2)-(f(x0)*f2(x0))));
    
    fprintf('\n iteration %d, x2=%.4f ',i,x2(i))
    
    error(i)=abs(((x2(i)-a)/a)*100);
    fprintf('\n iteration %d, error=%.4f ',i,error(i))
    a = x2(i);
    if error(i) > 10000
        error('soloution diverges');
    end
end

Answer=p
plot (error)
grid on;
title('Plot of error');
xlabel('iterations');
ylabel('Error');

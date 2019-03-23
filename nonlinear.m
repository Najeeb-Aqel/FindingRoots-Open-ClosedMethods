clc;
u= @(x,y) (x+y/x^2)-6;
v= @(x,y) 8-y^2-x;
ux=@(x,y) (y/x^2)+(1/x^2);
uy=@(x) 1/x^2;
vx= -1;
vy=@(y) -2*y;




a = input('enter the value of x0 = ');
b = input('enter the value of y0 = ');


for i=1:10
    x0=a;
    y0=b;
    x2(i)=x0-((u(x0,y0)*vy(y0)-v(x0,y0)*uy(x0))/(ux(x0,y0)*vy(y0)-uy(x0)*vx));
    y2(i)=y0-((v(x0,y0)*ux(x0,y0)-u(x0,y0)*vx)/(ux(x0,y0)*vy(y0)-uy(x0)*vx));
    
    fprintf('\n iteration %d, x=%.4f ,y=%.4f',i,x2(i),y2(i))
    
    errorX(i)=abs(((x2(i)-a)/a)*100);
    fprintf('\n iteration %d, errorX=%.4f ',i,errorX(i))
    a = x2(i);
    
    
    if errorX(i) > 10000
        error('soloution diverges');
    end
        
    errorY(i)=abs(((y2(i)-b)/b)*100);
    fprintf('\n iteration %d, errorY=%.4f ',i,errorY(i))
    b = y2(i);
    
    if errorY(i) > 10000
        error('soloution diverges');
    end
end

Answer=p
plot (errorX)
grid on;
title('Plot of error');
xlabel('iterations');
ylabel('Error');

plot (errorY)
grid on;
title('Plot of error');
xlabel('iterations');
ylabel('Error');

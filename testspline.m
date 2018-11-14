function [success] = testspline()

    success = 0;
    xK= [-2,-1.6,-1.2,-0.8,-0.4,0,0.4,0.8,1.2,1.6,2];
    yK = [0.0062,0.0150,0.0460,0.1962,0.7962,1.0000,0.7962,0.1962,0.0460,0.0150,0.0062];
    [a,b,c,d] = myspline(xK, yK);
    intervalzahl = length(xK)-1;
    lin = linspace(-2,2);
    f= 1./(1+10*(lin.^4));
    fp = plot(lin,f,'b');
    hold on
    t= linspace(xK(1),xK(2));
    s1=a(1)+(t-xK(1)).*(b(1)+(t-xK(1)).*(c(1)+(t-xK(1)).*d(1)));
    s1p=plot(t,s1,'c');
    for z = 2:intervalzahl
       l = linspace(xK(z),xK(z+1));
       s = a(z)+(l-xK(z)).*(b(z)+(l-xK(z)).*(c(z)+(l-xK(z)).*d(z)));
       plot(l,s,'c');
    end
    xp = -2:0.01:2;
    spl = spline(xK,yK,xp);
    splp= plot(xp,spl,'r','DisplayName','spline');
    legend([fp s1p splp],{'Funktion', 'myspline', 'spline'});
    
    hold off
end

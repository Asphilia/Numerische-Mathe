% mit testspline.m wollen wir die Funktion, myspline und die matlab spline plotten
%Die XKoordinaten:
xK= [-2,-1.6,-1.2,-0.8,-0.4,0,0.4,0.8,1.2,1.6,2];
%Die YKoordinaten:
yK = [0.0062,0.0150,0.0460,0.1962,0.7962,1.0000,0.7962,0.1962,0.0460,0.0150,0.0062];
%Die a,b,c,d Werte für die Spline Funktion mit myspline:
[a,b,c,d] = myspline(xK, yK);
%Zum Plotten benötigen wir:
intervalzahl = length(xK)-1;
lin = linspace(-2,2);
%Die originale Funktion f
f= 1./(1+10*(lin.^4));
%Den Plot von f, den müssen wir noch aufhalten, ist ja noch nicht fertig
fp = plot(lin,f,'b');
hold on
t= linspace(xK(1),xK(2));
%Den Plot des ersten Abschnitts unseres Splines, damit wir ihn in einer
%Legende benennen können
s1=a(1)+(t-xK(1)).*(b(1)+(t-xK(1)).*(c(1)+(t-xK(1)).*d(1)));
s1p=plot(t,s1,'c');
%Die restlichen Splineplotts, natürlich for-Schleife
for z = 2:intervalzahl
   l = linspace(xK(z),xK(z+1));
   s = a(z)+(l-xK(z)).*(b(z)+(l-xK(z)).*(c(z)+(l-xK(z)).*d(z)));
   plot(l,s,'c');
end
%Der Splineplot von Matlab
xp = -2:0.01:2;
spl = spline(xK,yK,xp);
splp= plot(xp,spl,'r');
%Die Legende, man muss die Figur ja auch verstehen ;)
legend([fp s1p splp],{'Funktion', 'myspline', 'spline'});
%Jetzt darf die Figur auch gezeigt werden, ist ja jetzt fertig :D
hold off
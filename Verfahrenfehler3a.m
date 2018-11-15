%Verhahrensfehler von Aufgabe 3a
% Plotten von Fehler von 3a)
h = logspace(-12,0);
x =1;
ev1 = -h.^2.*cos(x-h);
ev1;
loglog(h,ev1); grid on; legend({"Fehler von 3a"});
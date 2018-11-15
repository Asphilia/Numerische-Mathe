% Verfahrensfehler von Aufgabe 3c
% Plotten von 
h = logspace(-12,0);

x= 1;
ev = h.^4.*cos(x+h);

loglog(h,ev); grid on; legend({"Fehler von 3c"});




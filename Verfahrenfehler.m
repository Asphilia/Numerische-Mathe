% Leistungsnachweis 1
% 3c
h = linspace(0,1);

x= 1;
f = ((-sin(x+2.*h)+8.*sin(x+h)-8.*sin(x-h)+sin(x-2.*h))/12.*h)-cos(x);
f;
loglog(f); 



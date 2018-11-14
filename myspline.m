function [aVector, bVector, cVector, dVector] = myspline(xVector,yVector)
%MYSPLINE 
%eingabewerte: x Werte in Vektor, y Werte in Vektor
%rückgabewerte: a, b, c, d Werte in entsprechendem Vektor

%nach Eingabefehlern suchen:
if (length(xVector)~=length(yVector))
    fprintf('Anzahl der x und y Koordinaten müssen übersinstimmen!');
    return;
end
if(length(xVector) < 2)
    fprintf('Mit weniger als 2 Werten kann ich nicht arbeiten.');
    return;
end

%VECTOR INDEXE BEGINNEN BEI 1 UND NICHT BEI 0!!!!

%for all xVector params minus the last:
%s(x)= a+b(x-xVectorP)+c(x-xVectorP)²+d(x-xVectorP)³ 
%in [xVectorP,xVectorP+1]
%& 1.Ableitungen: b[0]+2c[0](x-xVectorP)+3d[0](x-xVectorP)²=b[1] usw
%& 2.Ableitungen: 2c[0]+6d[0](x-xVectorP)=2c[1] usw

%mit den cWerten können alle bs und ds ausgerechnet werden:
% ich habe nur keine Ahnung, wie...
%h1 = xVector(1)-xVector(0); <- so funktioierts
anzahlXKoordinaten = length(xVector);
anzahlH = anzahlXKoordinaten-1;
anzahlR = anzahlXKoordinaten-2;
h = zeros(anzahlH,1);
for z = 1:anzahlH 
    h(z) = xVector(z+1)-xVector(z); 
end

matrix = zeros(anzahlR,anzahlXKoordinaten);
for y = 1:anzahlR
   matrix(y,y) = h(y);
   matrix(y,y+1) = 2*(h(y)+h(y+1));
   matrix(y,y+2) = h(y+1);
end
r = zeros(anzahlR,1);
for x = 1:anzahlR
   r(x) = 3*( (yVector(x+2)-yVector(x+1))/h(x+1) - (yVector(x+1)-yVector(x))/h(x) );
   
end
cVector = matrix\r;
%natürliche randbedingungen ergeben, dass erstes und letztes c 0 sein müssen

%jetzt cs benutzen um ds und bs zu bekommen :)
bVector = zeros(anzahlH,1);
for w = 1:anzahlH
   bVector(w) = (yVector(w+1)-yVector(w))/h(w)-(h(w)/3)*(cVector(w+1)+2*cVector(w)); 
end

dVector = zeros(anzahlH,1);
for v = 1:anzahlH
   dVector(v) = (cVector(v+1)-cVector(v))/(3*h(v)); 
end

%as sind yWerte
aVector = yVector(1:anzahlH);

aVector
bVector
cVector
dVector

end

function [parameterDerSplineFunktion] = myspline(xVector,yVector)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%for all xVector params minus the last:
%s(x)= a+b(x-xVectorP)+c(x-xVectorP)^2+d(x-xVectorP)^3 
%in [xVectorP,xVectorP+1]
%& 1.Ableitungen: s'(x)=b+2c(x-xVectorP)+3d(x-xVectorP)^2
%& 2.Ableitungen: s''(x)=2c+6d(x-xVectorP)

end


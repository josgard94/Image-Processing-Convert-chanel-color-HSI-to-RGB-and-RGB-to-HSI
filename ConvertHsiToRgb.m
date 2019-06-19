%   Autor: Edgard Diaz
%   contact: e.diaz@nartsoft.com.mx
%   date: 10 - 06 - 2019
%   Esta función realiza la conversión de los canales HSI a RGB.
%
function [r,g,b] = ConvertHsiToRgb(hsi)
H=hsi(:,:,1);
S=hsi(:,:,2);
I=hsi(:,:,3);
H=H*(2*pi);

r=zeros(size(H));
g=zeros(size(H));
b=zeros(size(H));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i1 = (H > 0 & H < 2*(pi/3));

%caso 1
b(i1) = I(i1).*(1 - S(i1));
r(i1) = I(i1).*(1 + (S(i1).*cos(H(i1))./(cos((pi/3) - H(i1) ))));
g(i1) = 3*I(i1) - (b(i1) + r(i1));

i2 = (H >= (2*pi/3) & H <(4*pi/3));

%caso 2
H(i2) = H(i2) - (2*pi/3);
r(i2) = I(i2).*(1 - S(i2));
g(i2) = I(i2).*(1 + (S(i2).*cos(H(i2))./(cos((pi/3)- H(i2) ))));
b(i2) = 3*I(i2) - (r(i2) + g(i2));

i3 = (H >= (4*pi/3) & H <(2*pi));

%caso 2
H(i3) = H(i3) - (4*pi/3);
g(i3) = I(i3).*(1 - S(i3));
b(i3) = I(i3).*(1 + (S(i3).*cos(H(i3))./(cos((pi/3) - H(i3) ))));
r(i3) = 3*I(i3) - (g(i3) + b(i3));

end

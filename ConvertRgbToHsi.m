function [H,S,I] = ConvertRgbToHsi(rgb)
    %Extraer  los canales RGB de la imagen.
    R = rgb(:,:,1);
    G = rgb(:,:,2);
    B = rgb(:,:,3);
    
    %Normalizacion de canales.
     r = R;%(R./(R+G+B+eps));
     g = G;%(G./(R+G+B+eps));
     b = B;%(B./(R+G+B+eps));
    
    %Obtencion de los canales HSI
    
    numerador = 0.5*((r-g) + (r-b));
    denominador = sqrt((((r-g).^2) + ((r - b).*(g - b))));
    theta = acos(numerador./(denominador+eps));
    H = theta;
    H(b > g) = (2*pi - H(b>g));
    H = H/(2*pi);
    

    S = 1 - (3*(min(min(r,g),b))./(r+g+b+eps));
    %S=1-3.*(min(min(r,g),b))./(r+g+b+eps);
    %I = ((3 * 255)).*(R+G+B);
    I = (R+G+B)/(3);
    
end
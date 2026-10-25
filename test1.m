function test1()
% Autor:   Jakub Jaworski 
% Index:   331698
% Projekt: 1
% Zadanie: 49
%  
% wstępny test poprawności całkowania dla kilku przykładowych funkcj

fprintf('TEST1:\n');
fprintf(['Wstępna ocena poprawności całkowania przeprowadzona na ' ...
    'kilku przykładowych funkcjach.\nPo zapełnieniu konsoli nacisnąć ' ...
    'dowolny przycisk\n\n']);
linecount = 4;

% testowane funkcje
F = {@(x,y) cos(x).*cos(y);             
     @(x,y) sin(x).*sin(y).^2;           
     @(x,y) x.^2.*sin(x)^2.*cos(y)^2;  
     @(x,y) x.^2.*y.^6.*cos(x);        
     @(x,y) x.^18.*y.^2;                 
     @(x,y) x.*exp(x);                   
     @(x,y) 1;                             
     @(x,y) sin(x).*cos(x)};

% dokładne wartości całki
I = [1.905467610972054e+00;  
     0;                      
     7.347769358327259e-01;  
     1.146879203991276e+00;  
     1.057198647038166e+05;  
     2.016914902580528e+00;  
     3.141592653589793e+00;  
     0];

% nazwy funkcji (potrzebne do wypisywania)
F_names = {'cos(x)*cos(y)',
           'sin(x)*sin(y)^2',
           'x^2*sin(x)^2*cos(y)^2',
           'x^2*y^6*cos(x)',
           'x^18*y^2',
           'x*exp(x)',
           '1',
           'sin(x)*cos(x)' };

for i = 1:8    
% sprawdzenie czy konsola się zapełniła
if linecount >= 20 
    pause
    linecount = 0;    
end

% testowanie kolejno funkcji
S = P1Z49_JJA_Gauss_Hermit(F{i});
err = abs(S-I(i));
fprintf('TEST DLA FUNKCJI: f(x,y) = %s\n',F_names{i});
fprintf('I(f) = %7.5e | S(f) = %7.5e | err = %7.5e |\n\n', I(i), S, err);
linecount = linecount+3;
end

end % function
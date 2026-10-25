function numtest1()
% Autor:   Jakub Jaworski 
% Index:   331698
% Projekt: 1
% Zadanie: 49
%  
% Test rzędu dziesięciopunktowej kwadratury Gaussa-Hermita

% Opis testu
fprintf(['NUMTEST1:\nTest sprawdza dokładność dziesięciopunktowej' ...
         ' kwadratury Gaussa-Hermita przy całkowaniu wielomianów.\n' ...
         'Oczekujemy że kwadratura będzie bardzo dokładna' ...
         ' dla wielomianów stopnia mniejszego niż 20.\n' ...
         'Po zapełnieniu konsoli nacisnąć dowolny przycisk\n\n']);
linecounter = 5;

% Przechodzimy przez kolejne potęgi wielomianu
for i = 1:30
    f = @(x,y) x.^i;
    S = P1Z49_JJA_Gauss_Hermit(f);
    if mod(i,2) == 1
    I = 0; % funkcja nieparzysta
    else
    k = i/2;
    % prod(2*k-1:-2:1) jako (2k-1)!! całki z wielomnianu o parzystej 
    % potędze podążają za tym wzorem
    I = (prod(2*k-1:-2:1)/2^k)*pi;
    end

    % wypisywanie wyników testu
    err = abs(I-S);
    err_eps = floor(err/eps);
    fprintf('Test dla wielomianu p(x) = x^%d\n\n',i);
    fprintf(['I(f) = %20.15e | S(f) = %20.15e | err = %20.15e | err/eps'...
             ' ~= %.1e |\n\n'], I, S, err, err_eps);
    linecounter = linecounter+4;

    % zarządzanie zapełnianiem konsoli
    if(linecounter >= 21)
        pause;
        linecounter = 0;
    end
end

end % function
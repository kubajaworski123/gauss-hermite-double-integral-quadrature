function q = P1Z49_JJA_Gauss_Hermit(f)
% Autor:   Jakub Jaworski 
% Index:   331698
% Projekt: 1
% Zadanie: 49
%  
% Obliczanie wartości całki podwójnej na obszarze (-inf,inf)x(-inf,inf)
% z funkcji e^(-x^2)*e^(-y^2)*f(x,y)
% za pomocą dziesięciopunktowej kwadratury Gaussa-Hermite'a
% 
% Wejście:
% f - f = f(x,y) - uchwyt funkcji dwóch zmniennych
%  
% Wyjście: 
% q - Przybliżona wartość całki
% Jeżeli podano funkcję o nierzeczywistych wartościach przeciwdziedziny 
% to q = NaN

% Pobranie wartości wspólczynników i węzłów kwadratury
N = get_hermite_nodes();
W = get_hermite_weights();

% C(i,j) = W(i)*W(j)
C = W*W';

% Tworzenie siatki punktów odpowiadających węzłom
[X,Y] = meshgrid(N,N);
f_val = f(X,Y);

% Sprawdzenie dziedziny funkcji
if(~isreal(f_val))
q = NaN;
return;
end

% Obliczenie przybliżonej wartości całki 
q = sum(sum(C.*f_val));
function test2()
% Autor:   Jakub Jaworski 
% Index:   331698
% Projekt: 1
% Zadanie: 49
%  
% Test sprawdza działanie funkcji P1Z49_JJA_Gauss_Hermit 
% w przypadku podania funkcji o złej dziedzinie;

% definicja testowanych funkcji
F = {@(x,y) log(x);
     @(x,y) asin(x.*y);
     @(x,y) x.*y.*1i;
     @(x,y) sin(1i.*x)};

% nazwy funkcji (potrzebne do wypisywania wyników)
F_names = {'log(x)', 'asin(x*y)', 'x*y*i', 'sin(i*x)'};

% opis testu
fprintf('TEST 2:\n');
fprintf('Test przypadków skrajnych.\n');
fprintf(['Funkcje 1-2 sprawdzają zachowanie programu gdy funkcja ' ...
         'ma dziedzinę uniemożliwiającą scałkowanie na [-inf,inf]\n' ...
         'Funkcje 2-3 sprawdzają zachowanie w przypadku ' ...
         'próby całkowania funkcji zespolonej.\n']);
fprintf(['Zgodnie ze specyfikacją, ' ...
         'w obu przypadkach oczekiwany wynik to NaN\n\n'])

% obliczanie wartości całek
for i = 1:4
    S = P1Z49_JJA_Gauss_Hermit(F{i});
    fprintf('%d: Test dla funkcji: %s\n', i, F_names{i});
    fprintf('Oczekiwano: NaN | Funkcja zwróciła: %e\n\n', S);
end

end % function
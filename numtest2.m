function numtest2()
% Autor:   Jakub Jaworski 
% Index:   331698
% Projekt: 1
% Zadanie: 49
%  
% Test błędu kwadratury

    E_vec = zeros(1,100);
    % Testujemy dla dużych wartości aby błąd był większy
    parameters = 10000:100:11000;

    fprintf(['NUMTEST2:\nTest sprawdzający zależność wynikającą z' ...
             ' twierdzenia 2.4 z wykładu\n' ...
             ' (zależność błędu kwadratury na n węzłach od 2n-tej' ...
             ' pochodnej funkcji całkowanej.\n' ...
             ' Całkujemy funkcję f(x) = exp(a^(1/20)*x).' ...
             ' Jej 20-ta pochodna to a*f(x).\n Zależność zatem' ...
             ' powinna być prawie liniowa.\n' ...
             'Liniowość jest testowana przez wypis różnicy' ...
             ' kolejnych wyliczeń.\n' ...
             'Po zapełnieniu konsoli wcisnąć dowolny przycisk.\n\n'])
    linecounter = 7;
    
    % Obliczamy wartość błędu w zależności od zmiennego parametru
    for i = 1:10
    p = parameters(i);
    f = @(x,y) exp(x.*p^(1/20));

    S = P1Z49_JJA_Gauss_Hermit(f);
    I = pi*exp((p^(1/20)^2)/4);
    E = abs(I-S);
    E_vec(i) = E;
    fprintf(' a = %d |I(f)-S(f)| = %20.15e\n', p, E);
    if(i > 1) % jeżeli policzono już dwie wartości, patrzymy na ich różnicę
        fprintf([' różnica dwóch ostatnich wyliczeń:' ...
                 ' %20.15e\n\n'], E_vec(i)-E_vec(i-1));
        linecounter = linecounter + 3;
    else
        fprintf('\n');
        linecounter = linecounter+2;
    end
    % Zarządzanie zapełnieniem konsoli
    if linecounter >= 21 
        pause;
        linecounter = 0;
    end
    end
end % function
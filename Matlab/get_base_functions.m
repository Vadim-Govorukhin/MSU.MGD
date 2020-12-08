function [basefunc, y, c] = get_base_functions(base, M)
%% Файл-функция выбирает базисные функции

% Выделяем память
basefunc = cell(1,M); % Ячейки базисных функций
c = cell(1,M); % Ячейки символьных переменных c1 c2 c3

% Зададим сами базисные функции
switch base
    case 0
        % sin(nx)
        for n=0:M
            basefunc{n+1} = subs(str2sym('(sin(n*x))'));
        end
    case 1
        % x^n*(x-pi)^n
        for n=0:M
            basefunc{n+1} = subs(str2sym('(x^n*(x-pi)^n)'));
        end
    case 2
        % x^n
        for n=0:M
            basefunc{n+1} = subs(str2sym('(x^n)'));
        end
end
%% Зададим символьное выражение для пробной функции
y = 0;
for n = 1:M
    c{n} = sym(strcat('c',num2str(n)));
    y = y + c{n}*basefunc{n};
end

end
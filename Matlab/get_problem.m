function [func] = get_problem(task, base, M, x)
    switch task
        case 0
            % Тестовая задача
            
            % Получаем базисные функции
            [func.basefunc, func.y, c] = get_base_functions(base, M);
            % Функционал, который минимизируем
            func.V = diff(func.y, x, 2) + 2*sin(x);
        case 1
            % Основная задача
            %{ 
            Аналитическое решение
            https://www.wolframalpha.com/input/?i=y%27%27+%3D+x*%281-x%5E2%29%2F%282*x%2B3%29%2C+y%27%280%29%3D0%2C+y%28pi%29%3D0
            %}
            
            % Получаем базисные функции
            [func.basefunc, func.y, c] = get_base_functions(base, M);
            % Функционал, который минимизируем
            func.V = diff(func.y, x, 2) - x*(1-x^2)/(2*x+3);

    end
    func. V = matlabFunction(func.V, 'Vars',[c, x]);
    func. y = matlabFunction(func.y, 'Vars',[c, x]);
end
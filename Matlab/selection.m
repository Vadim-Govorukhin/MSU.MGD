function y = selection(y, V, a, b, N, M)
    %{
    Отбор функций производится по рейтингу 
    на основании значения функции приспособления
    %}
    s = 1/4; % Доля выживших особей
    
    % Отсортируем по функции приспособления
    y = sortrows(y, 2, 'descend');

    % Число "выживших особей"
    threshold = floor(s*N);

    % Восстанавливаем популяцию
    y(threshold+1:end,1:2) = get_init_population(V, a, b, N-threshold, M);
end
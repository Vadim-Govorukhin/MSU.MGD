function [basefunc, y, c] = get_base_functions(base, M)
%% ����-������� �������� �������� �������

% �������� ������
basefunc = cell(1,M); % ������ �������� �������
c = cell(1,M); % ������ ���������� ���������� c1 c2 c3

% ������� ���� �������� �������
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
%% ������� ���������� ��������� ��� ������� �������
y = 0;
for n = 1:M
    c{n} = sym(strcat('c',num2str(n)));
    y = y + c{n}*basefunc{n};
end

end
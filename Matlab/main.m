%------------------------------------------------
% ����-�������, ����������� ������� ��� 
% � ������� ������������� ���������:
%
% d^2y/dt^2 = x*(1+x^2)/(2*x+3), 0 < x <= pi;
% y'(0) = 0, y(pi) = 0
%-----------------------------------------------------------------
warning('off','all')
syms x
%% ������� ������ � ��������� ������������:
task = 1; % 0 - �������� ������, 1 - �������� ������
% ������� ���������� x 
a = 0; b = pi; 

N = 50; % ����� "������" � ���������

% ������� �������� ��������: 0 - sin(nx); 1 - x^n*(x-pi)^n; 2 - x^n
base = 2; 
M = 10; % ����� �������� �������

%% �������� ��������� ���������� � ����� ��� ������ �������
[func] = get_problem(task, base, M, x);

%% Main
% � ����������� �� ���������� � ���� ���������� ��������� ��������� ���
% (������ ��� ��������� score ����� ����������)

% "��������" == ��� ������� ����������������� ��������� � 1, ��� ������� ��
% ����� � 0.8-0.95, ����������� � ��������� �������� ���
% task = 0; base = 0; - �������� � �������� 10 ��������
% task = 0; base = 1; - �������� � �������� 100 ��������
% task = 1; base = 0 � base = 1; - �������� ����� �����
% task = 1; base = 2; - �������� �������� 200 ��������
% �� � ������ ������ ���������� ������� �������� ������������ �0 � �1,
% ����� ������� � ���������� ���������

y = get_init_population(func.V, a, b, N, M);

for k=1:200
    % �����
    y = selection(y, func.V, a, b, N, M);
    
    % ������� �������� ������� ����������������� ��� ������ �����
    fprintf('%11.10f\n',y{1,2}); 
    
    % �����������
    y = crossing(y, func.V, a, b, N, M);
    
    % �������
    y = mutating(y, func.V, a, b, N, M);
end

%% ����� ����������� �� �����
y = selection(y, func.V, a, b, N, M);

fprintf('the best score: %7.6f \nof coeff %s\n',y{1,2}, sprintf('%d ', y{1,1}))
best = num2cell(y{1,1});
digits(5);
disp('��������� ������� �������:')
disp(vpa(expand(func.y(best{1:end},x))))


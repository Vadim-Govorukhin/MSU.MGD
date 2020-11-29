function y = mutating(y, V, a, b, N, M)
    % ����������� s ���� ������

    s = 1/2;
    % ����� "������������ ������"
    threshold = floor(s*N);

    % �������������� ��������� ����� �������� ������� ��� ������ �������
    M_n = randi([2 M],1,N);
    
    % ������������ ��� �������� ������� ��� ������ �������
    u_1 = -0.2; u_2 = 0.2;
    Cm = u_1 + (u_2 - u_1)*rand(threshold,M);

    % ��� ����������� ���������� ���������
    idx = randperm(length(y));
    F = y(:,2);
    y(:,1) = y(idx);
    y(:,2) = F(idx);
    for n=1:threshold
        Cm(n,M_n(n):end) = 0;
        % ������� �����
        y{n,1} = y{n,1} + Cm(n,:);
        % �������� �� ������� �����������������
        y{n,2} = fitness(V, y{n,1}, a, b);
    end
    
end
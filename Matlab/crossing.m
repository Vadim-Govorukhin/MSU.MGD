function y = crossing(y, V, a, b, N, M)
    % ����������� ������ � ���������
    
    d=1/4; % �������� ������������� ������������
    
    % ����������� �� ������� ��������������
    y = sortrows(y, 2, 'descend');

    % ����������� ����� ����� ���������
    prob = cell2mat(y(:,2));
    prob = prob/norm(prob,1);

    % �������� ������ ��������� ��� �����������
    y_old = y(:,1);

    % ������ � �������� ��������� ��������
    s = [];
    
    % ������� ��������� �� ��������������
    %bad_sets = {frozenset([n]) for n in range(self.N)}
    

    % ���� �� ������� ������ ����� ��� ���������
    n = 1;
    while n <= N
        for k=1:2*N
            random_pair = randsample(N,2,true,prob);
            if random_pair(1) ~= random_pair(2)
                s(n,:) = sort(random_pair(:));
                n = n + 1;
            end
        end
        if n >= N
            s = unique(s,'rows');
            [n,~] = size(s);
        end

    end
    
    % ����������� ������������� ������������
    alpha = (1 + d + d) *rand(N,1) - d;

    for n=1:N
        m = s(n,1); k = s(n,2);
        % ������������� ������������
        y{n,1} = y_old{m} - alpha(n)*(y_old{k} - y_old{m});
        % �������� �� ������� �����������������
        y{n,2} = fitness(V, y{n,1}, a, b);
    end

end
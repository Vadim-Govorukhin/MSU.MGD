function y = selection(y, V, a, b, N, M)
    %{
    ����� ������� ������������ �� �������� 
    �� ��������� �������� ������� ��������������
    %}
    s = 1/4; % ���� �������� ������
    
    % ����������� �� ������� ��������������
    y = sortrows(y, 2, 'descend');

    % ����� "�������� ������"
    threshold = floor(s*N);

    % ��������������� ���������
    y(threshold+1:end,1:2) = get_init_population(V, a, b, N-threshold, M);
end
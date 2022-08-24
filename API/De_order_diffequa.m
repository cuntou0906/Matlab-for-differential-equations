function [ output ] = De_order_diffequa( f , order)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �仯�߽�΢�ַ�����Ϊ1��΢�ַ�����
% ������ʽ��
% �����߽�΢�ַ��̣�
%f(Dnx,Dn-1x,..,D1x,x)=0 ��Ϊ�ַ������߷��ű��ʽ
% orderΪ������x����߽���

% �߽�΢�ַ����飺
%fΪ���ž���  ����������߽ײ�һ����ͬ
% f1(Dnx1,Dn-1x1,..,D1x1,x1,Dn-1x2,..,D1x2,x2,..Dn-1xm,..,D1xm,xm)=0 
% f2(Dnx2,Dn-1x1,..,D1x1,x1,Dn-1x2,..,D1x2,x2,..Dn-1xm,..,D1xm,xm)=0 
% ...
% Ҫ��fi��ֻ����xi����߽׵���  �����������������߽ף����ʵ��ϵͳ���еĻ�
% ���԰����б�����߽׿��� �µı��� ��ⷽ���飬�ٵ��øú�����
% orderΪʸ������i��ֵΪ��i����������߽���

% �����������ΪX = [x1 D1x1 D2x1 ...Dn-1x1 x2 D1x2 ....Dm-1x2 .....]

%���outputҲ��һ�����ž���

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len = length(order);                        % �������� ���̸���
f = sym(f);
if (len==1)                                 % �����߽�΢�ַ���
    output = sym('[]');
    f = subs(f,'x','x(1)');                 % x�滻
    for i = 1:order-1                       % 1-order-1���滻
        str1 = ['D' num2str(i) 'x'];
        str2 = ['x(',num2str(i+1) ')'];
        f = subs(f,str1,str2);
    end
    str1 = ['D' num2str(order) 'x'];        % ��߽��滻
    %str2 = ['D1x(',num2str(order) ')'];
    str2 = 'y';
    f = subs(f,str1,str2);                 
    for i = 1:order-1
        str = ['x(',num2str(i+1) ')'];      % ǰorder-1��΢�ַ���
        output=[output;str];
    end
    last_str = solve(f,str2);
    output=[output;last_str];               % ��n��΢�ַ���
else                                        % �߽�΢�ַ�����
  for i = 1:len                             % ѭ��ÿ������
    str1 = ['x' num2str(i)];                % �滻��i������
    str2 = ['x(' num2str(sum(order(1:i))+1-order(i)) ')'];
    f = subs(f,str1,str2);
    for j = 1:order(i)-1                    % �滻��i��������1-order(i)-1��
        str3 = ['D' num2str(j) 'x' num2str(i)];
        str4 = ['x(',num2str(sum(order(1:i))+1-order(i)+j) ')'];
        f = subs(f,str3,str4);
    end
    str5 = ['D' num2str(order(i)) 'x' num2str(i)]; % �滻��i��������order(i)��
    str6 = ['t',num2str(i)];
    f = subs(f,str5,str6);
  end
  output = sym('[]');
  for i =1:len
     for j = 1:order(i)-1
       str7 =  ['x(',num2str(sum(order(1:i))-order(i)+j+1) ')'];% ��i��΢�ַ��̶�Ӧ ��j��1��΢�ַ���
       output = [output;str7];
     end
     last_str = solve(f(i),['t',num2str(i)]);
     output=[output;last_str];
  end
end
end


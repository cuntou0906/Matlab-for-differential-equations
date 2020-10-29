function [ output ] = De_order_diffequa( f , order)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 变化高阶微分方程组为1阶微分方程组
% 输入形式：
% 单个高阶微分方程：
%f(Dnx,Dn-1x,..,D1x,x)=0 且为字符串或者符号表达式
% order为标量，x的最高阶数

% 高阶微分方程组：
%f为符号矩阵  各变量的最高阶不一定相同
% f1(Dnx1,Dn-1x1,..,D1x1,x1,Dn-1x2,..,D1x2,x2,..Dn-1xm,..,D1xm,xm)=0 
% f2(Dnx2,Dn-1x1,..,D1x1,x1,Dn-1x2,..,D1x2,x2,..Dn-1xm,..,D1xm,xm)=0 
% ...
% 要求fi中只含有xi的最高阶导数  不含有其余变量的最高阶（如果实际系统含有的话
% 可以把所有变量最高阶看作 新的变量 求解方程组，再调用该函数）
% order为矢量，第i个值为第i个变量的最高阶数

% 广义变量定义为X = [x1 D1x1 D2x1 ...Dn-1x1 x2 D1x2 ....Dm-1x2 .....]

%输出output也是一个符号矩阵

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len = length(order);                        % 变量个数 方程个数
f = sym(f);
if (len==1)                                 % 单个高阶微分方程
    output = sym('[]');
    f = subs(f,'x','x(1)');                 % x替换
    for i = 1:order-1                       % 1-order-1阶替换
        str1 = ['D' num2str(i) 'x'];
        str2 = ['x(',num2str(i+1) ')'];
        f = subs(f,str1,str2);
    end
    str1 = ['D' num2str(order) 'x'];        % 最高阶替换
    %str2 = ['D1x(',num2str(order) ')'];
    str2 = 'y';
    f = subs(f,str1,str2);                 
    for i = 1:order-1
        str = ['x(',num2str(i+1) ')'];      % 前order-1个微分方程
        output=[output;str];
    end
    last_str = solve(f,str2);
    output=[output;last_str];               % 第n个微分方程
else                                        % 高阶微分方程组
  for i = 1:len                             % 循环每个变量
    str1 = ['x' num2str(i)];                % 替换第i个变量
    str2 = ['x(' num2str(sum(order(1:i))+1-order(i)) ')'];
    f = subs(f,str1,str2);
    for j = 1:order(i)-1                    % 替换第i个变量的1-order(i)-1阶
        str3 = ['D' num2str(j) 'x' num2str(i)];
        str4 = ['x(',num2str(sum(order(1:i))+1-order(i)+j) ')'];
        f = subs(f,str3,str4);
    end
    str5 = ['D' num2str(order(i)) 'x' num2str(i)]; % 替换第i个变量的order(i)阶
    str6 = ['t',num2str(i)];
    f = subs(f,str5,str6);
  end
  output = sym('[]');
  for i =1:len
     for j = 1:order(i)-1
       str7 =  ['x(',num2str(sum(order(1:i))-order(i)+j+1) ')'];% 第i个微分方程对应 第j个1阶微分方程
       output = [output;str7];
     end
     last_str = solve(f(i),['t',num2str(i)]);
     output=[output;last_str];
  end
end
end


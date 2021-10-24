%画根轨迹
%UTF-8
num = [1];                             %开环分子多项式系数
den = conv([1,0],conv([1,1],[1,2])); %开环分母多项式系数
sys = tf(num,den);                         
rlocus(sys);                             %画根轨迹
axis([-3 1 -3 3]);                       %坐标范围

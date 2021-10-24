%绘制系统的开环对数幅频渐进特性曲线
 
%%%   使用方法    %%%
 
%>> G1 = tf(2,[conv([2,1],[8,1])]);
 
%>> w = 10e-3:0.1:100;
 
%>> [x1,y1] = bd_asymp(G1,w);
 
%>> semilogx(x1,y1);
 
 
% 该func的基本步骤是
 
% step1：将传递函数转换为零极点形式
 
% step2：依次判断系统的零点和极点，并且将交接频率处的斜率变化一一对应
 
% step3：对交接频率以及交接频率对应的斜率进行排序
 
% step4：求出交接频率对应的幅度，并返回
 
function[wpos,ypos]=bd_asymp(G,w)
 
G1=zpk(G);%将系统转换为Zero Pole Gain形式
 
wpos=[];
 
pos1=[];
 
%如果该func只有传递函数一个输入量，则调用freqint2函数自动调节频率范围
 
%freqint2：Nyquist and Nichols绘图的自动调节范围的函数
 
%nargin：确定函数的输入
 
if nargin==1,w=freqint2(G);
 
end
 
zer=G1.z{1}; pol=G1.p{1};gain=G1.k;
 
for i=1:length(zer)  %依次判断系统的零点
 
    if isreal(zer(i)) %确定一阶微分环节的交接频率，
 
        wpos=[wpos,abs(zer(i))];
 
        pos1=[pos1,20];%每有一个一阶微分环节，渐近线斜率+20
 
    else
 
        if imag(zer(i))>0 %确定二阶微分环节的交接频率
 
            wpos=[wpos,abs(zer(i))];
 
            pos1=[pos1,40];%每有一个二阶微分环节，渐进线斜率+40
 
        end
 
    end
 
end
 
for i=1:length(pol) %依次判断系统的极点
 
    if isreal(pol(i))%确定惯性环节和积分环节的交接频率
 
    wpos=[wpos,abs(pol(i))];
 
    pos1=[pos1,-20];%每有一个惯性环节或者积分环节，渐近线斜率-20
 
    else
 
        if imag(pol(i))>0
 
            wpos=[wpos,abs(pol(i))]; %每有一个振荡环节，渐近线斜率-40
 
            pos1=[pos1,-40];
 
        end
 
    end
 
end
 
wpos=[wpos w(1) w(length(w))];%如果输入是两个变量的话，后面加入的两个频率就是function之前定义的频率范围
 
pos1=[pos1,0,0];%为了和wpos大小进行匹配，另外在频率范围两端不改变斜率
 
[wpos,ii]=sort(wpos);%对交接频率进行排序，ii是交接频率的序号
 
pos1=pos1(ii);%按照交接频率的顺序，对应的进行斜率的排序
 
ii=find(abs(wpos)<eps); %查找小于0(eps是最小的正浮点数)的交接频率的索引，用来判断系统的阶数
 
kslp=0;%定义斜率
 
w_start=1000*eps;%定义开始频率,不宜过大，防止关键的值缺失，不宜过小，防止查找其实频率步骤过多
 
if ~isempty(ii)   %判断是不是0阶系统
 
    kslp=sum(pos1(ii));%确定初始斜率
 
    ii=(ii(length(ii))+1):length(wpos);%因为在此之前已经对交接频率进行了排序，所以是选取了真正的交接频率
 
    wpos=wpos(ii);%这里是最终求到的实际的交接频率
 
    pos1=pos1(ii);%这里是最终求到的实际交接频率对应的斜率变化
 
end
 
while 1
 
    [ypos1,~]=bode(G,w_start);%获取从预设的第一个频率开始的伯德图的幅度和相角
 
    if isinf(ypos1)
 
        w_start=w_start*10;%如果对应的幅度值过大，则将开始频率*10，即向右移动一个刻度，重新选一个起点计算渐近线的起点
 
    else
 
        break;
 
    end
 
end
 
wpos=[w_start wpos];%至此确定了起始频率的大小，在交接频率之前加一个起始频率
 
ypos(1)=20*log10(ypos1);%至此确定了起始频率对应的幅度
 
pos1=[kslp pos1]; %至此确定了起始斜率
 
for i=2:length(wpos)
 
    kslp=sum(pos1(1:i-1));%计算所有的斜率变化之和
 
    ypos(i)=ypos(i-1)+kslp*log10(wpos(i)/wpos(i-1));%根据斜率和两个交接频率求出下一个交接频率对应的幅度
 
end
 
ii=find(wpos>=w(1)&wpos<=w(length(w)));%选取在规定频率范围内的交接频率
 
wpos=wpos(ii);
 
ypos=ypos(ii); %func最后返回交接频率以及对应的幅度
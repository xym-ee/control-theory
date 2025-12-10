---
sort: 3
---
# Transformation

前面数学描述的解释说明

坐标系

## 平移算子

向量 $$ ^A P_1 $$ 沿着 $$ ^A Q $$ 平移得到新的向量 $$ ^A P_2 $$

表达式描述

$$ 
^A P_2 = \ ^A P_1 + \ ^A Q
$$

我们用映射的角度来看这种关系，都用乘法的方式来写。即平移看作映射，隐射用矩阵来描述，那么有

$$
^A P_2 = Trans(Q) \ ^A P_1
$$

平移变换是可以交换的，即

$$
Trans(P) + Trans(Q) = Trans(Q) + Trans(P)
$$

$$
Trans(Q) = 
\left [
    \begin{array}{}
        1 & 0 & 0 & q_x \\
        0 & 1 & 0 & q_y \\
        0 & 0 & 1 & q_z \\
        0 & 0 & 0 & 1 \\        
    \end{array}
\right ]
$$

其中 

$$
Q = 
\left [
    \begin{array}{}
         q_x \\
         q_y \\
         q_z \\ 
    \end{array}
\right ]
$$


## 旋转算子

旋转

$$
^A P_2  =  R \ ^A P_1 
$$

旋转算子要看是对那个轴转的

$$
^A P_2  =  R_z(\theta) \ ^A P_1 
$$

旋转是不可交换的。旋转有两个参数要处理，轴和要旋转的角度。

旋转有 3 个自由度，为了描述简单，选轴也有讲究，这里比较直观的，选 xyz 轴。


$$
R_x(\theta) = 
\left [
    \begin{array}{}
        1 & 0 & 0 & 0 \\
        0 & \cos \theta & -\sin \theta & 0 \\
        0 & \sin \theta & \cos \theta & 0 \\
        0 & 0 & 0 & 1 \\        
    \end{array}
\right ]
$$

$$
R_y(\theta) = 
\left [
    \begin{array}{}
        \cos \theta & 0 & \sin \theta & 0 \\
        0 & 1 & 0 & 0 \\
        -\sin \theta & 0 & \cos \theta & 0 \\
        0 & 0 & 1 & 1 \\  
    \end{array}
\right ]
$$

$$
R_z(\theta) = 
\left [
    \begin{array}{}
        \cos \theta & -\sin \theta & 0 & 0 \\
        \sin \theta & \cos \theta & 0 & 0 \\
        0 & 0 & 1 & 0 \\
        0 & 0 & 0 & 1 \\        
    \end{array}
\right ]
$$

对特殊轴旋转，我们可以想办法看作对xyz的旋转，回到我们熟悉的情况。

接下来我们会到处都看到这个东西

$$
T = 
\left [
    \begin{array}{}
        n_x & o_x & a_x & p_x \\
        n_y & o_y & a_y & p_y \\
        n_z & o_z & a_z & p_z \\
        0   & 0   & 0   & 1   \\        
    \end{array}
\right ]
$$

前面 3 个通常写成 noa，惯例，没有对错一说。通常认为旋转的方向，以机器人来看都是 z，机器人绕 z 轴转，或者沿着 z 轴动，z 是要接近目标的方向，approch。

然后选定o，剩下的就是n。p就是描述一个点。

机器人是人造的，因此要熟悉一些他的游戏规则，。很多符号都是人为规定的，机器人是一个和自然的对比，完全的人造物。

noap就是一个变换矩阵。

有了这个矩阵。我们描述变换时，是放在前面还是后面呢。

运动的先后关系来确定是前乘还是后乘法。

后乘法表示参考坐标系统是前面那个，如 $$ Y = AB $$，B 的参考


这个事情是要研究复合运算。

旋转矩阵求逆很容易，然后齐次变换矩阵不那么容易。

$$
^B_A T = \ ^A_B T^{-1} = 
\left [
    \begin{array}{}
        ^A_B R^T & - \ ^A_B R^T \ ^A P_{Bo} \\
        0   & 1   \\        
    \end{array}
\right ]
$$

## 等效角度、轴线表示法

我们相对特殊轴做运算，对任意轴做旋转。

这个问题也要考虑反问题，给了矩阵，问是对那个轴转了多少度。



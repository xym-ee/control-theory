---
sort: 2
---
# 多入多出系统

这一部分内容是《现代控制理论基础》课程的内容。

(Modern Control System, Advanced control system)

相比于单入单出系统，这里关注线性系统内部状态，基于状态空间进行分析，摸到了一点现代控制理论的影子。

**状态空间**是应用数学里的一个经典抽象空间。到这里就只剩下抽象理解了，可以回顾一下前面线性代数的内容。当我们用抽象空间思考控制的问题时，就可以使用相当强大的矩阵工具，应用各种矩阵分析的方法来解决问题，这些方法就是应用数学中的数学，也容易被做成试题的样子加以考查。

这里的状态空间还是在讲微分方程的事情。接下来从另一个角度去理解微分方程：

n阶微分方程的输出由输入和n个初始条件决定，n阶系统所含的**独立无关**状态变量个数为n，这时候是不是可以用高维空间的角度去思考这个东西，n个无关量组合成一个n维向量，对应的有n维空间，这时候就可以研究状态向量在状态空间里的事情了。

状态空间研究的是系统状态随时间的变化关系，“变化”在数学上就是求导，因此状态空间表达式首先是个矩阵微分方程，表达状态向量的变化规律。

状态空间表达式(state space representation)是个矩阵方程，拆开来看是一系列**一阶微分方程**。一个高阶微分方程用一组一阶微分方程表示出来，大概是这么个意思。

$$
\begin{array}{l}
    \left\{
        \begin{align}
            \boldsymbol{\dot{x}=Ax+Bu} \\
            \boldsymbol{y=Cx+Du}
        \end{align}
    \right.
\end{array}
$$

u作为输入，y作为输出。经典理论里用传递函数更多，当然上面的状态空间表达式也可以经过拉普拉斯变换最后搞出个传递函数矩阵

$$ G(s) = C({s}I-A)^{-1}B+D $$

对于一个没有输入的系统 $$ \dot{x} = Ax $$ ，假设恰好这个系统矩阵是个对角矩阵，A矩阵的特征值为 $$\lambda_{i}$$ 。那么这个状态方程的解是一系列$$ e^{\lambda_{i}t} $$的线性组合（经典控制理论时域分析的结果也是这么表达的）。因此可以用这个特征值来判断系统的稳定性，如果所有的特征值的实部 $$ \text{Re}(\lambda_{i})<0 $$ 那么状态变量就稳定了。虚部如果不等于零，那么带来震动，实部就是包络线。这点和经典控制理论的极点是一样的。

这是很重要的一点，状态矩阵的特征值会决定系统的稳定性和表现。系统矩阵的**特征值**就是闭环传递函数的**极点**。这是个很猛的关系。

那么对于一个不是对角矩阵的系统矩阵呢？从物理世界出发，我们知道一个系统的稳定性和系统有关，和我这个外部的人是没啥关系的，不会因为我的存在或我的思考而变得不稳定，或者说这个系统矩阵是对客观世界的主观影像（哲学了。。），因此选不同的状态变量由不同的状态空间，但是这个状态空间都在描述同一个系统，一定有个东西是不变的。矩阵的特征值。

数学上，几个矩阵相似，而且还相似于一个对角矩阵，这个相似的意思就是描述的是一个物理系统。这些矩阵说的是同一个系统，所以是相似的。那么对于不是对角矩阵的矩阵，数学上也有手段搞成对角矩阵。这就是矩阵的相似对角化，或者叫矩阵的线性变换。在控制理论里把相似变换叫做非奇异变换，

然后我们引入Bu，成了闭环系统，新的系统的状态方程就变成了X=(A-Bk)x，想让他稳定，我们通过设计不同的k来控制新的闭环的状态矩阵的特征值。这就是一个基本的想法。

具体的方法，比如极点配置算出来的k，（k1、k2、···）

基本思路有了，我们要设计控制器了，可是x这个东西，有的系统是不可测的，这该怎么办呢？状态观测器就来了：

$$ x - \hat{x} = e $$

这个误差是观测器和实际数据的误差，通过一定手段，让e靠近0，这时候就知道系统状态就出来了。

求一个矩阵的特征值该怎么求呢？$$ Ax=\lambda x $$，导出来有$$ det(\lambda I-A)=0 $$，而前面传递函数矩阵，有个sI-A，所以前面特征函数求极点就是在求特征值。

```tip
In *Classical Control System*, a linear time invariant physical system is described with a transfer function model, which is equivalent to an nth-order Ordinary Differential Equation with zero initial value.

Transfer function model provides a practical approach to design and analysis, and allows to use block diagrams to interconnect subsystem.

In Modern Control System above system is described with an alternative model state variable system is described with an alternative model -- state variable model.

The state variable model is a set of first-order ODEs, derived from above nth-order ODE by
choosing a set variables—state variable, which is readily for computer solution and analysis.

```

## 特征

矩阵由特征值和特征向量，先理解了这两个东西我们再来看下面这个东西。

对于$$ Ax = \lambda x $$矩阵A代表了变换，从更数学的角度来看，如果把A看作一种映射，把v看作函数，那么

$$ A(x) = \lambda x $$

求导就是一种映射，把一个函数变换为另一个函数，那么求导运算的特征函数（特征向量）是什么呢？

$$ \frac{dx(t)}{dt} = \lambda x(t) $$

$$ x(t) = x(0)e^{\lambda t} $$

也就是说。指数函数是微分算子的特征函数，对于微分运算，仅仅是幅值变化了。






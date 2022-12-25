---
sort: 1
---
# Unconstrained Optimization

无约束优化。

## 局部极小点的条件

考虑一个优化问题

$$ 
\begin{aligned}
    \min \quad & f(\boldsymbol{x})  \\
    \text{s.t.}  \quad & \boldsymbol{x} \in \Omega
\end{aligned}
$$

函数 $$ f : \mathbb{R}^n \to \mathbb{R} $$ 称为**目标函数**(objective function)或者**代价函数**(cost function)

向量 $$ \boldsymbol{x} \in \mathbb{R}^n  $$，分量 $$ x_1, x_2 \cdots , $$ 称为**决策变量**(decision variables)

集合 $$ \Omega $$ 是 $$ \mathbb{R}^n $$ 的子集(subset)，称为**约束集**或者**可行集**(constraint set or feasible set)

优化问题，在可行集里找一个最好的，使得目标函数值最小。

如果约束集 $$ \Omega = \mathbb{R}^n $$ 那么这就是个无约束问题。

约束集的表示形式 $$ \Omega = \{ \boldsymbol{x} : h(x) = 0, g(x) \le 0 \} $$

关于极小值严格与否的问题。取不取等号。在领域内判定的代数表达。

局部极小点的条件。

一个 $$ n $$ 元函数 $$ f $$ ，一阶导数为

$$ Df = \left [ \frac{\partial f}{\partial x_1} , \frac{\partial f}{\partial x_2} , \cdots , \frac{\partial f}{\partial x_n} \right] $$
 
梯度为

$$ \nabla f = 
\left [
    \begin{array} {}
        \frac{\partial f}{\partial x_1} \\
        \frac{\partial f}{\partial x_2} \\
        \vdots \\
        \frac{\partial f}{\partial x_n}        
    \end{array}
\right ]
$$

函数一阶导数和梯度的关系 $$ Df = (\nabla f)^T $$

函数的二阶导数，也叫做海塞矩阵

$$
\boldsymbol{F} (\boldsymbol{x}) = D^2 f(\boldsymbol{x}) = 
\left [
    \begin{array} {}
        \frac{\partial^2 f}{\partial x_1 x_1} & \frac{\partial^2 f}{\partial x_2 x_1} & \cdots & \frac{\partial^2 f}{\partial x_n x_1} \\
        \frac{\partial^2 f}{\partial x_1 x_2} & \frac{\partial^2 f}{\partial x_2 x_2} & \cdots & \frac{\partial^2 f}{\partial x_n x_2} \\
        \vdots & \vdots & \ddots & \vdots \\
        \frac{\partial^2 f}{\partial x_1 x_n} & \frac{\partial^2 f}{\partial x_2 x_n} & \cdots & \frac{\partial^2 f}{\partial x_n x_n} \\
    \end{array}
\right ]
$$

优化问题的极小点可能在约束集内部，也可能在边界上。边界上的极小点满足一些条件。

可行方向：沿着这个方向走，还在可行集内。

对于点 $$ \boldsymbol{x} \in \Omega $$ ， $$ \boldsymbol{x} + \alpha \boldsymbol{d} \in \Omega $$，那么 $$ \boldsymbol{d} $$ 就是 $$ \boldsymbol{x} $$ 的可行方向。

方向导数

$$
\frac{\partial f}{\partial \boldsymbol{d}} = \lim_{\alpha \to 0} \frac{f(\boldsymbol{x} + \alpha\boldsymbol{d}) - f(\boldsymbol{x})}{\alpha}
$$

如果 $$ \Vert \boldsymbol{d} \Vert = 1 $$ 那么方向导数表示的是**增长率**

局部极小点的**一阶必要条件**：如果 $$ \boldsymbol{x}^* $$ 是 $$ f $$ 在 $$ \Omega $$ 上的局部极小点，则  $$ \boldsymbol{x}^* $$ 的任意可行方向 $$ \boldsymbol{d} $$ 都有 $$ \boldsymbol{d}^T \nabla f(\boldsymbol{x}^*) \ge 0 $$

```note
这个事情很好理解，那个数学表达式的意思是，方向导数大于0，也就是说**在极小点，往任何方向走都是增大的**。这句话好像是废话😂😂😂😂。上面的数学语言就说了这么个事情。

方向导数描述了沿着一个方向变化的情况。
```

一阶必要条件用方向导数的形式描述

$$ \frac{\partial f}{ \partial \boldsymbol{d}} (\boldsymbol{x}^*) \ge 0 $$

对于一阶连续可微函数来说，局部极小点的各个方向都增大必有 $$ \nabla f(\boldsymbol{x}^*) = 0 $$。

也即前面条件的特殊情况。

这两个条件的区别是边界点和内点。

局部极小点的**二阶必要条件**：如果 $$ \boldsymbol{x}^* $$ 是 $$ f $$ 在 $$ \Omega $$ 上的局部极小点，则  $$ \boldsymbol{x}^* $$ 的一个可行方向 $$ \boldsymbol{d} $$ 有 $$ \boldsymbol{d}^T \nabla f(\boldsymbol{x}^*) = 0 $$，则 $$ \boldsymbol{d}^T \boldsymbol{F}(\boldsymbol{x}^*) \boldsymbol{d} \ge 0 $$

局部极小点的**二阶充分条件**：$$ \boldsymbol{x}^* $$ 是约束集的一个内点，同时满足
- $$ \nabla f(\boldsymbol{x}^*) = \boldsymbol{0} $$
- $$ \boldsymbol{F} (\boldsymbol{x}^*) > 0 $$
则是一个严格局部极小点。

## 一维搜索方法简介

讨论一元函数 $$ f : \mathbb{R} \to \mathbb{R} $$ 的最小化优化问题的**迭代求解**方法。

这些迭代方法统称为以为搜索法，或者线性搜索法。一维搜索法是多变量问题求解方法的一个特例，也是多变量求解算法的一部分，所以还是很重要的。

迭代算法从初始搜索点 $$ x^{(0)} $$ 出发，产生迭代序列 $$ x^{(1)}, x^{(2)}, \cdots  $$。在迭代过程中，通过当前迭代点 $$ x^{(k)} $$ 和目标函数 $$ f $$ 找下一个迭代点 $$ x^{(k+1)} $$








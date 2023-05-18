---
sort: 3
---
# Constrained Optimization

有约束的非线性优化


## Problems with Equality Constraints

## Problems with Inequality Constraints

## Convex Optimization Problems

凸优化。

线性规划，看起来容易。但是因为约束的引入，问题也会变得麻烦。

这里想看一些更一般的结论。

E 22.1

无约束优化的解，正好也是有约束优化的最优解。两个约束不起作用。此时，有约束优化问题等价于无约束优化问题。解相同。

E22.2

换约束条件，从图上可以看出第一个约束没用，第二个约束有用。此时解变了。

E22.3

再换另一组约束条件。两个线性约束。

优化问题是研究约束的问题。

第三个问题有什么不同？

介绍凸集的概念。Convex sets

Recall that the line segment between two points u, v∈Rn is the set {w∈Rn : w = αu+(1−α) v, α∈ [0, 1]}. A point w = αu + (1 − α)v (where α∈[0, 1]) is called a convex combination of the points u and v.

凸组合

A set θ⊂Rn is convex if for all u, v∈θ, the line segment between u and v is in θ. Note that θ is convex if and only if αu + (1−α)v∈θ for all u, v∈θ and α∈(0,1).

(需要几何来直观化)

这是个几何上的定义，几何里任意选两个点，连线还在这个几何里面，就说这是凸的。

回头看E22.3，这不是一个凸的集合。

从代数表达来看是否为凸集。

Example1：
          Is H= {x : pTx=α}  a convex set?

Example2：
          Is H-= {x : pTx≤α}  a convex set?

Example3：
          Is L= {x : x = x(0) + αd, 0, α ≥ 0}  a convex set?

用代数方法证明是否为凸集。

一些性质，

线性规划里是很多约束集是很多集合的交集，这个交集有的是凸集

凸函数的定义，和数学分析里有区别。

先定义函数的图，上图。

用图来定义凸函数。函数的上图是凸集合，那么这就是个凸函数。

如果不是一眼很明显就能看出来的凸集，那么做题的时候要证明。

一些定理：如果函数在定义域上是凸的，那么这个定义域是个凸集合。

还有个定理，有的书上，也用一个表达式来定义一个函数是不是凸的，这个定义是常用来判断一个函数是不是凸的。这和大一学的凹凸性的一种变化形式。

这个表达式的解释：函数是 epigraph 的边界，epigraph 里的点大于边界。

如果三个函数的都是凸函数，

一些例子、判断函数是否是凸函数。

用函数本身来判断；用一阶导数来判断(有点像泰勒展开比大小)。

如果一个函数二阶可微，那么海塞矩阵是半正定的。

---

凸优化问题

In this section we consider optimization problems where **the objective function is a convex function and the constraint set is a convex set**. We refer to such problems as convex optimization problems or convex programming problems. (linear programs and optimization problems with quadratic objective function and linear constraints.) Convex programming problems are interesting for several reasons. Specifically, as we shall see, local minimizers are global for such problems. Furthermore, first-order necessary conditions become sufficient conditions for minimization.

目标函数是凸函数，约束时凸集，这就是个凸规划问题。

全局极小值就是局部极小值。直接就有这样的结论。

凸规划实际上没有这么简单。可以写出一本书来，这里只是简单理解。

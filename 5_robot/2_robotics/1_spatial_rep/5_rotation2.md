---
sort: 5
---
# Three Angle Rotation: Euler angles, RPY angles

对任意轴转任意角很累，可不可以把旋转也写成 3 个互相“垂直”的组合。旋转也是 3 个自由度，这是一个观念。

旋转运动由欧拉来管。

## 欧拉角，Euler Angels。

$$
Euler(\phi, \theta , \psi) = R_Z(\phi) R_Y(\theta) R_Z(\psi)
$$

写成矩阵

$$
\left [
    \begin{array}{}
        \cos \theta & -\sin \theta & 0 & 0 \\
        \sin \theta & \cos \theta & 0 & 0 \\
        0 & 0 & 1 & 0 \\
        0 & 0 & 0 & 1 \\        
    \end{array}
\right ]
\left [
    \begin{array}{}
        \cos \theta & 0 & \sin \theta & 0 \\
        0 & 1 & 0 & 0 \\
        -\sin \theta & 0 & \cos \theta & 0 \\
        0 & 0 & 1 & 0 \\  
    \end{array}
\right ]
\left [
    \begin{array}{}
        \cos \theta & -\sin \theta & 0 & 0 \\
        \sin \theta & \cos \theta & 0 & 0 \\
        0 & 0 & 1 & 0 \\
        0 & 0 & 0 & 1 \\        
    \end{array}
\right ]
$$

这个是后承，也就是相对于上一个坐标系。这就是 Z-Y-Z 欧拉角。

如果 Y 轴转角为 0，这就存在一个退化的现象。这也是一个旋转带来的麻烦。

Z-Y-X 也是可以的。只要不要退化就可以。表示法不会改变问题的本质，问题是躲不掉的，但是会更容易看清本质。

## RPY 表示法

除了欧拉角，还有 RPY 表示法，roll，pitch，yaw。

这种表示法用前乘法。

## 

现在来考虑反问题，给出矩阵，找3个角。

在特殊角度，有多解情况。

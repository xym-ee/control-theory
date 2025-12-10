---
sort: 1
---
# Spatial Representation and Transformation

空间表示法和坐标变换。

表达位置和姿态的数学手段。

依赖于坐标系，必须定义坐标系并给出表示规则。

约定存在一个**世界坐标系**，讨论任何问题都可以参照这个坐标系，或者参照根据世界坐标系定义出来的坐标系。

- Positon, Orientation and Frams
- Mapping between Frames
- Transformation
- Equivalent Angle-Axis of Rotation
- Three Angle Rotation: Euler angles, RPY angles
- Specification of Position

我们要知道每个轴的坐标系统，一个坐标系统有位置和方位(姿态)。坐标系和坐标系之间还要做一个映射。

比如胳膊上，每个轴放一个坐标系统，运动后，要描述运动是怎么改变物体的，使用坐标变换来描述。

这里要处理旋转和位置，旋转比较复杂。

为什么要学这些数学的东西？

我们希望应用更普及，更智能。

我们把机械臂当作一个遥控对象，就已经可以完成工厂的工作了，我们想让机械臂更智能，就需要更深入的了解这个系统了。

每个轴上放一个坐标系统，对与坐标系统的描述。

有了坐标系统，让他动起来，平移和旋转，这两种运动的描述。动起来，就有了坐标系统之间的关系。

坐标之间的转换用矩阵来描述，齐次变换矩阵，包含了旋转和位置信息。







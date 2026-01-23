---
sort: 2
---
# ROS2



## ubuntu20.04 

https://docs.ros.org/en/humble/Installation.html

http://fishros.org/doc/ros2/humble/Installation/Ubuntu-Install-Debians.html


虚拟机的配置

对于 8 核 16 线程 intel 处理器，虚拟机可配置处理器数量 1，每个处理器的内核数量 8。

虚拟化 Intel VT-x / EPT 和 虚拟化 CPU 性能计数器可以勾选。



安装

```sh

```



基本使用


工作空间，和 ROS1 一致

src 里存放源码目录，

一个工作空间下有许多功能包，一个功能包可以有很多节点。



- workspace
- package
- node topic msg

catkin -> ament

cmake 语义正经工程化。


`ros2 -h` 或者 `ros2 --help` 查看一些基本的 cli 使用方式


ros2 后面的操作，还可以再跟一个 -h 查看具体地用法。

如 `ros2 pkg -h`

创建一个功能包，在 src 下操作

```sh
ros2 pkg create hello_node \
  --build-type ament_cmake \
  --dependencies rclcpp
```


编译

```sh
colcon build

source install/setup.bash

ros2 run <pkg_name> <node_name>
```




ROS1，一个通信框架


ROS2，一个通行框架 + 调度系统






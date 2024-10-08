---
sort: 2
---
# ROS

## ROS 是什么

ROS 即 Robot Operating System，机器人操作系统，虽然这个东西叫做操作系统，但是我觉得它更像是一个通信框架。

在聊 ROS 之前，要先说说机器人。

我自己第一个上手做的“机器人”是一个循迹小车，尽管如今看来这个东西连机器人的门槛都没到。这个循迹车使用 ST 公司的 MCU ，使用前后台程序裸机开发。广义上来讲，这一整套裸机程序就是这个循迹车的“操作系统”，实现了多任务的配合完成了预期的比赛任务。

这套裸机程序可以采集传感器数据，驱动电机，并且根据传感器数据做出逻辑判断，此外还可能对电机转速做到简单的闭环控制。

简单来看，传感器采集时一个任务，电机控制也是一个任务，两个任务是有关联的，电机的动作依赖于传感器的数据，所以这两个任务有数据的交换即**通信**。

对于简单系统，大可以裸机运行，任务之间直接用全局变量交换数据就行。

对于复杂系统，就要考虑任务之间的调度问题了，此外还有任务之间的通信，需要一些机制来实现更好管理的数据交换。在 ROS 出现之前，这个问题确实是要机器人工程师来考虑的。如果使用MCU来开发机器人，可以使用 RTOS 来组织任务，多线程配合，用互斥锁保护共享内存的方式通信，也可以使用信号量、消息队列、邮箱等类似消息订阅的机制来实现任务挂起和唤醒让系统运行更高效。如果使用工控机，则可以基于 linux 开发机器人系统，直接进行多线程编程。

也就是说，一个人要想开发机器人，先要能在操作系统里读到传感器数据即 linux 驱动开发，然后会 linux 多线程编程然后才能真正进入到机器人相关的算法开发。

在 ROS 出现后，这一切都变了。

基于 ROS 设计机器人系统，即使不是很清楚操作系统原理也没关系，ROS 里的节点概念就是取代进程的，然后掌握了 ROS 里的通信模型，基本上就可以实现出一个有模有样的机器人了。大多数应用于工业的机器人不需要我们去做什么算法上的创新，但是要求工程师能非常熟练的使用别人的包，会调用也是一种能力。甚至在使用 ROS 时，我们都没有注意到驱动层次的东西，这也说明ROS在屏蔽底层细节上做的很好，在这一点上，这个框架称为“操作系统”也是很合理的。

最后，节点之间的通信是通过 TCP/IP 实现的，一个机器人工程师即使不知道这个事情也没关系，但是因为这个底层实现，使得不同的节点可以运行在不同的 PC 上，节点之间任用 TCP/IP 连接，这就是 ROS 的分布式通信能力的来源。

铺垫了这个多，回答标题，ROS是什么？

(我认为)**ROS是一个分布式的通信框架**。
## ROS 1

基于 ROS 的元老机器人 PR2

国际空间站里的跑 ROS 的机器人 Robonaut 2

安卓机器人，使用手机的 CPU 和传感器，控制机器人底盘。Tangobot

绝大多数机器人平台都支持 ROS 框架，深刻理解这个东西，才能算是迈进机器人的门了。

也是因为开源社区，所以说开源+社区是个好东西，这也是我看好 rt-thread 的原因。


2007 年 ROS 诞生于斯坦福，2010 年 ROS 1.0 发布，当时还是用在 PR2 上，因为售价过高，2011 年有了基于扫地机器人改装的低成本的 TurtleBot ，这也是一个经典的学习平台。

ROS 一开始设计用于学习研究，因为其**使用简单**方便进行算法验证，加快发论文的进度，所以有很多设计上的局限性。用的人越来越多，问题暴露出来，2017 年 ROS 2.0 全新改进版诞生了。


## ROS 2

2022.5 ROS2 有了第一个 LTS 版本 ROS2 Humble LTS。

ROS2出现的原因是ROS1有问题。ROS2在设计初就考虑要去满足各种各样机器人的应用
- 多机器人系统：标准方法和通信机制
- 跨平台：linux、Windows、RTOS，甚至是裸机MCU
- 实时性
- 网络连接
- 产品化和项目管理

ROS2 只是名字和 ROS1 一样，但是实际上彻底推导重来了，因此ROS2是一个全新的机器人操作系统，是一个真分布式的通信框架。

ROS2 和 ROS1 区别：

<figure>
    <img src="https://book.guyuehome.com/ROS2/1.%E7%B3%BB%E7%BB%9F%E6%9E%B6%E6%9E%84/image/1.2_ROS2%E5%AF%B9%E6%AF%94ROS1/image26-16532775781034.png" width=400>
</figure>

ROS1 里最不稳定的因素是 master，ROS引入了另一套机制discovery。

ROS1通信的底层为TCP和UDP，在ROS2里，协议为DDS。

在进程内传送大量数据，1和2都是使用共享内存的方法，只不过名字不太一样。

ROS1里基于TCP通信有延迟、丢包、无法加密的问题，在ROS的DDS方式解决掉了。DDS是物联网中广泛应用的一个通信协议，然而实现这个标准的软件系统不唯一，有很多厂家可以选，这些厂家的软件接口也不一样。为了解决这个问题，ROS2设计了一个ROS Middleware，制定了一个标准接口。


## ROS 总体设计

分布式软件框架，每个进程都是一个节点，节点可以分布在不同主机，通讯消息通过TCP完成通信。这样可以分担计算压力或者进行多机协同。

多语言支持，支持C++，Python，消息为无言无关的接口定义，定义号消息格式自动生成C++的.h文件或者Python的东西。

好多组件，RViz，Gazebo，rosbag，rqt工具箱等，此外还有社区


## ROS 系统实现

计算图，文件系统，开源社区


### 计算图
描述程序的运行

```bash
rqt_graph
```
几个东西
- 节点管理器（ROS Master）：控制中心，全局参数保存，帮助建立通信
- 节点（Node）：进程
- Topic
- Service

节点之间的配合通过通信完成，各个节点之间的配合推动机器人系统向前运行。这种Master集中化的管理方式是ROS1存在的隐患。

进程之间通信需要开发者相当关注的问题，解决通信问题，ROS的使用就解决了一大半。

## 文件系统
工程的组织方式



愉快的调包，开源社区


## 参考资料

- [ROS wiki](https://wiki.ros.org)






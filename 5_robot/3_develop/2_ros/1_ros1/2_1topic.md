---
sort: 6
---
# Topic


## 理论模型

Topic 实现模型涉及到三个东西：
- ROS Master
- Talker
- Listener

从这种通信方式的使用感觉上来讲 Talker 在说一个话题，对这个话题感兴趣的 Listerner 在偷偷的听，Talker并不知道有没有人在听。

但是底层实现为TCP协议，因此需要在底层建立连接， ROS Master 就是这个管事的，Talker 告诉 Master 在谈论的话题，Listener告诉Master感兴趣的话题，Master帮忙牵线搭桥。建立连接后，就没Master什么事了，这时候关掉这个东西也不影响通信，体会这个“牵线搭桥”作用。

Talker和Listener告诉Master的这个过程就是注册。

## C++实现

ROS master 已经有了，和计算机通信网络知识相关的TCP连接的建立也已经被封装了，很人性化，所以针对非计算机背景的机器人开发者，需要关注的关键点有三个:

- 使用ROS类实现接收方
- 使用ROS类实现发布方
- 数据格式

### 接收方（订阅者）

```cpp
#include "ros/ros.h"
#include "std_msgs/String.h"

void doMsg(const std_msgs::String::ConstPtr& msg_p){
    ROS_INFO("我听见:%s",msg_p->data.c_str());
    // ROS_INFO("我听见:%s",(*msg_p).data.c_str());
}
int main(int argc, char  *argv[])
{
    setlocale(LC_ALL,"");
    //2.初始化 ROS 节点:命名(唯一)
    ros::init(argc,argv,"listener");
    //3.实例化 ROS 句柄
    ros::NodeHandle nh;

    //4.实例化 订阅者 对象
    ros::Subscriber sub = nh.subscribe<std_msgs::String>("chatter",10,doMsg);
    //5.处理订阅的消息(回调函数)

    //     6.设置循环调用回调函数
    ros::spin();//循环读取接收的数据，并调用回调函数处理

    return 0;
}

```

订阅者有回调函数的概念，订阅者并不知道消息什么时候来，但是一旦有消息，就会调用这个消息处理函数。

`ros::spin()` 是循环等待函数。


### 发送方（发布者）


```cpp
#include "ros/ros.h"
#include "std_msgs/String.h" 
#include <sstream>

int main(int argc, char  *argv[])
{
    ros::init(argc,argv,"topic_publish");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<std_msgs::String>("topic_name",10);
    std_msgs::String msg;
    std::string msg_front = "test_msg:"; 
    int count = 0; 
    ros::Rate r(1);

    while (ros::ok())
    {
        std::stringstream ss;
        ss << msg_front << count;
        msg.data = ss.str();
        pub.publish(msg);
        ROS_INFO("send messages:%s", msg.data.c_str());
        r.sleep();
        count++;
        ros::spinOnce();
    }
    return 0;
}
```


### 调试

使用rostopic指令，可以手动向发布数据，比如说

```bash
# 示例
rostopic pub /topic_name std_msgs/String "aaaasss"

# 格式
rostopic pub <话题名> <消息类型> "aaaasss"
```

## 自定义 Topic 消息格式

自己做机器人，可能 ROS 提供的格式不够用，需要自己定义一个格式。

ROS封装了一些数据类型

String Int32 Int64 Char Bool Empty

这些类型都是一个字节。

为了传输复杂数据，可以使用自定义消息类型

msg是普通文本文件，经过编译后生成中间文件给开发者调用，使用文本文件也是为了支持不同语言。

文本文件里可以使用的类型：
- int8, int16, int32, int64
- uint8, unt16, uint32, uint64
- float32, float64
- string
- time, duration
- other msg files
- variable-length array[], fixed-length array[c]


- 定义 msg 文件
- 在 package.xml 里添加功能包依赖
- 在 CMakeLists.txt 添加编译选项
- 编译生成中间文件


### 定义格式

定义消息格式的文件`move.msg`
```txt
uint8 status
int32 velocity
int32 rotate
```

这里想用常量类似C语言enum去描述sex属性，这个文件并不是c类型也不是py，可以认为就是个普通文本。

### 编译配置

在 package.xml 文件里需要加上一些东西，来说明这个包用到自己定义的消息格式

```xml
<build_depend>message_generation</build_depend>

<exec_depend>message_runtime</exec_depend>  
```

在CMakeLists里也需要添加一个依赖

```makefile
find_package(
    ...
    message_generation
)

# 配置 msg 源文件
add_message_files(
  FILES
  move.msg
)

# 生成消息时依赖于 std_msgs
generate_messages(
  DEPENDENCIES
  std_msgs
)

#执行时依赖
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES demo02_talker_listener
  CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
#  DEPENDS system_lib
)
```

这样就可以进行编译了，编译完成后会自动生成C++、Python、各种语言的东西。

这就是**语言无关的消息类型接口**，用文本表述消息类型，自动生成各种东西。

在终端里，可以查看消息类型是否定义成功：
```bash
rosmsg show move
```

## 使用自定义消息


### 接口

编译后自动生成了消息头文件，Python的文件

C++路径`devel/include/topic`

Python路径`devel/lib/python3/dist-packages/topic/msg`


### 订阅者







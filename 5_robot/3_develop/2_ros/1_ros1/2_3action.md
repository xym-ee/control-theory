---
sort: 8
---
# Action


导航过程中，可以连续反馈当前机器人状态信息，当导航终止时，再返回最终的执行结果。在ROS中，该实现策略称之为:action 通信。

## 概念

在ROS中提供了actionlib功能包集，用于实现 action 通信。action 是一种类似于服务通信的实现，其实现模型也包含请求和响应，但是不同的是，在请求和响应的过程中，服务端还可以连续的反馈当前任务进度，客户端可以接收连续反馈并且还可以取消任务。

<figure>
    <img src="http://www.autolabor.com.cn/book/ROSTutorials/assets/action2.png" width=350 >
</figure>


## 自定义通信格式

### 消息格式的定义

需要使用action通信的功能包依赖  `actionlib` 和 `actionlib_msgs`，

```bash
catkin_create_pkg action_learn std_msgs roscpp rospy actionlib actionlib_msgs
```

在功能包下新建 `action` 目录，使用 `sum.action` 文件来描述通信消息的格式。


```txt
#目标值
int32 num
---
#最终结果
int32 result
---
#连续反馈
float64 progress_bar
```

### 编译规则

在功能包的 `CMakeLists.txt`

```makefile
add_action_files(
  FILES
  sum.action
)
```

```makefile
generate_messages(
  DEPENDENCIES
  std_msgs
  actionlib_msgs
)
```

```makefile
catkin_package(

#  INCLUDE_DIRS include
#  LIBRARIES demo04_action

 CATKIN_DEPENDS roscpp rospy std_msgs actionlib actionlib_msgs

#  DEPENDS system_lib

)
```


### 生成文件

编译后会生成一些中间文件。

在`devel/share/包名/msg`里可以看到生成的消息

使用这些消息时，如果用C++开发，包含消息头文件，在

`devel/include/包名`

如果使用Python开发，导入

`devel/lib/python3/dist-packages/包名/msg/`


## C++实现

已经有需要的消息格式文件了。

去实现一个使用action通信的例子

- 服务端
- 客户端
- 编辑CMakeLists.txt；


### 需求分析

实现两个节点，客户端发送正整数，服务端计算整数和，返回结果，同时要有进度提示。

### 添加头文件路径

使用VSCODE开发的话，编辑c_cpp_properies.json文件

```json
{
    "configurations": [
        {
            "browse": {
                "databaseFilename": "",
                "limitSymbolsToIncludedHeaders": true
            },
            "includePath": [
                "/opt/ros/noetic/include/**",
                "/usr/include/**",
                "/xxx/yyy工作空间/devel/include/**" //配置 head 文件的路径 
            ],
            "name": "ROS",
            "intelliSenseMode": "gcc-x64",
            "compilerPath": "/usr/bin/gcc",
            "cStandard": "c11",
            "cppStandard": "c++17"
        }
    ],
    "version": 4
}
```



### 服务端


```c++
#include "ros/ros.h"
#include "actionlib/server/simple_action_server.h"
#include "demo01_action/AddIntsAction.h"

typedef actionlib::SimpleActionServer<demo01_action::AddIntsAction> Server;

void cb(const demo01_action::AddIntsGoalConstPtr &goal,Server* server)
{
    //获取目标值
    int num = goal->num;
    ROS_INFO("目标值:%d",num);
    
    //累加并响应连续反馈
    int result = 0;
    demo01_action::AddIntsFeedback feedback;//连续反馈
    ros::Rate rate(10);//通过频率设置休眠时间
    for (int i = 1; i <= num; i++)
    {
        result += i;
        //组织连续数据并发布
        feedback.progress_bar = i / (double)num;
        server->publishFeedback(feedback);
        rate.sleep();
    }
    //设置最终结果
    demo01_action::AddIntsResult r;
    r.result = result;
    server->setSucceeded(r);
    ROS_INFO("最终结果:%d",r.result);
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ROS_INFO("action服务端实现");
    // 2.初始化ROS节点;
    ros::init(argc,argv,"AddInts_server");
    // 3.创建NodeHandle;
    ros::NodeHandle nh;
    // 4.创建action服务对象;
    /*SimpleActionServer(ros::NodeHandle n, 
                        std::string name, 
                        boost::function<void (const demo01_action::AddIntsGoalConstPtr &)> execute_callback, 
                        bool auto_start)
    */
    // actionlib::SimpleActionServer<demo01_action::AddIntsAction> server(....);
    Server server(nh,"addInts",boost::bind(&cb,_1,&server),false);
    server.start();
    // 5.处理请求,产生反馈与响应;

    // 6.spin().   
    ros::spin();
    return 0;
}

```



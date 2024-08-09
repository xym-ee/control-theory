---
sort: 7
---
# Service


## 理论模型




## C++实现

```cpp
/**
 * AddTwoInts Server
 */
 
#include "ros/ros.h"
#include "learning_communication/AddTwoInts.h"

// service回调函数，输入参数req，输出参数res
bool add(learning_communication::AddTwoInts::Request  &req,
         learning_communication::AddTwoInts::Response &res)
{
  // 将输入参数中的请求数据相加，结果放到应答变量中
  res.sum = req.a + req.b;
  ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
  ROS_INFO("sending back response: [%ld]", (long int)res.sum);
  
  return true;
}

int main(int argc, char **argv)
{
  // ROS节点初始化
  ros::init(argc, argv, "add_two_ints_server");
  
  // 创建节点句柄
  ros::NodeHandle n;

  // 创建一个名为add_two_ints的server，注册回调函数add()
  ros::ServiceServer service = n.advertiseService("add_two_ints", add);
  
  // 循环等待回调函数
  ROS_INFO("Ready to add two ints.");
  ros::spin();

  return 0;
}

```


```cpp
/**
 * AddTwoInts Client
 */
 
#include <cstdlib>
#include "ros/ros.h"
#include "learning_communication/AddTwoInts.h"

int main(int argc, char **argv)
{
  // ROS节点初始化
  ros::init(argc, argv, "add_two_ints_client");
  
  // 从终端命令行获取两个加数
  if (argc != 3)
  {
    ROS_INFO("usage: add_two_ints_client X Y");
    return 1;
  }

  // 创建节点句柄
  ros::NodeHandle n;
  
  // 创建一个client，请求add_two_int service，service消息类型是learning_communication::AddTwoInts
  ros::ServiceClient client = n.serviceClient<learning_communication::AddTwoInts>("add_two_ints");
  
  // 创建learning_communication::AddTwoInts类型的service消息
  learning_communication::AddTwoInts srv;
  srv.request.a = atoll(argv[1]);
  srv.request.b = atoll(argv[2]);
  
  // 发布service请求，等待加法运算的应答结果
  if (client.call(srv))
  {
    ROS_INFO("Sum: %ld", (long int)srv.response.sum);
  }
  else
  {
    ROS_ERROR("Failed to call service add_two_ints");
    return 1;
  }

  return 0;
}

```




## 定义消息格式

定义消息格式的文件`AddTwoInts.srv`
```txt
int64 a
int64 b
---
int64 sum
```

定义完成后先编译自动生成具体语言的数据类型实现。


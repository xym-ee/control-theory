---
sort: 1
---
# ROS 1 环境



## 环境安装

参考 

https://wiki.ros.org/cn/noetic/Installation/Ubuntu




```sh
# 设置sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'

# 设置密钥
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


# 更新软件包索引
sudo apt update


# 桌面版
sudo apt install ros-noetic-desktop
```


为了使用 ros 提供给的软件，可以每次都手动执行 
```sh
source /opt/ros/noetic/setup.bash
```

或者常用的话，设置每次终端启动自动加载环境变量
```sh
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
```

catkin 使用 cmake
```sh
sudo apt install -y build-essential
```

## 





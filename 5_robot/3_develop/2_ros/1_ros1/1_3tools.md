---
sort: 3
---
# 开发工具



## Terminator


```bash
sudo apt install terminator
```

常用快捷键

启动终端

ctrl + alt + T

分节

ctrl + shift + O

分栏

ctrl + shift + E

聚焦窗口移动
Alt+Up                          //移动到上面的终端
Alt+Down                        //移动到下面的终端
Alt+Left                        //移动到左边的终端
Alt+Right                       //移动到右边的终端

关闭窗口

ctrl + shit + W


## Visual Studio Code

开发 ROS 机器人需要用到的插件

- c/c++
- python
- ROS
- Cmake Tools
- Chinese

VSCODE的字体设置为：monospace,'Droid Sans Mono','monospace','Droid Sans Fallback'

可以解决显示的问题。


补全设置
```json
{
  "configurations": [
    {
      "browse": {
        "databaseFilename": "${workspaceFolder}/.vscode/browse.vc.db",
        "limitSymbolsToIncludedHeaders": false
      },
      "includePath": [
        "/home/meng/ros_ws/devel/include/**",
        "/opt/ros/melodic/include/**",
        "/usr/include/**"
      ],
      "name": "ROS",
      "intelliSenseMode": "gcc-x64",
      "compilerPath": "/usr/bin/gcc",
      "cStandard": "gnu17",
      "cppStandard": "c++17"
    }
  ],
  "version": 4
}
```

编译器设置，task.json
```json
{
    // 有关 tasks.json 格式的文档，请参见
        // https://go.microsoft.com/fwlink/?LinkId=733558
        "version": "2.0.0",
        "tasks": [
            {
                "label": "catkin_make:debug", //代表提示的描述性信息
                "type": "shell",  //可以选择shell或者process,如果是shell代码是在shell里面运行一个命令，如果是process代表作为一个进程来运行
                "command": "catkin_make",//这个是我们需要运行的命令
                "args": [],//如果需要在命令后面加一些后缀，可以写在这里，比如-DCATKIN_WHITELIST_PACKAGES=“pac1;pac2”
                "group": {"kind":"build","isDefault":true},
                "presentation": {
                    "reveal": "always"//可选always或者silence，代表是否输出信息
                },
                "problemMatcher": "$msCompile"
            }
        ]
    }

```








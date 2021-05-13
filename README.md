# HelloOS
基于 GRUB 引导启动最小的操作系统

<br>

```
.
├── entry.asm
├── vgastr.h
├── vgastr.c
├── main.c
├── hello.lds
└── Makefile
```

<br>

> 实验环境：Ubuntu 21.04 x86_64 

<br>

### 1) 编译得到 HelloOS.bin

```sh
# sudo apt install g++ nasm make
> make

# 同时拷贝 HelloOS.bin 到 /boot 目录下
> sudo cp HelloOS.bin /boot
```

### 2) 编辑 GRUB 引导菜单

```sh
# vi /etc/default/grub
# 将 GRUB_TIMEOUT 设置为 30秒的等待
# 将 GRUB_CMDLINE_LINUX_DEFAUL 设置为 text

GRUB_TIMEOUT=100
GRUB_CMDLINE_LINUX_DEFAULT="text"

# 并更新 GRUB 配置
> sudo update-grub
```

### 3) 添加 HelloOS 启动选项

```sh
# vi /boot/grub/grub.cfg

menuentry 'HelloOS' {
    # 加载分区模块识别分区
    insmod part_msdos
    # 加载 ext 文件系统模块识别 ext 文件系统
    insmod ext2
    # 注意 boot 目录挂载的分区，参考 Ubuntu 启动选项的配置
    set root='hd0,gpt3'
    # 以 multiboot2 协议加载 HelloOS.bin
    multiboot2 /boot/HelloOS.bin
    # 启动 HelloOS.bin
    boot
}
```

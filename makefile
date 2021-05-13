# 定义一个宏 CC 等于 gcc
CC = gcc
# 定义一个宏 CFLAGS 等于 -c
CFLAGS = -c
# 定义一个宏
OBJS_FILE = file.c file1.c file2.c file3.c file4.c
# 定义两个伪目标 all, everything
.PHONY : all everything
# 伪目标all依赖于伪目标everything
all:everything
# 伪目标 everythin g依赖于 OBJS_FILE，而 OBJS_FILE 是宏会被
# 替换成 file.c file1.c file2.c file3.c file4.c
everything :$( OBJS_FILE)
%.o : %.c
$(CC) $(CFLAGS) -o $@ $<

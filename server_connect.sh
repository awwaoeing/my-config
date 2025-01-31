#!/usr/bin/expect

# 设置超时时间（秒），超时后继续执行
set timeout 30
spawn  ssh charles_chx@172.16.19.128
#spawn  ssh -p 5000 root@120.79.189.30
expect {
    "*assword*" {
        send "kyo.soft./\r" 
    }
    # 如果连接超时处理
    timeout {
        puts "Connection timed out"
        exit 1
    }
}

# 登录成功后移交控制权给用户交互
interact

# 如果希望登录后自动执行命令然后退出，可替换为：
# expect "$ "          # 等待命令提示符
# send "ls -la\r"      # 执行示例命令
# expect "$ "          # 等待命令完成
# send "exit\r"        # 退出SSH
# expect eof           # 等待连接关闭

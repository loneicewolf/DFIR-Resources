# RESOURCES RELATED TO KERNEL DEVELOPMENT


## Linux Kernel Dev

### Hello World LKM, with makefile.

Makefile
```makefile
obj-m+=project.o
all:
	make -C /lib/modules/$(shell uname -r)/build/ \
	M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ \
	M=$(PWD) clean
test:
	-sudo rmmod project
	sudo dmesg -C
	sudo insmod project.ko
	-sudo rmmod project
	sudo dmesg
```


project.c
```c
/*
lsmod|grep -i --color project
make clean  &&  sleep 1 &&  make  && sleep 1 &&  make test

*/
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Author");
MODULE_DESCRIPTION("Desc");
MODULE_VERSION("1.0");

#define MSG_Loaded   printk(KERN_INFO "[+] project: Loaded \n");
#define MSG_UnLoaded printk(KERN_INFO "[-] project: Unloaded\n");


int init_module(void){
    printk(KERN_INFO "Hello world\n");
    MSG_Loaded;
    return 0;
}

void cleanup_module(void){
    printk(KERN_INFO "Goodbye world\n");
    MSG_UnLoaded;
}

```


## Windows Kernel Dev
- [ ] Todo



### Internal Links
- [LKM - Loadable Kernel Modules in Linux](https://gist.github.com/loneicewolf/226e3e20e6041d12a63a5e833ebb0503)
- 



### External Links
- 
- 
- 




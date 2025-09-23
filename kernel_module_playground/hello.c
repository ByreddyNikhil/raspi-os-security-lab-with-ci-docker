#include <linux/module.h>
#include <linux/kernel.h>

int init_module(void) {
    printk(KERN_INFO "hello_ksl: Hello, Kernel World!\n");
    return 0;
}

void cleanup_module(void) {
    printk(KERN_INFO "hello_ksl: Goodbye, Kernel World!\n");
}

MODULE_LICENSE("GPL");

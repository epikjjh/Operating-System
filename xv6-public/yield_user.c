#include "types.h"
#include "stat.h"
#include "user.h"

int main() {
    int fork_state;

    fork_state = fork();
    //Using fork to make child process

    while(1){
        if (fork_state < 0) {
            //In case of fork error
            printf(1, "fork error!\n");
            exit();
        } else if (fork_state == 0) {
            yield();
            //In case of child process
            printf(1, "Child\n");
        } else {
            yield();
            //In case of parent process
            printf(1, "Parent\n");
        }
    }
    exit();
}

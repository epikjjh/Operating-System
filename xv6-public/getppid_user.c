#include "types.h"
#include "stat.h"
#include "user.h"

int main() {
    int pid, ppid, wait_return, fork_state;

    fork_state = fork();
    //Using fork to make child process

    if (fork_state < 0) {
        //In case of fork error

        printf(1, "fork error!\n");
        exit();
    } else if (fork_state == 0) {
       //In case of child process

        pid = getpid();
        ppid = getppid();

        printf(1, "I'm child and my pid is %d\n", pid);
        printf(1, "I'm child and my ppid is %d\n", ppid);
    } else {
        //In case of parent process

        wait_return = wait();
        /*Wait for the excited child process. And it returns child's pid if  
            current process has child process. If not, it returns -1*/
        pid = getpid();

        printf(1, "I'm parent and my child's pid is %d\n", wait_return);
        printf(1, "I'm parent and my pid is %d\n", pid);
    }

    exit();
}

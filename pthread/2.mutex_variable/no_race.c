#include <pthread.h>
#include <stdio.h>

#define NUM_THREAD      10
#define NUM_INCREASE    1000000

int cnt_global = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *ThreadFunc(void *arg) {
    int i;
    long cnt_local = 0;

    for (i = 0; i < NUM_INCREASE; i++) {
        cnt_local++;
        cnt_global++;
    }

    return (void *)cnt_local; // == pthread_exit((void *) cnt_local);
}

int main(int argc, const char *argv[])
{
    int i;
    pthread_t threads[NUM_THREAD];

    for (i = 0; i < NUM_THREAD; i++) {
        rc = pthread_create(&threads[t], NULL, ThreadFunc, (void *)t);
    }

    long ret;
    for (i = 0; i < NUM_THREAD; i++) {
        printf("thread %lu, local count: %ld\n", threads[i], (long)ret);
    }

    printf("global count: %d\n", cnt_global);
    
    return 0;
}

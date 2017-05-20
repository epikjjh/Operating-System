#include <stdio.h>
#include <pthread.h>

#define NUM_THREAD      16
#define NUM_INCREASE    10000000

int cnt_global = 0;
pthread_mutex_t count_mutex;

void *ThreadFunc(void *arg) {
    int i;
    long cnt_local = 0;

    for (i = 0; i < NUM_INCREASE; i++) {
        pthread_mutex_lock(&count_mutex);
        cnt_global++;
        pthread_mutex_unlock(&count_mutex);
        cnt_local++;
    }

    return (void *)cnt_local; // == pthread_exit((void *) cnt_local);
}

int main(int argc, const char *argv[])
{
    int i;
    int rc;
    long t;
    pthread_t threads[NUM_THREAD];

    for (i = 0; i < NUM_THREAD; i++) {
        rc = pthread_create(&threads[i], NULL, ThreadFunc, (void *)t);
    }

    long ret;
    for (i = 0; i < NUM_THREAD; i++) {
        rc = pthread_join(threads[i], &ret);
        if (rc) {
            printf("ERROR; return code from pthread_join() is %d\n", rc);
            exit(-1);
        }
        printf("thread %lu, local count: %ld\n", threads[i], (long)ret);
    }

    printf("global count: %d\n", cnt_global);
    
    return 0;
}

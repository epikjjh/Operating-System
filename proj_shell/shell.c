#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define MAX 100


int Parse(char oper[], char oper_list[][MAX]); 
void Execute(char oper[]);

int main(int argc, char *argv[]){
    char oper[MAX];
    char oper_list[MAX][MAX];
    int oper_num,i;

    if(argc == 1) {
        while (1) { 
            printf("prompt> ");
            fgets(oper, MAX, stdin);
            //quit check
            oper_num = Parse(oper, oper_list);
            for (i=0; i < oper_num; i++) {
                Execute(oper_list[i]);
            }
        }
     //Interactive mode
    } else if(argc == 2) {
        FILE *fp;
        
        while (1) {
            fp = fopen(argv[1],"rt");
            fgets(oper, MAX, fp);
            printf("%s\n", oper);
            //quit check
            oper_num = Parse(oper, oper_list);
            for (i=0; i< oper_num; i++) {
                Execute(oper_list[i]);
            }
        }
     //Batch mode
    } else {
        printf("Input Error!\n"); 
        exit(-1);
    }//Error case

    return 0;
}
int Parse(char oper[], char oper_list[][MAX]){
    char *token;
    int i = 0;

    token = strtok(oper, ";");
    while (token != NULL) {
        strcpy(oper_list[i++], token);
        token = strtok(NULL, ";");
    }
    
    return i;
}
void Execute(char oper[]){
    int pid, status, i=0;
    char *vector[MAX];

    vector[i] = strtok(oper, " ");
    if(vector[i] != NULL){
        i++;
        while((vector[i++] = strtok(NULL, " ")) != NULL);
        vector[i] = NULL;
    }
    pid = fork();
    if (pid == -1) {
        printf("Fork Error!\n");
    } else if(pid == 0){
        execvp(vector[0],vector);
    } else{
        waitpid(pid, &status, 0);
    }
}

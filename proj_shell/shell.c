#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define MAX 100


int Parse(char oper[], char **oper_list, char *delimeter); 
int Execute(char oper[]);
int QuitCheck(char **vector);

int main(int argc, char *argv[]){
    char oper[MAX];
    char *oper_list[MAX];
    int oper_num,i,exit = 0;

    if (argc == 1) {
        while (01) { 
            printf("prompt> ");
            if (fgets(oper, MAX, stdin) == NULL){
                break;
            } else if (oper[0] == '\n') {
                continue;
            } else {
                oper_list[0] = strtok(oper, "\n");
                strcpy(oper, oper_list[0]);
                oper_num = Parse(oper, oper_list, ";");
                for (i=0; i < oper_num; i++) {
                    if(Execute(oper_list[i]) < 0){
                        exit = -1;
                        break;
                    }
                }
                if(exit < 0){
                    break;
                 }
            }
        }
     //Interactive mode
    } else if(argc == 2) {
        FILE *fp;
 
        fp = fopen(argv[1],"rt");
        while (!feof(fp)) {
            if(fgets(oper, MAX, fp) == NULL){
                break;
            }
            fprintf(stdout, "%s", oper);
            if(strcmp(oper, "\n") == 0) {
                continue;
            }
            oper_list[0] = strtok(oper, "\n");
            strcpy(oper, oper_list[0]);
            oper_num = Parse(oper, oper_list, ";");
            for (i=0; i < oper_num; i++) {
                if(Execute(oper_list[i]) < 0){
                    exit = -1;
                    break;
                }
            }
            if(exit < 0){
                break;
            }
        }
        fclose(fp);
     //Batch mode
    } else {
        printf("Input Error!\n"); 
        return -1;
    }//Error case

    return 0;
}
int Parse(char oper[], char **oper_list, char *delimeter){
    int i = 0;
    char *token;

    token = strtok(oper, delimeter);
    if(token != NULL){
        while(token != NULL){
            oper_list[i++] = token;
            token = strtok(NULL, delimeter);
        }
    } else if(oper_list[i] == NULL){
        return 0;
    }
        
    return i;
}
int QuitCheck(char **vector){
    int i=0;

    while(vector[i] != NULL){
        if(strstr(vector[i], "quit") != NULL){
            return 1;
        }
        i++;
    }
    return 0;
}
int Execute(char oper[]){
    int pid, i, status;
    char *vector[MAX];

    i = Parse(oper, vector, " ");
    vector[i] = NULL;

    if(QuitCheck(vector)){
        return -1;
    }
    pid = fork();
    if (pid == -1) {
        printf("Fork Error!\n");
    } else if(pid == 0){
        execvp(vector[0],vector);
    } else{
        waitpid(pid, &status, 0);
    }

    return 0;
}

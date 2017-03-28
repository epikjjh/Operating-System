#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define MAX 100
//Max operation number is fixed by 100.

void Initialize(char**oper_list);
/*
*This function is used to initialize operation list.(Initialize by NULL)
*@param[oper_list]      oper_list is the operation list to be initialized.
*/
int Parse(char oper[], char **oper_list, char *delimeter); 
/*
*This function is used to parse operation. Parse is done by slicing with given delimeter.
*@param[oper]           oper is the given operation to be sliced.
*@param[oper_list]      oper_list is the storage that sliced oper will be saved.
*@param[delimeter]      delimeter is slicing standard.
*@return                return number of operations.
*/
void Execute(char oper[]);
/*
*This function is used to execute given operation. First, operation is sliced with space(" ").
*This Process is for the defensive code. Then, sliced operation is executed by using execvp() function.
*@param[oper]           oper is the given operation to be executed.
*/
int QuitCheck(char **vector);
/*
*This function is used to check out terminate condition by using strstr() function.
*By looping given vector array, this function check out whether each operation has "quit" statement.
*If so, this function returns 1. Otherwise, it returns 0.
*@param[vector]         vector is operation array to be checked out whether each operation has "quit" statement.
*return                 when "quit" statement is in the vector, this function returns 1. Otherwise, it returns 0.
*/
int main(int argc, char *argv[]){
    char oper[MAX];
    char *oper_list[MAX];
    int oper_num,i;
    int status,*pid,exit;
    //Local variables

    if (argc == 1) {
        while (1) { 
            printf("prompt> ");
            //print initial shell statement.

            if (fgets(oper, MAX, stdin) == NULL){
                printf("\n");
                break;
                /*In case of user input being Ctrl + D : Terminate the program.*/

            } else if (oper[0] == '\n') {
                continue;
                /*In case of user input being Enter : Wait new input.*/

            } else {
                Initialize(oper_list);
                oper_list[0] = strtok(oper, "\n");
                strcpy(oper, oper_list[0]);
                oper_num = Parse(oper, oper_list, ";");
                pid = (int*)calloc(oper_num,sizeof(int));
                exit = QuitCheck(oper_list);
                for (i=0; i < oper_num; i++) {
                    pid[i] = fork();
                    if (pid[i] == -1) {
                        printf("Fork Error!\n");
                    } else if(pid[i] == 0){
                        Execute(oper_list[i]);
                    } else{
                        waitpid(pid[i],&status,0);
                    }
                }
                if(exit == 1){
                    break;
                }
                free(pid);
                //Free the dynamically allocated memory.

                /*In case of proper user input.*/

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
            if(oper[0] == '\n') {
                continue;
            }
            Initialize(oper_list);
            oper_list[0] = strtok(oper, "\n");
            strcpy(oper, oper_list[0]);
            oper_num = Parse(oper, oper_list, ";");
            pid = (int*)calloc(oper_num,sizeof(int));
            exit = QuitCheck(oper_list);
            for (i=0; i < oper_num; i++) {
                pid[i] = fork();
                if (pid[i] == -1) {
                    printf("Fork Error!\n");
                } else if(pid[i] == 0){
                    Execute(oper_list[i]);
                } else{
                    waitpid(pid[i], &status, 0);
                }
            }
            if(exit == 1){
                break;
            }   
            free(pid);
        }
        fclose(fp);
     //Batch mode
    } else {
        printf("Input Error!\n"); 
        return -1;
    }//Error case

    return 0;
}
void Initialize(char**oper_list){
    int i;

    for(i=0;i<MAX;i++){
        oper_list[i] = NULL;
    }
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
void Execute(char oper[]){
    char *vector[MAX];
    int i;

    i = Parse(oper, vector, " ");
    vector[i] = NULL;

    execvp(vector[0],vector);
}

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
                //Initialize oper_list

                oper_list[0] = strtok(oper, "\n");
                //Erase '\n'. This is cause of proper operation

                strcpy(oper, oper_list[0]);
                //Store the operation(Removing "\n")

                oper_num = Parse(oper, oper_list, ";");
                /*Slicing operation with ";", and store them in the oper_list.
                  Then store the operation number in oper_num*/

                pid = (int*)calloc(oper_num,sizeof(int));
                //Array of pid : memory allocation

                exit = QuitCheck(oper_list);
                //Check whether operation has "quit" statement

                for (i=0; i < oper_num; i++) {
                    pid[i] = fork();
                    if (pid[i] == -1) {
                        printf("Fork Error!\n");
                        //In case of fork failed

                    } else if(pid[i] == 0){
                        Execute(oper_list[i]);
                        //In case of child process

                    } else{
                        waitpid(pid[i],&status,0);
                        //In case of parent process
                    }
                }
                /*This loop is for executing operations. First do fork,
                  then execute operation in the child process.
                  Parent process will be waiting child process.*/

                if(exit == 1){
                    break;
                }
                /*In former progression, we check whether operation has "quit" statement.
                  If so, break the loop and terminate the program.
                  The reason why I terminate in this progress is for the intermixed situation.
                  ex) ls; quit; pwd*/
                free(pid);
                //Free the dynamically allocated memory.

                /*In case of proper user input.*/

            }
        }
     //Interactive mode

    } else if(argc == 2) {
        FILE *fp;
 
        fp = fopen(argv[1],"rt");
        //File pointer allocating

        while (!feof(fp)) {
            if(fgets(oper, MAX, fp) == NULL){
                break;
            }
            /*In case of user input being Ctrl + D : Terminate the program.*/

            fprintf(stdout, "%s", oper);
            //Print the operation in the batchfile(by line)

            if(oper[0] == '\n') {
                continue;
            }
            /*In case of user input being Enter : Wait new input.*/

            Initialize(oper_list);
            //Initialize oper_list

            oper_list[0] = strtok(oper, "\n");
            //Erase '\n'. This is cause of proper operation

            strcpy(oper, oper_list[0]);
            //Store the operation(Removing "\n")

            oper_num = Parse(oper, oper_list, ";");
            /*Slicing operation with ";", and store them in the oper_list.
              Then store the operation number in oper_num*/

            pid = (int*)calloc(oper_num,sizeof(int));
            //Array of pid : memory allocation

            exit = QuitCheck(oper_list);
            //Check whether operation has "quit" statement

            for (i=0; i < oper_num; i++) {
                pid[i] = fork();
                if (pid[i] == -1) {
                    printf("Fork Error!\n");
                    //In case of fork failed

                } else if(pid[i] == 0){
                    Execute(oper_list[i]);
                    //In case of child process

                } else{
                    waitpid(pid[i], &status, 0);
                    //In case of parent process

                }
            }
            /*This loop is for executing operations. First do fork,
              then execute operation in the child process.
              Parent process will be waiting child process.*/

            if(exit == 1){
                break;
            }   
            /*In former progression, we check whether operation has "quit" statement.
              If so, break the loop and terminate the program.
              The reason why I terminate in this progress is for the intermixed situation.
              ex) ls; quit; pwd*/

            free(pid);
            //Free the dynamically allocated memory.
        }
        fclose(fp);
        //Close the file pointer

     //Batch mode
    } else {
        printf("Input Error!\n"); 
        return -1;
    }//Error case : print error message

    return 0;
}
void Initialize(char**oper_list){
    int i;

    for(i=0;i<MAX;i++){
        oper_list[i] = NULL;
        //Initialize by NULL in loop statement
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
    /*While strtok returns sliced string(Terminate when it returns NULL),
      store the string in the oper_list*/
        
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
    /*Until the end of operations(When it comes to return NULL.
      This is beacuse I've initialized vector in former progress),
      find the operations has "quit" statement by using strstr function */
    return 0;
}
void Execute(char oper[]){
    char *vector[MAX];
    int i;

    i = Parse(oper, vector, " ");
    vector[i] = NULL;

    execvp(vector[0],vector);
    /*First, parse the given operation(This is because of proper execution.
      execvp doesn't accept operation with space(" ")).
      Then execute operation by using execvp function.*/
}

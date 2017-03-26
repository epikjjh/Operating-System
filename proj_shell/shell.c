#include <stdio.h>
#include <stdlib.h>
#define MAX 500

int ColonSearch(char oper[MAX]);
void Parse(char *oper, char **oper_list); 

int main(int argc, char *argv[]){
    char oper[MAX] = {0};
    int col_num,i;
    char *oper_list[MAX];

    if(argc == 1) {
        while (1) { 
            printf("prompt> ");
            fgets(oper, MAX, stdin);
            col_num = ColonSearch(oper);

            if(col_num == 0){
                system(oper);
             //1 Line 1 Command
            } else{
               Parse(oper, oper_list);
               // for(i = 0; oper_list[i] != NULL; i++){
               //     printf("%s\n", oper_list[i]);   
               // }
            }//1 Line many Commands
        }
     //Interactive mode
    } else if(argc == 2) {

        exit(1);
     //Batch mode
    } else {
        printf("Input Error!\n"); 
        exit(-1);
    }//Error case

    return 0;
}
int ColonSearch(char oper[MAX]){
    int i,count=0;

    for(i=0;i<MAX;i++){
        if(oper[i] == ';'){
            count++;
        } else if(oper[i] == '\0'){
           break;
        }
    }
    return count;
}
void Parse(char *oper, char **oper_list){
    char *token;

    token = strtok(oper, ';');
    while (token != NULL) {
        printf("%s", token);
        *(oper_list++) = token;
        token = strtok(NULL, ';');
    }
    *oper_list = NULL;
}

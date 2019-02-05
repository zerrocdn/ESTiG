#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ARGS 100

char command[30];
char *argVector[MAX_ARGS];

void GetCommand(char command[]);
int PrintArguments(char command[]);
void makeArgVector(char command[], char *argVector[]);

int main(){

int i,pid, childPid;

  pid=fork();
  if( pid == 0 ){
    makeArgVector(command, argVector);
    execvp(argVector[0], argVector);
  }
  else{
    wait(&childPid);
    printf("Programa executado! Posso continuar...\n");
  }
  return 0;
}

void GetCommand(char command[]){
  scanf("%[^\n%*c]", command);
}
// int PrintArguments(char command[]){
//     GetCommand(command);
//     int tokenNumber;
//     char delim[2] = " ";
//     char *token = strtok(command, delim);
//     while(token != NULL){
//       tokenNumber = tokenNumber + 1;
//       token = strtok(NULL, delim);
//     }
//     return tokenNumber;
// }

void makeArgVector(char command[], char *argVector[]){
  //int a = PrintArguments(command);
  GetCommand(command);
  int buffer = strlen(command);
  printf("%d\n", buffer);
  argVector[0] = (char *) malloc(buffer);
  strcpy(argVector[0], command);
  argVector[1] = (char *) NULL;
  printf("%s\n", *argVector);
}





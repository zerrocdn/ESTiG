#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>


char command[1024];

void GetCommand(char command[]);
int PrintArguments(char command[]);
void makeArgVector(char command[], char *argVector[]);

int main(int argc, const char* argv[]){
  int i,pid, childPid;
  printf("Simple Shell Inicialized.\n\n---------------------------------------------------------------------------\n\n");
  pid=fork();
  if( pid == 0 ){
    GetCommand(command);
    execlp("ls", command);
  }
  else{
    wait(&childPid);
    printf("Simple Shell Finished.\n\n");
  }
  return 0;

}

void GetCommand(char command[]){
  do{
    printf("Awaiting orders: ");
    gets(command, strlen(command), stdin);
    printf("Commando executado! Posso continuar...\n\n");

  }while(strcmp(command , "quit") != 0);
}

int PrintArguments(char command[]){
  char *token = strtok(command, " ");
  int tokenNumber = 0;
  while(token != NULL){
    printf("%d - %s\n", tokenNumber, token);
    tokenNumber = tokenNumber + 1;
    token = strtok(NULL, " ");
  }
}

void makeArgVector(char command[], char *argVector[]){
  PrintArguments(command);
}


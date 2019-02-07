#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

char *argVector[100];
char command[100];

void getCommand(char command[]);
int printArguments(char command[]);
void makeArgVector(char command[], char *argVector[]);

int main(int argc, const char* argv[])
{
  int pid, childPid;
  do
  {
    printf("Introduza um commando: ");
    getCommand(command);
    printf("Tokens: \n\n");
    printArguments(command);
    printf("\n\n");
    pid = fork();
    if (pid == 0)
    {
      printf("Vou executar o comando: %s\n\n", command);
      execlp(command, command, (char *)NULL);
      printf("Commando executado: %s\n\n", command);
    }
    else
    {
      wait(&childPid);
      if (strcmp(command, "quit") != 0)
      {
        printf("Commando executado: %s\n\n", command);
      }
      else
      {
        
        printf("SimpleShell Closed.\n\n");
      }
    }
  } while (strcmp(command, "quit") != 0);
}

void getCommand(char command[])
{
  gets(command, strlen(command), stdin);
}

int printArguments(char command[])
{
  char *token;

  token = strtok(command, " ");

  while (token != NULL)
  {
    printf("%s\n", token);
    token = strtok(NULL, " t");
  }

  return (0);
}

void makeArgVector(char command[], char *argVector[])
{
  printArguments(command);
}

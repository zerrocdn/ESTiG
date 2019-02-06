#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

char command[100];

void getCommand(char command[]);
int printArguments(char command[]);

int main()
{
  int pid, childPid;
  do
  {
    printf("Introduza um commando: ");
    getCommand(command);
    printArguments(command);
    pid = fork();
    if (pid == 0)
    {
      execlp(command, command, "-l", (char *)NULL);
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
  strcat(token,(char *) NULL);
  while (token != NULL)
  {
    printf("%s\n", token);
    token = strtok(NULL, " t");
  }

  return (0);
}

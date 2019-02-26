#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

#define LSH_TOK_BUFSIZE 64
#define LSH_TOK_DELIM " \t\r\n\a"

char *argVector[100];
char command[100];

void getCommand(char command[]);
int printArguments(char command[]);
void makeArgVector(char command[], char *argVector[]);

int main(int argc, const char *argv[])
{
  int pid, childPid;
  printf("________________________WELCOME TO SIMPLE SHELL________________________\n\n");
  do
  {
    printf("\n");
    printf("Introduza um commando: ");
    getCommand(command);
    if (strcmp(command, "quit") == 0)
    {
      printf("___________________________END TO SIMPLE SHELL_________________________\n\n");
    }
    else
    {
      makeArgVector(command, argVector);
      printf("\n");

      pid = fork();
      if (pid == 0)
      {
        execvp(argVector[0], argVector);
      }
      else
      {
        wait(&childPid);
        printf("Comando executado com successo.\n");
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
  int n = 0;
  char *args;

  args = strtok(command, " ");

  while (args != NULL)
  {
    printf("Argumentos %s\n", args);
    args = strtok(NULL, " ");
    n++;
  }

  return (0);
}

void makeArgVector(char command[], char *argVector[])
{
  int bufsize = LSH_TOK_BUFSIZE, position = 0;
    argVector = malloc(bufsize * sizeof(char *));
    char *token;

    if (!argVector)
    {
        fprintf(stderr, "lsh: allocation error\n");
        exit(EXIT_FAILURE);
    }

    token = strtok(command, LSH_TOK_DELIM);
    while (token != NULL)
    {
        argVector[position] = token;
        position++;

        if (position >= bufsize)
        {
            bufsize += LSH_TOK_BUFSIZE;
            argVector = realloc(argVector, bufsize * sizeof(char *));
            if (!argVector)
            {
                fprintf(stderr, "lsh: allocation error\n");
                exit(EXIT_FAILURE);
            }
        }

        token = strtok(NULL, LSH_TOK_DELIM);
    }
    argVector[position] = NULL;
}

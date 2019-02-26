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
    int n = 0;
    const char s[2] = " ";
    char *token;

    /* get the first token */
    token = strtok(command, s);
    /* walk through other tokens */
    while (token != NULL)
    {
        argVector[n] = token;
        printf("Argumentos %s\n", token);
        token = strtok(NULL, s);
        n++;
    }

    argVector[n] = NULL;
}

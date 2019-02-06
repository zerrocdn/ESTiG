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

int main()
{
    printf("%s", command);
    int i, pid, childStatus;
    printf("Sou o pai. Tenho o pid %d.\n", getpid());
    pid = fork();
    if (pid == 0)
    {
        printf("Sou o Filho!!!!!!!!\n\n");
    }
    else
    {
        printf("\n%d\n", childStatus);
        wait(&childStatus);
        do
        {
            printf("Awaiting orders: ");
            GetCommand(command);
            printf("Commando executado! Posso continuar...\n\n");

        } while (strcmp(command, "quit") != 0);
    }
    return 0;
}

void GetCommand(char command[])
{
    gets(command, strlen(command), stdin);
}

int PrintArguments(char command[])
{
    char *token = strtok(command, " ");
    int tokenNumber = 0;
    while (token != NULL)
    {
        printf("%d - %s\n", tokenNumber, token);
        tokenNumber = tokenNumber + 1;
        token = strtok(NULL, " ");
    }
}

void makeArgVector(char command[], char *argVector[])
{
    PrintArguments(command);
}

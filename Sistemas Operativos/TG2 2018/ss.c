#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    int i, pid, childStatus;
    printf("Sou o pai. Tenho o pid %d.\n", getpid());
    pid = fork();
    if (pid == 0)
    {
        for (i = 10; i >= 0; i--)
            printf("Sou o %d: %d\n", getpid(), i);
    }
    else
    {
        printf("\n%d\n", childStatus);
        wait(&childStatus);
        for (i = 0; i <= 10; i++)
            printf("Sou o %d: %d\n", getpid(), i);
    }
    return 0;
}
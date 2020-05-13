#include <stdio.h>
#include "libasm.h"
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>


int main()
{
    char *s1 = "aaaaqwe";
    char *s2 = "aaaaqwe";

    printf("{MINE} %d\n{REAL} %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));

    //printf("%d\n", ft_strcmp("test", "lol"));
}
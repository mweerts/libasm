/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mweerts <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/14 16:01:54 by mweerts           #+#    #+#             */
/*   Updated: 2020/05/14 16:01:54 by mweerts          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "libasm.h"
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

char *tab[6] = {"Test", "ABC DEF", "Test \nretour ligne", "Test \\0 \0 test", "\xff", NULL};
void test_strlen();
void test_strcpy();
void test_write();
void test_strcmp();
void test_strdup();
void test_read();

int main(int argc, char **argv)
{


    if (argc < 2 || argc > 3)
    {
        printf("Specifier la fonction a tester : <all | ft_strlen | ft_strcpy | ft_strcmp | ft_write | ft_read | ft_strdup\n");
        return(0);
    }
    if (strcmp(argv[1], "ft_strlen") == 0)
		test_strlen();
	else if (strcmp(argv[1], "ft_strcpy") == 0)
		test_strcpy();
	else if (strcmp(argv[1], "ft_strcmp") == 0)
		test_strcmp();
	else if (strcmp(argv[1], "ft_write") == 0)
		test_write();
	else if (strcmp(argv[1], "ft_strdup") == 0)
		test_strdup();
	else if (strcmp(argv[1], "ft_read") == 0)
		test_read();
	else if (strcmp(argv[1], "all") == 0)
	{
		test_strlen();
		test_strcpy();
		test_strcmp();
		test_write();
		test_read();
		test_strdup();
	}
    else
    {
        printf("Mauvais argument");
    }
    
}

void	test_strcpy()
{
	char dest[20];
	char dest2[20];
	int i = 0;

	printf("\033[01;32m==========\tft_strcpy\t==========\n\n\033[0;0m");
	while (tab[i])
	{
		printf("{MINE} : %s\n{REAL} : %s\n\n", ft_strcpy(dest, tab[i]), strcpy(dest2, tab[i]));
		i++;
	}
}

void	test_strlen()
{
    int i = 0;

	printf("\033[01;32m==========\tft_strlen\t==========\n\n\033[0;0m");
    while (tab[i])
    {
    	printf("String : %s\n{REAL} : %lu\t{MINE} : %lu\n\n", tab[i], strlen(tab[i]), ft_strlen(tab[i]));
		i++;
	}
}

void 	test_strcmp()
{
	char *s2 = "Test";
	int i = 0;

	printf("\033[01;32m==========\tft_strcmp\t==========\n\n\033[0;0m");
	while (tab[i])
	{
		printf("s1 = %s\t s2 = %s\n{MINE} : %d\t{REAL} : %d\n\n", tab[i], s2, ft_strcmp(tab[i], s2), strcmp(tab[i], s2));
		i++;
	}
	printf("s1 = %s\t s2 = %s\n{MINE} : %d\t{REAL} : %d\n\n", "", s2, ft_strcmp("", s2), strcmp("", s2));
	printf("s1 = %s\t s2 = %s\n{MINE} : %d\t{REAL} : %d\n\n", s2, "", ft_strcmp(s2, ""), strcmp(s2, ""));
}

void	test_write()
{
	int i = 0;

	printf("\033[01;32m==========\tft_write\t==========\n\n\033[0;0m");
	printf("Wrong fd {MINE} : %zd\terrno : %d\n", ft_write(-1, "Wrong fd", strlen("Wrong fd")), errno);
	errno = 0;
	printf("Wrong fd {REAL} : %zd\terrno : %d\n\n", write(-1, "Wrong fd", strlen("Wrong fd")), errno);
	errno = 0;
	printf("NULL string {MINE} : %zd\terrno : %d\n", ft_write(1, NULL, 10), errno);
	errno = 0;
	printf("NULL string {REAL} : %zd\terrno : %d\n\n", write(1, NULL, 10), errno);
	errno = 0;
	while (tab[i])
	{
		printf(" {MINE} : %zd\terrno : %d\n", ft_write(1, tab[i], strlen(tab[i])), errno);
		printf(" {REAL} : %zd\terrno : %d\n\n", write(1, tab[i], strlen(tab[i])), errno);
		i++;
	}
}

void	test_read()
{
	int fd;
	int ret;
	char buff[100];

	printf("\033[01;32m==========\tft_read\t==========\n\n\033[0;0m");
	fd = open("srcs/ft_strcpy.s", O_RDONLY);
	ret = ft_read(fd, buff, 100);
	printf("{MINE} : %s\nerrno : %d\n", buff, errno);
	errno = 0;
	close(fd);
	memset(buff, 0, 100);
	fd = open("srcs/ft_strcpy.s", O_RDONLY);
	ret = read(fd, buff, 100);
	printf("{REAL} : %s\nerrno : %d\n\n", buff, errno);
	memset(buff, 0, 100);

	fd = open("srcs/ft_strcpy.s", O_WRONLY);
	ret = ft_read(fd, buff, 100);
	printf("{MINE} : %s\nerrno : %d\n", buff, errno);
	errno = 0;
	close(fd);
	memset(buff, 0, 100);
	fd = open("srcs/ft_strcpy.s", O_WRONLY);
	ret = read(fd, buff, 100);
	printf("{REAL} : %s\nerrno : %d\n\n", buff, errno);
	memset(buff, 0, 100);
}

void	test_strdup()
{
	int i = 0;

	printf("\033[01;32m==========\tft_strdup\t==========\n\n\033[0;0m");
	while (tab[i])
	{
		printf("{MINE}: %s\n{REAL}: %s\n\n", ft_strdup(tab[i]), strdup(tab[i]));
		i++;
	}
	printf("{MINE}: %s\n{REAL}: %s\n\n", ft_strdup("\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0b\x0c\x0d\x0e\x0f"), strdup("\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0b\x0c\x0d\x0e\x0f"));
}
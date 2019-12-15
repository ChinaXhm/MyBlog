---
title: "List"
date: 2019-12-13T23:05:56+08:00
draft: true
tags: ["标签", "", ""]
---

# 链表(C语言)
## 1.节点定义
```c
typedef char datatype;
typedef struct node
{
    node *next;
    datatype data;
}N;//起别名
```
## 2.初始化链表
```c
  N *creatlist()
{
	N *head,*p;
	head=(N *)malloc(sizeof(N));
	if(head==NULL)
	{
		printf("动态内存分配失败");
		return 0;
	}
	else
	{//采用尾插法建表 
		int n,i;
		p=head;
		printf("请输入节点个数:");
		scanf("%d",&n);
		for(i=0;i<n;i++)
		{
			N *node=(N *)malloc(sizeof(N));
			node->next=NULL;
			printf("请输入%d个节点的值:",i);
			getchar() ;
			node->data=getchar();
			p->next=node;
			p=node;
		}
	}
	return head;
}
```
## 3.输出链表
```c
 	if(head->next!=NULL)
	{
		printf("输出结果为");
		N *a=head->next;	
		while(a!=NULL) 
		{
			printf("%c  ",a->data);
			a=a->next;
		}
	}
	else
	{
		printf("空表\n");
	}
```
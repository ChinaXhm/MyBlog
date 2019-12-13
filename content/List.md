---
title: "List"
date: 2019-12-13T23:05:56+08:00
draft: true
tags: ["标签", "", ""]
---

# 链表(C语言)
## 1.节点定义
```c
typedef int datatype;
typedef struct node
{
    node *next;
    datatype data;
}N;//起别名
```
## 2.初始化链表
```c
    N *creatlist()//采用尾插法建表;
    {
        N *head=(* N)malloc(sizeof(N)),*p=NULL;//定义头节点
        if(head)
        {
            printf("动态申请内存失败\n");
        }
        else
        {
            int n=0;
            head->next=NULL;
            p=head->next;
            printf("请输入节点数:");
            scanf("%d",&n);
            while(n)
            {   
                N n=(* N)malloc(sizeof(N));
                n->next=NULL;
                p->next=n;
                p=n;         
            }

        }

    }
```
## 3.输出链表
```c
    void output(N *head)
    {
        int i=0;
        N *a=head
        if(head==NULL)
        {
            printf("链表头有误\n");
        }
        while(a->next!=NULL)
        {
            i++;
            a=a->next;
            printf("%d个元素的值为%d",i,a->next);
        }
    }

```
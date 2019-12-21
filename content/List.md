---
title: "List"
date: 2019-12-13T23:05:56+08:00
draft: true
tags: ["单链表", "数据结构"]
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
## 2.创建链表
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
void output(N *head)
{
	int length=0;
	if(head->next!=NULL)
	{
		printf("输出结果为");
		N *a=head->next;	
		while(a!=NULL) 
		{
			printf("%c  ",a->data);
			a=a->next;
			length++;
		}
	}
	else
	{
		printf("空表\n");
	}	
	printf("\n当前表长为:%d\n",length);
}
```
### 4.插入元素
```c
int insert(N *head,datatype x,int local) 
{
	N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
			//先将a指针指向插入位置的节点;
		for(i=0;i<local;i++)
		{
			a=a->next;
		}
		//需要判断插入位置是否为表尾;
		if(listlength(head)>=local)
		{
			if(a->next!=NULL) 
			{
				
				p=a->next;
				N *n=(N *)malloc(sizeof(N));
				n->next=p;
				n->data=x;
				a->next=n;	
			}
			else
			{
				N *n=(N *)malloc(sizeof(N));
				n->next=NULL;
				n->data=x;
				a->next=n;
			}
			return 1;
		}	
		else
		{
			printf("错误:超出链表长度\n");
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}	
}
```
### 5.删除元素
```c
int nodedelete(N *head,int local) 
{
		N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
			//先将a指针指向删除位置之前的节点;
		for(i=0;i<local-1;i++)
		{
			a=a->next;
		}
		if(listlength(head)>=local)
		{
			//需要判断删除位置是否为表尾;
			if(a->next!=NULL) 
			{
				p=a;
				p=p->next;
				a->next=p->next;
				printf("删除元素为:%c \n",p->data);
				free(p);
			}
			else
			{
				printf("删除元素为:%c \n",a->next->data);
				free(a->next);
				a->next=NULL;
			}
			return 1;
		}
		else
		{
			printf("错误:超出链表长度\n");
			return 0;
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}
}
```
### 6.修改元素
```c
int update(N *head,datatype x,int local) 
{
		N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
		for(i=0;i<local;i++)
		{
			a=a->next;
		}
		if(listlength(head)>=local)
		{
			printf("修改位置为:%d修改前元素的值为:%c\n",local,a->data);
			a->data=x;
			printf("修改成功,修改后的值为:%c\n",a->data);
		}
		else
		{
			printf("错误:超出链表长度\n");
			return 0;
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}
}
```
### 8.链表排序(按值排序)
#### (1).修改值
```c
//先计算链表长度
void Sortlist(N *head)
{
	int length=length(head),j,i,x;
	//冒泡排序
	for(i=0;i<length;i++)
	{
		for(j=i;j<length;j++)
		{

		}
	}



}
```
#### (2).修改节点位置
```c
void sortLIst(N *head,int isture)
{
	N *left=head->next,*right=head->next->next;//将节点分别指向第一个实际节点和第二个实际节点
	N *zhongjian=head;
	N *jiaohuan=NULL;
	N *s=head;
		
	//采用冒泡的思想;
	//遍历两边链表
	//从大到小
	// 指针变量指向链表循序   zhongjian     left     right ;
	//emmmm,遗漏了问题，为了冒泡的效率，需要求出链表长度;
	int length=0,i=0,j=0;
	while(s->next!=NULL)
	{
		length++;
		s=s->next;
	}
	if(isture)//判断排序方式,真为从大到小
	{
		for(;i<length-1;i++)
		{//外层循环	
			N *left=head->next,*right=head->next->next;
			N *zhongjian=head;
			for(j=0;j<length-i-1;j++)
			{
			
						if(left->data<=right->data)
					{
						//改变指针
						//(首先将左节点的直接前驱节点)的指针域直接指向右节点;
						zhongjian->next=right;
						//再将左节点的指针 指向 （右节点指向的节点）
						left->next=right->next;
						//再将右节点的指针指向左节点
						right->next=left;
						jiaohuan=left;
						left=right;
						right=jiaohuan;	
							//交换之后左右指针的位置需要调换回来;
					}
					//交换之后需要将指针后移
						left=left->next;
						right=right->next;
						zhongjian=zhongjian->next;			
			}
		}	
	}
	else
	{
			for(;i<length-1;i++)
		{//外层循环	
			N *left=head->next,*right=head->next->next;
			N *zhongjian=head;
			for(j=0;j<length-i-1;j++)
			{
						if(left->data>=right->data)
					{
						//改变指针
						//(首先将左节点的直接前驱节点)的指针域直接指向右节点;
						zhongjian->next=right;
						//再将左节点的指针 指向 （右节点指向的节点）
						left->next=right->next;
						//再将右节点的指针指向左节点
						right->next=left;
						jiaohuan=left;
						left=right;
						right=jiaohuan;		
							//交换之后左右指针的位置需要调换回来;
					}
					//交换之后需要将指针后移
						left=left->next;
						right=right->next;
						zhongjian=zhongjian->next;
			}
		}	
	
	}			
}
```
### 完整(本人菜鸟，仅供参考)
```c
#include "stdio.h" 
#include "stdlib.h"
typedef char datatype;
typedef struct node{
	node *next;
	datatype data;
}N;
void output(N *head)
{
	int length=0;
	if(head->next!=NULL)
	{
		printf("输出结果为");
		N *a=head->next;	
		while(a!=NULL) 
		{
			printf("%c  ",a->data);
			a=a->next;
			length++;
		}
	}
	else
	{
		printf("空表\n");
	}	
	printf("\n当前表长为:%d\n",length);
}
int listlength(N *head)
{
	int length=0;
	N *a=head->next;
	while(a!=NULL)
	{
		length++;
		a=a->next;	
	}
	return length;
}
int insert(N *head,datatype x,int local) 
{
	N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
			//先将a指针指向插入位置的节点;
		for(i=0;i<local;i++)
		{
			a=a->next;
		}
		//需要判断插入位置是否为表尾;
		if(listlength(head)>=local)
		{
			if(a->next!=NULL) 
			{
				
				p=a->next;
				N *n=(N *)malloc(sizeof(N));
				n->next=p;
				n->data=x;
				a->next=n;	
			}
			else
			{
				N *n=(N *)malloc(sizeof(N));
				n->next=NULL;
				n->data=x;
				a->next=n;
			}
			return 1;
		}	
		else
		{
			printf("错误:超出链表长度\n");
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}	
}
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
int nodedelete(N *head,int local) 
{
		N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
			//先将a指针指向删除位置之前的节点;
		for(i=0;i<local-1;i++)
		{
			a=a->next;
		}
		if(listlength(head)>=local)
		{
			//需要判断删除位置是否为表尾;
			if(a->next!=NULL) 
			{
				p=a;
				p=p->next;
				a->next=p->next;
				printf("删除元素为:%c \n",p->data);
				free(p);
			}
			else
			{
				printf("删除元素为:%c \n",a->next->data);
				free(a->next);
				a->next=NULL;
			}
			return 1;
		}
		else
		{
			printf("错误:超出链表长度\n");
			return 0;
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}
}
int update(N *head,datatype x,int local) 
{
		N *a=head,*p=NULL;
	int i;
	if(head!=NULL)
	{
		for(i=0;i<local;i++)
		{
			a=a->next;
		}
		if(listlength(head)>=local)
		{
			printf("修改位置为:%d修改前元素的值为:%c\n",local,a->data);
			a->data=x;
			printf("修改成功,修改后的值为:%c\n",a->data);
		}
		else
		{
			printf("错误:超出链表长度\n");
			return 0;
		}
	}
	else
	{
		printf("错误:头地址有误\n");
		return 0;
	}
}
void main_meun()
{
	printf("------------------------\n");
	printf("\t\t1.创建链表\n");
	printf("\t\t2.输入链表\n");
	printf("\t\t3.插入元素(前插位置输入0)\n");
	printf("\t\t4.删除元素\n");
	printf("\t\t5.修改元素\n");
	printf("\t\t6.链表排序(默认从小到大,仅交换值)\n");
	printf("\t\t0.退出\n");
	printf("\t\t请输入菜单号1~5\n");
	printf("------------------------\n");
}
void sort(N *head)
{
		//采用双指针,采用冒泡排序的方法
		if(head!=NULL)
		{
			if(listlength(head)>1)
			{
					N *p=head->next,*q;
				while(p!=NULL) //外层循环
				{
					q=head->next;
					while(q->next!=NULL)
					{
						if(q->data>=q->next->data)
						{
							datatype x=q->next->data;	
							q->next->data=q->data;
							q->data=x;
						}
						q=q->next;	
					}
					p=p->next;
				}
			}
			else
			{
				printf("空表或表长为1,不需要排序\n");
			}
		}
		else
		{
			printf("错误:头地址有误\n");
		}
	
}
int main()
{
	int meun=1;
		N *head=NULL;
		head->next=NULL;
	while(meun)
	{
		main_meun();
		scanf("%d",&meun);
			datatype x=NULL;
			int n=NULL;
		switch(meun)
		{
			getchar();
			case 0:
				return 0;
			break;
			case 1:
			head=creatlist();
			break;
			case 2:
				output(head);
				printf("\n");
			break;
			case 3:
				printf("请输入插入位置:");
				scanf("%d",&n);
				getchar();
				printf("请输入插入的值:");
				scanf("%c",&x);
				insert(head,x,n);
			break;
			case 4:
				printf("请输入删除位置:");
				scanf("%d",&n);
				nodedelete(head,n);
			break;
			case 5:
				printf("请输入修改位置:");
				scanf("%d",&n);
				getchar();
				printf("请输入修改的值:");
				scanf("%c",&x);
				update(head,x,n);
			break;
			case 6:
				sort(head);
			break;
		}
	}
}
```


## Golang

> 还没有写完

```golang
package main

import "fmt"

type Element int64
// 节点定义
type ListNode struct {
	data Element		// 首节点中data表示为链表的长度
	next *ListNode
}

// 函数接口
type List interface {
	Add(head *ListNode, new Element)				// 添加元素
	Delete(head *ListNode, index int) Element		// 删除指定节点, 并返回删除节点的值
	Insert(head *ListNode, index Element, data Element)	// 插入指定节点
	GetLength(head *ListNode) Element				// 获取链表长度
	Search(head *ListNode, data Element) int		// 查询元素所在位置
	GetData(head *ListNode, index int) Element		// 获取指定位置的元素
}

// 添加元素
func Add(head *ListNode, new Element) {
	point := head

	// 找到尾节点
	for nil != point.next {
		point = point.next
	}

	var node ListNode
	node.data = new
	point.next = &node

	head.data++
}

// 删除指定节点, 并返回删除节点的值
func Delete(head *ListNode, index int) Element {
	// index是以0为起始
	point := head

	// 找到要删除的下标的前一个
	for nil != point.next && 0 < index {
		point = point.next
		index--
	}

	data := point.next.data
	point.next.data = 0
	point.next = point.next.next

	head.data--
	return data
}

// 插入指定节点
func Insert(head *ListNode, index Element, data Element) {

	if 0 > index || head.data < index {
		fmt.Println("Please check index")
	}
	point := head

	// 找到指定位置的前一个节点
	for nil != point.next && 0 < index {
		point = point.next
		index--
	}

	var node ListNode
	node.data = data
	node.next = point.next.next
	point.next = &node

	head.data++
}

// 获取链表长度
func GetLength(head *ListNode) Element {
	point := head
	head.data = 0
	// 头节点不算在内

	for nil != point.next {
		point = point.next
		head.data++
	}

	return head.data
}

// 查询元素所在位置
func Search(head *ListNode, data Element) int {
	point := head
	num := -1

	for data != point.data {
		point = point.next
		num++
	}

	return num
}

// 获取指定位置的元素
func GetData(head *ListNode, index int) Element {
	point := head

	for nil != point.next && 0 < index {
		point = point.next
		index--
	}

	return point.data
}

func Traverse(head *ListNode) {
    point := head
    for point.next != nil {
        fmt.Println(point.next.data)
        point = point.next
    }
	fmt.Println("Traverse OK!")
	fmt.Println("\n\n")
}


func main() {
	var head ListNode = ListNode{data: 0, next: nil}
	var Array []Element = []Element {1, 2, 3, 4, 5, 6, 7, 8}
	for _, v := range Array {
		Add(&head, v)
	}
	Traverse(&head)

	fmt.Println(Delete(&head, 4))	// 531
	Traverse(&head)
	fmt.Println(Search(&head, 2))
	Insert(&head, 6, 124123)
	Traverse(&head)
	fmt.Println(GetData(&head, 6))
	fmt.Println(GetLength(&head))
}

```
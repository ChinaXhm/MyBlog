---
title: "Array"
date: 2019-12-12T21:26:24+08:00
draft: true
tags: ["数据结构", "Array"]
---

# 前言

> 数组是最基本的数据结构, 基本上所有的编程语言都自带数组的使用, 数组是线性表的顺序存储结构, 线性表是逻辑上的, 顺序存储是物理上的, 数组使用起来很方便, 有它的优点, 但是也有它的缺点, 优点是可以根据下标得到和删除元素, 但是很难插入元素, 接下来我们来看看数组的操作, 分两个版本, C和Golang

## C
> 增加(插入)
>> 1.在数组末尾添加元素
```c
int add(int nums[],int *numsSize,int value)//直接放在数组最后面 
{
	nums[*numsSize]=value;
	*numsSize+=1;
	return *numsSize;
}
```
>>2.在数组某位置(下标位置)添加
```c
int insert(int nums[],int *numsSize,int index,int value)//指定插入下标位置 
{

    	int i=0;
	if(index<0||index>*numsSize)
	{
		return 0;
	}
	for(i=*numsSize;i>=index;i--)//首先index 值后的元素全部后移，从最后一个元素开始
	//然后index位置插入值; 
	{
		nums[i+1]=nums[i];
	}
	nums[index]=value;
	*numsSize+=1;//*numsSize++,自加一优先级比*高 
	return 1;
}
```

---

## Golang
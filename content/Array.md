---
title: "数组增删查"
date: 2019-12-12T21:26:24+08:00
draft: true
tags: ["标签", "", ""]
---


>增加(插入)
>>1.在数组末尾添加元素
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

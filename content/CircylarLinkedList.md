---
title: "CircylarLinkedList"
date: 2019-12-22T00:07:20+08:00
draft: true
tags: ["单向循环链表", "数据结构"]
---


# 单向循环链表

## Golang

```golang
/**
 * Golang版循环链表
 * 在循环链表中, 头节点不再特殊, 其值不再为长度, 索引不再为-1, 而是从0开始计数
 */

package main

import "fmt"

type Element int64
// 节点定义
type ListNode struct {
	data Element		// 头节点中data表示为链表的长度
	next *ListNode
}

// 函数接口
type List interface {
	Add(head *ListNode, new Element)				// 链表尾部添加元素
	Delete(head *ListNode, index int) Element		// 删除指定节点, 并返回删除节点的值
	Insert(head *ListNode, index Element, data Element)	// 插入指定节点
	GetLength(head *ListNode) Element				// 获取链表长度
	Search(head *ListNode, data Element) int		// 查询元素所在位置
	GetData(head *ListNode, index int) Element		// 获取指定位置的元素
}
func Add(head *ListNode, new Element) {
	if nil == head.next {
		var node ListNode
		node.data = new
		node.next = head
		head.next = &node
		return
	}

	point := head
	for head != point.next {
		point = point.next
	}

	var node ListNode
	node.data = new
	node.next = head
	point.next = &node
}

func Delete(head *ListNode, index int) Element {
	point := head

	for 1 < index {
		point = point.next
		index--
	}

	data := point.next.data
	point.next = point.next.next

	return data
}

func Insert(head *ListNode, index Element, data Element) {
	point := head
	for 1 < index {
		point = point.next
		index--
	}

	var node ListNode
	node.data = data
	node.next = point.next
	point.next = &node
}

func GetLength(head *ListNode) Element {
	point := head

	var data Element = 1
	for head != point.next {
		point = point.next
		data++
	}

	return data
}

func Search(head *ListNode, data Element) int {
	if data == head.data {
		return 0
	}

	var pivet int = 1
	point := head.next
	for head != point && data != point.data {
		point = point.next
		pivet++
	}

	return pivet
}

func GetData(head *ListNode, index int) Element {
	if 0 == index {
		return head.data
	}
	point := head.next

	for head != point && 1 < index {
		point = point.next
		index--
	}

	return point.data
}

func Traverse(head *ListNode) {
	point := head
	for head != point.next {
		fmt.Println(point.data)
		point = point.next
	}
	fmt.Println(point.data)
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

	fmt.Println(Delete(&head, 7))
	Traverse(&head)

	Insert(&head, 17, 1234)
	Traverse(&head)

	fmt.Println(GetLength(&head))

	fmt.Println(Search(&head, 8))
	fmt.Println(GetData(&head, 10))
}

```


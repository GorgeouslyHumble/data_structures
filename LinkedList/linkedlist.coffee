class MakeNode
  constructor: (value)->
    @value = value
    @next = null

class LinkedList
  constructor: ->
    @head = null
    @tail = null
  addToHead: (value)->
    node = new MakeNode(value)
    unless @head
      @tail = node
      @head = node
    else
      node.next = @head
      @head = node
  removeHead: ->
    @head = @head.next
  addToTail: (value)->
    node = new MakeNode(value)
    unless @tail
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
  removeTail: (node=@head)->
    if node.next == @tail
      @tail = node
      @tail.next = null
    else if node.next
      return this.removeTail(node.next)
  contains: (value, node=@head)->
    if node.value == value
      return true
    else if node.next
      return this.contains(value, node.next)
    return false

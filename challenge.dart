//first sol. for challenge 1 in stack.
void printListInReverse(List<int> list) {
  var stack = List<int>.from(list);
  stack = stack.reversed.toList();

  print("Original List: $list");
  print("Reversed List: $stack");
}

//another solution for the first challenge in stack:
void printInReverse<E>(List<E> list) {
  var st = Stack<E>();

  for (E value in list) {
    st.push(value);
  }

  while (!st.isEmpty) {
    print(st.pop());
  }
}

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  bool get isEmpty => _storage.isEmpty;
}

//solution of challenge 2 in stack:
bool arePair(String open, String close) {
  if (open == '(' && close == ')') {
    return true;
  } else if (open == '{' && close == '}') {
    return true;
  } else if (open == '[' && close == ']') {
    return true;
  } else
    return false;
}

bool isValid(String s) {
  var st = <String>[];
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
      st.add(s[i]);
    } else if (s[i] == ')' || s[i] == '}' || s[i] == ']') {
      if (st.isEmpty || !arePair(st.last, s[i])) {
        return false;
      }
      st.removeLast();
    }
  }
  return st.isEmpty;
}

//solution of challenge 1 Linkedlist:

class ListNode {
  //create a node class
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

//the required function:
void reverseListAndPrint(ListNode? head) {
  ListNode? next;
  ListNode? prev = null;
  ListNode? current = head;

  while (current != null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  // Print the reversed list
  current = prev;
  while (current != null) {
    print(current.val);
    current = current.next;
  }
}

//challenge 2 in linkedlist:
ListNode? middleNode(ListNode? head) {
  ListNode? fast = head;
  ListNode? slow = head;
  while (fast != null && fast.next != null) {
    fast = fast.next?.next;
    slow = slow?.next;
  }

  return slow;
}

//challenge 3 in linkedlist:
ListNode? reverseList(ListNode? head) {
  ListNode? prev = null;
  ListNode? current = head;
  ListNode? next;

  while (current != null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  return prev;
}

//challenge 4 in linkedlist:
ListNode? removeAllOccurrences(ListNode? head, int target) {
  // Handle the case where the target is at the beginning of the list
  while (head != null && head.val == target) {
    head = head.next;
  }

  // Traverse the list and remove occurrences of the target
  var current = head;
  var prev = head;

  while (current != null) {
    if (current.val == target) {
      prev?.next = current.next;
    } else {
      prev = current;
    }
    current = current.next;
  }

  return head;
}

void printList(ListNode? head) {
  var current = head;
  while (current != null) {
    print(current.val);
    current = current.next;
  }
}

void main() {
  var myList = [1, 2, 3, 4, 5];

//call the first function solution -> 1, challenge -> 1:
  printListInReverse(myList);

  //call the first function solution -> 2, challenge -> 1:
  List<int> li = [1, 2, 3, 4, 5, 6];
  printInReverse(li);

  //challenge 2

  print(isValid("(){}[]")); // Output: true
  print(isValid("({[]})")); // Output: true
  print(isValid("({[})")); // Output: false
  print(isValid("({")); // Output: false
  print(isValid("({)")); // Output: false
  print(isValid("()")); // Output: true

//challenge 1 in  linkedlist:
  var node1 = ListNode(1);
  var node2 = ListNode(2);
  var node3 = ListNode(3);
  var node4 = ListNode(4);
  var node5 = ListNode(5);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;

  print("Original List:");
  ListNode? current = node1;
  while (current != null) {
    print(current.val);
    current = current.next;
  }

  print("\nReversed List:");
  reverseListAndPrint(node1);

//call function of challenge 2 in LinkedList:
  var n1 = ListNode(1);
  var n2 = ListNode(2);
  var n3 = ListNode(3);
  var n4 = ListNode(4);
  var n5 = ListNode(5);

  n1.next = n2;
  n2.next = n3;
  n3.next = n4;
  n4.next = n5;
  var middle = middleNode(n1);

  print("Middle Node Value: ${middle?.val}");

  //challenge 4 in linkedlist:
  var nd1 = ListNode(1);
  var nd2 = ListNode(2);
  var nd3 = ListNode(3);
  var nd4 = ListNode(2);
  var nd5 = ListNode(4);
  var nd6 = ListNode(5);
  var nd7 = ListNode(2);

  nd1.next = nd2;
  nd2.next = nd3;
  nd3.next = nd4;
  nd4.next = nd5;
  nd5.next = nd6;
  nd6.next = nd7;

  print("Original List:");
  printList(nd1);

  var targetValue = 2;
  var modifiedList = removeAllOccurrences(nd1, targetValue);

  print("\nList after removing all occurrences of $targetValue:");
  printList(modifiedList);
}

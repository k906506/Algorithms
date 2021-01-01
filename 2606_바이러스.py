def find(node):
    visit = []
    queue = []
    queue.append(1)
    
    while queue:
        element = queue.pop(0)
        if element not in visit:
            visit.append(element)
            queue.extend(node[element])
    if 1 in visit:
        visit.remove(1)
    return visit

def main():
    computer = int(input())
    connect = int(input())
    
    node = dict()
    
    for i in range (1, computer+1):
        node[i] = []
        
    for _ in range(connect):
        a, b = map(int, input().split())
        if b not in node[a]:
            node[a].append(b)
        if a not in node[b]:
            node[b].append(a)
    
    print(len(find(node)))

if __name__ == "__main__":
    main()
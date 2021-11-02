import sys
from collections import deque

def bfs(vertex, visited, start):
    queue = deque()
    queue.append(start)
    visited[start] = 1

    while queue:
        current = queue.popleft()
        for element in vertex[current]:
            if visited[element] == 0:
                visited[element] = -visited[current]
                queue.append(element)
            elif visited[current] + visited[element] != 0:
                return False
    return True

def main():
    n = int(input())

    for _ in range(n):
        v, e = map(int, input().split())

        vertex = [[] for _ in range(v+1)]
        visited = [0 for _ in range(v+1)]

        check = True
        for _ in range(e):
            src, dst = map(int, sys.stdin.readline().split())
            vertex[src].append(dst)      
            vertex[dst].append(src)
        
        for i in range(v):
            if visited[i+1] == 0:
                if bfs(vertex, visited, i+1) == False:
                    check = False
                    break
        
        if check:
            print("YES")
        else:
            print("NO")

if __name__ == "__main__":
    main()

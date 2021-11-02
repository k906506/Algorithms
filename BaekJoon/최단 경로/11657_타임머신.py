import sys

INF = float('inf')

def bellManFord(n, m, node):
    distance = [INF for _ in range(n+1)]
    distance[1] = 0

    for _ in range(n-1):
        for i in range(1, n+1):
            for element in node[i]:
                if distance[element[0]] > distance[i] + element[1]:
                    distance[element[0]] = distance[i] + element[1]

    for i in range(1, n+1):
        for element in node[i]:
            if distance[element[0]] > distance[i] + element[1]:
                return -1   
    
    return distance

def main():
    n, m = map(int, input().split())

    node = [[] for _ in range(n+1)]

    for i in range(m):
        u, v, w = map(int, sys.stdin.readline().split())
        node[u].append([v, w])
    
    result = bellManFord(n, m, node)
    
    if result == -1:
        print(-1)
    else:
        for i in range(2, n+1):
            if result[i] != INF:
                print(result[i])
            else:
                print(-1)

if __name__ == "__main__":
    main()
import sys
import heapq
INF = float('inf')

def dijkstra(path, v, e, src, result):
    queue = []
    distance = [INF for _ in range(v+1)]
    visited = [False for _ in range(v+1)]

    heapq.heappush(queue, (0, src)) # 거리와 현재 좌표 -> heapq를 이용할 것이므로 거리를 앞에 저장.
    
    while queue:
        current = heapq.heappop(queue)
        if visited[current[1]]:
            continue
        for element in path[current[1]]:
            if distance[element[0]] > current[0] + element[1]:
                distance[element[0]] = current[0] + element[1]
                heapq.heappush(queue, (distance[element[0]], element[0]))
        
        visited[current[1]] = True

    print(distance)
    if distance[src] < result:
        result = distance[src]


def main():
    v, e = map(int, sys.stdin.readline().split())
    path = [[] for _ in range(v+1)]

    for _ in range(e):
        src, dst, dist = map(int, sys.stdin.readline().split())
        path[src].append((dst, dist))
    
    result = INF
    for i in range(1, v+1):
        dijkstra(path, v, e, i, result)
    
    if result == INF:
        print(-1)
    else:
        print(result)

if __name__ == "__main__":
    main()

''' 아래 코드는 플로이드 와샬로
import sys
INF = float('inf')


def floyedWashall(path, v):
    for k in range(1, v + 1):
        for i in range(1, v + 1):
            for j in range(1, v + 1):
                if path[i][j] > path[i][k] + path[k][j]:
                    path[i][j] = path[i][k] + path[k][j]

    return path


def main():
    v, e = map(int, sys.stdin.readline().split())
    path = [[INF for _ in range(v + 1)] for _ in range(v + 1)]

    for _ in range(e):
        src, dst, dist = map(int, sys.stdin.readline().split())
        path[src][dst] = dist

    path = floyedWashall(path, v)

    result = INF
    for i in range(1, v + 1):
        result = min(result, path[i][i])

    if result == INF:
        print(-1)
    else:
        print(result)


if __name__ == "__main__":
    main()

'''

    
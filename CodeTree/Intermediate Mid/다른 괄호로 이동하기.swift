from heapq import heappush, heappop
import sys

INF = float('inf')
input = sys.stdin.readline

def dijkstra(src):
    resetArray()

    dists[src] = 0

    heap = []
    heappush(heap, (0, src))

    while heap:
        dist, current = heappop(heap)

        if visited[current]: continue # 이미 방문한 정점인 경우 패스

        for next, nextDist in graphs[current]:
            if dists[next] > dists[current] + nextDist:
                dists[next] = dists[current] + nextDist
                heappush(heap, (dists[next], next))
        
        visited[current] = True

    return dists[1:] # 최단 거리 반환

def resetArray():
    for i in range(n**2 + 1):
        visited[i] = False

    for i in range(n**2 + 1):
        dists[i] = INF

if __name__ == "__main__":
    n, a, b = list(map(int, input().split()))

    boards = [
        list(input().rstrip())
        for _ in range(n)
    ]

    dists = [INF for _ in range(n**2 + 1)]
    visited = [False for _ in range(n**2 + 1)]
    vertexs = [[0 for _ in range(n)] for _ in range(n)]
    graphs = [[] for _ in range(n**2 + 1)] # 1 ~ N^2 노드가 존재

    cnt = 1
    for i in range(n):
        for j in range(n):
            vertexs[i][j] = cnt
            cnt += 1

    dx = [-1, 0, 1, 0]
    dy = [0, 1, 0, -1]

    for i in range(n):
        for j in range(n):
            for k in range(4):
                nx = i + dx[k]
                ny = j + dy[k]

                if 0 <= nx < n and 0 <= ny < n:
                    v1 = vertexs[i][j]
                    v2 = vertexs[nx][ny]
                    dist = a if boards[i][j] == boards[nx][ny] else b # 같은 기호이면 a시간, 다르면 b시간

                    graphs[v1].append([v2, dist])

    ans = 0

    for i in range(1, n**2 + 1):
        result = dijkstra(i)
        ans = max(ans, max(result))

    print(ans)
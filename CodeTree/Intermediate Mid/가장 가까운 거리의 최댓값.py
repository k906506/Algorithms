# 정점이 10만, 간선이 10만이므로 O(V^2)은 시간 초과가 발생한다. 
# 따라서, O(ElogV)로 접근한다.
from heapq import heappush, heappop
import sys

INF = float('inf')
input = sys.stdin.readline

def dijkstra(src):
    resetArray() # 배열 초기화

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
    for i in range(n):
        dists[i] = INF

    for i in range(n):
        visited[i] = False

if __name__=="__main__":
    n, m = list(map(int, input().split()))
    a, b, c = list(map(int, input().split()))
    graphs = [[] for _ in range(n + 1)]
    dists = [INF for _ in range(n + 1)]
    visited = [False for _ in range(n + 1)]
    result = []

    for i in range(m):
        src, dst, dist = list(map(int, input().split()))

        graphs[src].append([dst, dist])
        graphs[dst].append([src, dist])

    result.append(dijkstra(a))
    result.append(dijkstra(b))
    result.append(dijkstra(c))

    ans = 0
    
    for i in range(n):
        ans = max(ans, min(min(result[0][i], result[1][i]), result[2][i]))

    print(ans)
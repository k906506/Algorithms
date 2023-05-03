from heapq import heappush, heappop
import sys 

INF = 1e9
input = sys.stdin.readline # 빠른 입출력

n, m = list(map(int, input().split()))
k = int(input()) # 시작 정점
graphs = [[] for _ in range(n + 1)] # 1번부터 시작
visited = [False for _ in range(n + 1)] # 방문 여부
dists = [INF for _ in range(n + 1)] # 최단 거리 테이블

for _ in range(m):
    src, dst, dist = list(map(int, input().split()))

    graphs[src].append([dist, dst]) # 거리, 도착 지점
    graphs[dst].append([dist, src]) # 양방향 그래프

dists[k] = 0
heap = [[0, k]]

while heap:
    currentDist, current = heappop(heap)

    if visited[current]: continue # 이미 방문한 정점

    for nextDist, next in graphs[current]:
        if dists[next] > currentDist + nextDist: # 현재 정점을 거쳐가는 거리가 더 짧을 경우 갱신
            dists[next] = currentDist + nextDist
            heappush(heap, [dists[next], next]) # 힙에 삽입

    visited[current] = True

for dist in dists[1:]:
    print(-1 if dist == INF else dist)
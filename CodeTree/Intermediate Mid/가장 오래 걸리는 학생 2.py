# 특정 정점에서 다른 모든 정점으로 이동하는 것이 아닌
# 다른 모든 정점에서 특정 정점으로 이동하는 문제
# 하지만 기존 다익스트라 문제를 뒤집으면 해결 가능

from heapq import heappush, heappop
import sys 

INF = 1e9
input = sys.stdin.readline # 빠른 입출력

n, m = list(map(int, input().split()))
graphs = [[] for _ in range(n + 1)] # 1번부터 시작
visited = [False for _ in range(n + 1)] # 방문 여부
dists = [INF for _ in range(n + 1)] # 최단 거리 테이블

for _ in range(m):
    src, dst, dist = list(map(int, input().split()))
    graphs[dst].append([dist, src]) # 거리, 도착 지점

dists[n] = 0 # n은 학교
heap = [[0, n]]

while heap:
    currentDist, current = heappop(heap)

    if visited[current]: continue # 이미 방문한 정점

    for nextDist, next in graphs[current]:
        if dists[next] > currentDist + nextDist: # 현재 정점을 거쳐가는 거리가 더 짧을 경우 갱신
            dists[next] = currentDist + nextDist
            heappush(heap, [dists[next], next]) # 힙에 삽입

    visited[current] = True

ans = 0
for dist in dists[1:]:
    if dist != INF and dist > ans:
        ans = dist

print(ans)
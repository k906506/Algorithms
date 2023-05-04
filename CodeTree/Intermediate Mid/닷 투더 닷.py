from heapq import heappush, heappop

INF = float('inf')

def dijkstra(src):
    heap = []

    heappush(heap, (0, 0, INF, src)) # 수식에 의해 계산된 값, l, c, vertex
    dists[src] = 0

    while heap:
        dist, current_l, current_c, current = heappop(heap)

        if visited[current]: continue

        for next, next_l, next_c in graphs[current]:
            if dists[next] > current_l + next_l + x // min(current_c, next_c):
                dists[next] = current_l + next_l + x // min(current_c, next_c)
                heappush(heap, (current_l + next_l + x // min(current_c, next_c), current_l + next_l, min(current_c, next_c), next))

        visited[current] = True

    print(dists[n])

if __name__ == "__main__":
    n, m, x = list(map(int, input().split()))

    graphs = [[] for _ in range(n + 1)]
    dists = [INF for _ in range(n + 1)]
    visited = [False for _ in range(n + 1)]

    for _ in range(m):
        src, dst, l, c = list(map(int, input().split()))

        graphs[src].append([dst, l, c])
        graphs[dst].append([src, l, c])

    dijkstra(1)
import sys
import heapq

def mst(numbers, visited):
    queue = []
    distance = 0

    heapq.heappush(queue, (0, 1)) # 가중치, 출발 지점
    while queue:
        dist, current = heapq.heappop(queue)
        if visited[current]:
            continue
        visited[current] = True
        distance += dist
        for next in numbers[current]:
            if visited[next[1]]:
                continue
            heapq.heappush(queue, (next[0], next[1]))

    return distance

def main():
    n, m = map(int, input().split())
    numbers = [[] for _ in range(n+1)]
    visited = [False for _ in range(n+1)]

    for _ in range(m):
        src, dst, dist = map(int, sys.stdin.readline().split())
        numbers[src].append((dist, dst))
        numbers[dst].append((dist, src))

    print(mst(numbers, visited))

if __name__ == "__main__":
    main()
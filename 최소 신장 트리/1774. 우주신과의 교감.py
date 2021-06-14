import sys
import math
import heapq


def distance(src_x, src_y, dst_x, dst_y):
    return math.sqrt((src_x - dst_x) ** 2 + (src_y - dst_y) ** 2)


def prim(dists, n):
    visited = [False for _ in range(n)]
    queue = []
    sum = 0
    heapq.heappush(queue, [0, 0])

    while queue:
        dist, current = heapq.heappop(queue)
        if visited[current]:
            continue
        for next_dist, next in dists[current]:
            heapq.heappush(queue, [next_dist, next])
        sum += dist
        visited[current] = True

    print(format(sum, ".2f"))


def main():
    n, m = map(int, input().split())
    god = []
    already = dict()

    for _ in range(n):
        x, y = map(int, sys.stdin.readline().split())
        god.append([x, y])

    for _ in range(m):
        x, y = map(int, sys.stdin.readline().split())
        already[(x - 1, y - 1)] = 1

    dists = [[] for _ in range(n)]
    for i in range(n):
        for j in range(i + 1, n):
            if already.get((i, j)) is None:
                dist = distance(god[i][0], god[i][1], god[j][0], god[j][1])
            else:
                dist = 0

            dists[i].append([dist, j])
            dists[j].append([dist, i])

    prim(dists, n)


if __name__ == "__main__":
    main()

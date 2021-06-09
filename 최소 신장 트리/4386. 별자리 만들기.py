import math
import heapq
import sys


def find(info, n):
    visited = [False for _ in range(n)]
    sum = 0
    queue = []
    heapq.heappush(queue, [0, 0])  # 거리, 시작지점

    while queue:
        dist, current = heapq.heappop(queue)
        if visited[current]:
            continue
        for value, dst in info[current]:
            heapq.heappush(queue, [value, dst])
        sum += dist
        visited[current] = True

    return round(sum, 2)


def betweenLength(src_x, src_y, dst_x, dst_y):
    return math.sqrt((dst_x - src_x) ** 2 + (dst_y - src_y) ** 2)


def main():
    n = int(input())
    info = [[] for _ in range(n)]
    stars = []

    for _ in range(n):
        x, y = map(float, sys.stdin.readline().split())
        stars.append((x, y))

    for i in range(n):
        for j in range(i + 1, n):
            length = betweenLength(stars[i][0], stars[i][1], stars[j][0], stars[j][1])
            info[i].append([length, j])
            info[j].append([length, i])

    print(find(info, n))


if __name__ == "__main__":
    main()

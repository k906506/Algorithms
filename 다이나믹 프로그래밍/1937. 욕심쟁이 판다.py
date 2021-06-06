import sys


def main():
    n = int(input())
    bamboos = [[] for _ in range(n)]
    days = [[0 for _ in range(n)] for _ in range(n)]
    items = []
    ans = 0

    for i in range(n):
        bamboos[i] = list(map(int, sys.stdin.readline().split()))

    for i in range(n):
        for j in range(n):
            items.append((bamboos[i][j], i, j))

    items.sort(reverse=True)

    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    for e in items:
        value, x, y = e
        queue = []

        for k in range(4):
            nx = x + dx[k]
            ny = y + dy[k]
            if nx >= 0 and nx < n and ny >= 0 and ny < n and bamboos[nx][ny] > value:  # 다음 지점이 현재 지점보다 큰 경우
                queue.append(days[nx][ny])

        if len(queue) != 0:  # 더 큰 원소가 있는 경우
            days[x][y] = max(queue) + 1

        ans = max(ans, days[x][y])

    print(ans + 1)

if __name__ == "__main__":
    main()

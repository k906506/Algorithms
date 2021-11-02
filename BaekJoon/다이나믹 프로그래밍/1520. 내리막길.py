import sys
import heapq


def find(maps, dp, visited, n, m):
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    queue = []

    heapq.heappush(queue, (maps[0][0], 0, 0))
    visited[0][0] = True
    dp[0][0] = 1

    while queue:
        count, x, y = heapq.heappop(queue)
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx < n and 0 <= ny < m:
                if maps[x][y] > maps[nx][ny]:  # 다음 방문할 지점의 값이 현재의 위치보다 작은 경우
                    dp[nx][ny] += dp[x][y]
                    if not visited[nx][ny]:    # 방문하지 않았을 때만 큐에 넣어준다
                        visited[nx][ny] = True
                        heapq.heappush(queue, (-maps[nx][ny], nx, ny))

    return dp[n - 1][m - 1]


def main():
    n, m = map(int, input().split())
    maps = [[] for _ in range(n)]
    dp = [[0 for _ in range(m)] for _ in range(n)]
    visited = [[False for _ in range(m)] for _ in range(n)]

    for i in range(n):
        maps[i] = list(map(int, sys.stdin.readline().split()))

    print(find(maps, dp, visited, n, m))


if __name__ == "__main__":
    main()

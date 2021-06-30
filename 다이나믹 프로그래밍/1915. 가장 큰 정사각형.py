import sys


def main():
    n, m = map(int, input().split())
    squares = []

    for _ in range(n):
        squares.append(list(map(int, sys.stdin.readline().rstrip())))

    dp = squares.copy()

    ans = 0
    for i in range(n):
        ans = max(ans, dp[i][0])

    for i in range(m):
        ans = max(ans, dp[0][i])

    for i in range(1, n):
        for j in range(1, m):
            if squares[i][j] == 1:
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                ans = max(ans, dp[i][j])

    print(ans * ans)


if __name__ == "__main__":
    main()

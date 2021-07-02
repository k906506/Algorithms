INF = float('inf')

import sys


def main():
    t = int(input())
    for _ in range(t):
        n = int(sys.stdin.readline())
        dp = [[INF for _ in range(n)] for _ in range(n)]  # 최소값을 저장할 dp
        sum = [0 for _ in range(n)]
        numbers = list(map(int, sys.stdin.readline().rstrip().split()))

        for i in range(n):  # 자기 자신
            dp[i][i] = numbers[i]

        for i in range(n - 1):
            sum[i + 1] = sum[i] + numbers[i]

        for i in range(1, n):
            for j in range(n - i):
                r = i + j
                for k in range(j, r):
                    dp[j][r] = min(dp[j][r], dp[j][k] + dp[k + 1][r]) + sum[r - 1] - sum[j - 1]

        print(dp)


if __name__ == "__main__":
    main()

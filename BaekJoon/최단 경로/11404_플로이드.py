import sys

INF = float('inf')

def main():
    n = int(input())
    m = int(input())
    city = [[INF for _ in range(n+1)] for _ in range(n+1)]
    for i in range(m):
        src, dst, cost = map(int, sys.stdin.readline().split())
        if city[src][dst] > cost:
            city[src][dst] = cost

    for i in range(1, n+1):
        city[i][i] = 0

    dp = city

    for k in range(1, n+1):
        for i in range(1, n+1):
            for j in range(1, n+1):
                if dp[i][k] + dp[k][j] < city[i][j]:
                    dp[i][j] = dp[i][k] + dp[k][j]
    
    for i in range(1, n+1):
        for j in range(1, n+1):
            if dp[i][j] == INF:
                print(0, end = " ")
            else:
                print(dp[i][j], end = " ")
        print("")

if __name__ == "__main__":
    main()
def main():
    n, k = map(int, input().split())

    dp = [[0 for _ in range(n+1)] for _ in range(k+1)] # n을 k로 만들 수 있는 경우의 수

    for i in range(n+1):
        dp[1][i] = 1; # i를 1개로 만들 수 있는 경우의 수는 1개

    for i in range(2, k+1):
        for j in range(n+1):
            dp[i][j] = (dp[i][j-1] + dp[i-1][j]) % 1000000000

    print(dp[k][n])

if __name__ == "__main__":
    main()
# 아래에 있는 원소들 중에서 더 큰 원소를 택하면서 Bottom - Up
def solution(triangle):
    if len(triangle) == 1:
        return triangle[0][0]
    else:
        # 변수 선언
        n = len(triangle)
        dp = [[0 for i in range(n)] for i in range(n)]
        
        # 변수 초기화
        for i in range(n):
            dp[n - 1][i] = triangle[n - 1][i]
        
        # Bottom - Up
        for i in range(n - 2, -1, -1):
            for j in range(len(triangle[i])):
                dp[i][j] = triangle[i][j] + max(dp[i + 1][j], dp[i + 1][j + 1])

        return dp[0][0]
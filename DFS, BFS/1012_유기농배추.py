import sys
sys.setrecursionlimit(100000)

def dfs(map_list, n, m, x, y, count):
    map_list[x][y] = 0
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    for i in range(4):
        nx = x + dx[i]
        ny = y + dy[i]
        if nx >= 0 and nx < n and ny >= 0 and ny < m:
            if map_list[nx][ny] == 1:
                count = dfs(map_list, n, m, nx, ny, count+1)
    return count

def main():
    test_case = int(input())
    
    for _ in range(test_case):
        m, n, k = map(int, input().split()) # 가로, 세로, 배추 위치 개수
    
        map_list = [[0 for _ in range(m)] for _ in range(n)]
        
        for i in range(k):
            x, y = map(int, input().split())
            map_list[y][x] = 1
    
        result = []
         
        for i in range(n):
            for j in range(m):
                if map_list[i][j] == 1:
                    result.append(dfs(map_list, n, m, i, j, 1))
                
        print(len(result))
    
if __name__ == "__main__":
    main()
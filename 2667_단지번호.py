def dfs(map_list, n, count, x, y):
    map_list[x][y] = 0
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    for i in range(4):
        nx = x + dx[i]
        ny = y + dy[i]
        if nx >= 0 and nx < n and ny >= 0 and ny < n:
            if map_list[nx][ny] == 1:
                count = dfs(map_list, n, count+1, nx, ny)
    return count

def main():
    n = int(input())
    
    map_list = []
    
    for i in range(n):
        map_list.append(list(map(int,input())))
    
    result = []
    
    for i in range(n):
        for j in range(n):
            if map_list[i][j] == 1:
                result.append(dfs(map_list, n, 1, i, j))
    
    print(len(result))
    for i in sorted(result):
        print(i)

if __name__ == "__main__":
    main()
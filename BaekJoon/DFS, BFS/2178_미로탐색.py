def bfs(map_list, result, n, m):
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    
    result[0][0] = 1
    
    queue= []
    queue.append([0,0])
    
    while queue:
        x, y = queue.pop(0)
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if nx >= 0 and nx < n and ny >= 0 and ny < m:
                if map_list[nx][ny] == 1 and result[nx][ny] == 0:
                    queue.append([nx,ny])
                    result[nx][ny] = result[x][y] + 1
    
    return result[n-1][m-1]

def main():
    n, m = map(int, input().split())
    
    map_list = [list(map(int, input())) for _ in range(n)]
    result = [[0 for _ in range(m)] for _ in range(n)]
 
    print(bfs(map_list, result, n, m))
    
if __name__ == "__main__":
    main()
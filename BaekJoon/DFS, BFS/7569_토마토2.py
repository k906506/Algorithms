from collections import deque

def bfs(box, queue, m, n, h):   # 열, 행, 높이
    
    dx = [1, -1, 0, 0, 0, 0]
    dy = [0, 0, 1, -1, 0, 0]
    dz = [0, 0, 0, 0, 1, -1]
    
    count = -1
    
    while queue:
        count += 1
        for _ in range(len(queue)):
            x, y, z = queue.popleft()   # 높이, 행, 열
            for i in range(6):
                nx = x + dx[i]  # 높이
                ny = y + dy[i]  # 행
                nz = z + dz[i]  # 열
                if nx >= 0 and nx < h and ny >= 0 and ny < n and nz >= 0 and nz < m:
                    if box[nx][ny][nz] == 0:
                        box[nx][ny][nz] = box[x][y][z] + 1
                        queue.append([nx, ny, nz])

    for height in box:
        for row in height:
            for element in row:
                if element == 0:
                    return -1
            
    return count

def main():
    m, n, h = map(int, input().split())
    
    box = [[list(map(int, input().split())) for _ in range(n)] for _ in range(h)]
    
    queue = deque()
    
    for i in range(h):
        for j in range(n):
            for k in range(m):
                if box[i][j][k] == 1:
                    queue.append([i, j, k]) # 높이, 행, 열
                
    print(bfs(box, queue, m, n, h))
    
if __name__ == "__main__":
    main()
from collections import deque

def bfs(box, queue, n, m):
    
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    
    count = -1
    
    while queue:
        count += 1
        for _ in range(len(queue)):
            x, y = queue.popleft()
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]
                if nx >= 0 and nx < n and ny >= 0 and ny < m and box[nx][ny] == 0:
                        queue.append([nx, ny])
                        box[nx][ny] = box[x][y] + 1
                        
    for row in box:
        if 0 in row:
            return -1
            
    return count

def main():
    m, n = map(int, input().split())
    
    box = [list(map(int, input().split())) for _ in range(n)]
    
    queue = deque()
    
    for i in range(n):
        for j in range(m):
            if box[i][j] == 1:
                queue.append([i, j])
                
    print(bfs(box, queue, n, m))
    
if __name__ == "__main__":
    main()
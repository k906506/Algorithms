def dfs(map_list, visit, n, m):
    queue = []
    queue.append([0, 0, 1]) # 시작, 끝, 부술 수 있는 횟수
    
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    
    while queue:
        x, y, z = queue.pop(0) # 시작, 끝, 부술 수 있는 횟수

        if x == n-1 and y == m-1:
            return visit[x][y][z]
            
        for i in range(4): # 상, 하, 좌, 우를 탐색
            nx = x + dx[i]
            ny = y + dy[i]
            if nx >= 0 and nx < n and ny >= 0 and ny < m: # 범위 이내인 경우
                if map_list[nx][ny] == 1 and z == 1: # 이동할 곳이 벽이고 부술 수 있을 때
                    visit[nx][ny][0] = visit[x][y][z] + 1
                    queue.append([nx, ny, 0])
                elif map_list[nx][ny] == 0 and visit[nx][ny][z] == 0: # 이동할 곳이 벽이 아니고 방문하지 않은 경우
                    visit[nx][ny][z] = visit[x][y][z] + 1
                    queue.append([nx, ny, z])
            
    return -1

def main():
    n, m = map(int, input().split())

    map_list = [[] for _ in range(n)]
    visit = [[[0] * 2 for _ in range(m)] for _ in range(n)]
    visit[0][0][1] = 1

    for i in range(n):
        map_list[i] = list(map(int, input()))

    print(dfs(map_list, visit, n, m))

if __name__ == "__main__":
    main()
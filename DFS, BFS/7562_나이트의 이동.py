def bfs(visited, srt_x, srt_y, dst_x, dst_y, size):
    queue = []

    dx = [-2, -1, 1, 2, 2, 1, -1, -2] # 가능한 방향
    dy = [1, 2, 2, 1, -1, -2, -2, -1]

    queue.append((srt_x, srt_y))

    while queue:
        element = queue.pop(0)
        x = element[0]
        y = element[1]

        if x == dst_x and y == dst_y: # 목적지에 도착한 경우
            return visited[x][y]

        for i in range(8):
            nx = x + dx[i]
            ny = y + dy[i]

            if nx >= 0 and nx < size and ny >= 0 and ny < size: # 이동하려고 하는 좌표가 범위 이내일 때
                if visited[nx][ny] == 0:    # 방문하지 않은 좌표일 때
                    visited[nx][ny] = visited[x][y] + 1 # 이전 좌표까지의 횟수 + 1
                    queue.append((nx, ny))

def main():
    n = int(input())

    for _ in range(n):
        size = int(input())
        visited = [[0 for _ in range(size)] for _ in range(size)]
        srt_x, srt_y = map(int, input().split())
        dst_x, dst_y = map(int, input().split())
        print(bfs(visited, srt_x, srt_y, dst_x, dst_y, size))

if __name__ == "__main__":
    main()
    

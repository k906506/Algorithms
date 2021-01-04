MAX_SIZE = 100001

def bfs(srt, dst):
    queue = []
    visit = [0 for _ in range(MAX_SIZE)]  # 방문하지 않은 경우 0
    time = 0
    
    queue.append([srt, time])
    
    while queue:
        element, time = queue.pop(0)
        if element == dst:
            return time
        time += 1
        if element*2 < MAX_SIZE and visit[element*2] == 0:
            queue.append([element*2, time])
            visit[element*2] = 1
        if element-1 >= 0 and visit[element-1] == 0:
            queue.append([element-1, time])
            visit[element-1] = 1
        if element+1 < MAX_SIZE and visit[element+1] == 0:
            queue.append([element+1, time])
            visit[element+1] = 1
    return time

def main():
    n, k = map(int, input().split())
    
    print(bfs(n, k))
    
if __name__ == "__main__":
    main()
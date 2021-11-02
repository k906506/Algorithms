import heapq
import sys

INF = float('inf')

def dijkstra(node, V, E, start):
    distance = [INF] * (V+1)
    distance[start] = 0
    visit = [False] * (V+1)
    queue = []

    heapq.heappush(queue, [0, start])

    while queue:
        current_node = heapq.heappop(queue)
        if visit[current_node[1]] == True:
            continue
        for element in node[current_node[1]]:
            if distance[element[0]] > distance[current_node[1]] + element[1]: # 인접한 노드의 distance가 현재 노드 + 가중치보다 크면
                distance[element[0]] = distance[current_node[1]] + element[1]
                heapq.heappush(queue, [distance[element[0]], element[0]])
        visit[current_node[1]] = True

    return distance

def main():
    cnt = int(sys.stdin.readline())

    for _ in range(cnt):
        V, E, T = map(int, sys.stdin.readline().split())
        s, g, h = map(int, sys.stdin.readline().split())

        node = [[] for _ in range(V+1)]

        for _ in range(E):
            u, v, w = map(int, sys.stdin.readline().split())
            node[u].append([v, w])   # 출발, 도착, 가중치
            node[v].append([u, w])
    
        distance1 = dijkstra(node, V, E, s) # 시작점이 s인 다익스트라
        distance2 = dijkstra(node, V, E, g) # 시작점이 g인 다익스트라
        distance3 = dijkstra(node, V, E, h) # 시작점이 h인 다익스트라

        result = []
        for _ in range(T):
            dst = int(sys.stdin.readline())
            distance = min(distance1[g] + distance2[h] + distance3[dst], distance1[h] + distance3[g] + distance2[dst]) # 시작 -> g -> h -> 끝 / 시작 -> h -> g -> 끝
            if distance == INF:
                continue
            if distance == distance1[dst]:
                result.append(dst)
        
        result.sort()

        print(*result)

if __name__ == "__main__":
    main()

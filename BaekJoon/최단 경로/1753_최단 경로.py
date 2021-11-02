import heapq
import sys

INF = float('inf')

def dijkstra(node, V, E, start):
    visit = [False] * (V+1)
    distance = [INF] * (V+1)
    distance[start] = 0
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
    V, E = map(int, sys.stdin.readline().split())
    K = int(input())

    node = [[] for _ in range(V+1)]

    for i in range(E):
        u, v, w = map(int, sys.stdin.readline().split())
        node[u].append([v, w])   # 출발, 도착, 가중치

    distance = dijkstra(node, V, E, K)

    for i in range(1, V+1):
        if distance[i] == INF:
            print("INF")
        else:
            print(distance[i])
    
if __name__ == "__main__":
    main()

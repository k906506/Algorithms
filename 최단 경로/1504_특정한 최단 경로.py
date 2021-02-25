import heapq
import sys

INF = float('inf')

def dijkstra(node, V, E, start):
    distance = [INF] * (V+1)
    distance[start] = 0
    queue = []

    heapq.heappush(queue, [0, start])

    while queue:
        current_node = heapq.heappop(queue)
        for element in node[current_node[1]]:
            if distance[element[0]] > distance[current_node[1]] + element[1]: # 인접한 노드의 distance가 현재 노드 + 가중치보다 크면
                distance[element[0]] = distance[current_node[1]] + element[1]
                heapq.heappush(queue, [distance[element[0]], element[0]])

    return distance

def main():
    V, E = map(int, sys.stdin.readline().split())

    node = [[] for _ in range(V+1)]

    for i in range(E):
        u, v, w = map(int, sys.stdin.readline().split())
        node[u].append([v, w])   # 출발, 도착, 가중치
        node[v].append([u, w])
    
    v1, v2 = map(int, input().split())

    distance1 = dijkstra(node, V, E, 1) # 시작점이 1인 다익스트라
    distance2 = dijkstra(node, V, E, v1) # 시작점이 v1인 다익스트라
    distance3 = dijkstra(node, V, E, v2) # 시작점이 v2인 다익스트라

    # 시작 -> v1 -> v2 -> 끝 / 시작 -> v2 -> v1 -> 끝
    distance = min(distance1[v1] + distance2[v2] + distance3[V], distance1[v2] + distance3[v1] + distance2[V])
    
    if distance >= INF:
        print(-1)
    else:
        print(distance)

if __name__ == "__main__":
    main()

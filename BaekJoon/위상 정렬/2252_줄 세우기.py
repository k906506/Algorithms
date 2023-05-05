from collections import deque
import sys

input = sys.stdin.readline

def main():
    global n, m

    n, m = list(map(int, input().split()))

    graphs = [[] for _ in range(n + 1)]
    indegrees = [0 for _ in range(n + 1)]

    for _ in range(m):
        src, dst = list(map(int, input().split()))

        graphs[src].append(dst)
        indegrees[dst] += 1

    topologicalSort(graphs, indegrees)

def topologicalSort(graphs, indegrees):
    queue = deque()

    for i in range(1, n + 1):
        if indegrees[i] == 0:
            queue.append(i)

    while queue:
        current = queue.popleft()
        print(current, end =" ")

        for next in graphs[current]:
            indegrees[next] -= 1

            if indegrees[next] == 0:
                queue.append(next)

if __name__ == "__main__":
    main()
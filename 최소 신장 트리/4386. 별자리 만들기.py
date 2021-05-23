import sys
import math

def getParent(parents, i):
    if parents[i] == i:
        return i
    return getParent(parents, parents[i])

def unionParent(parents, a, b):
    parentA = getParent(parents, a)
    parentB = getParent(parents, b)
    if parentA > parentB: # B가 진짜 부모
        parents[a] = b
    else:
        parents[b] = a

def main():
    n = int(input())
    stars = []
    edges = []
    parents = [i for i in range(n)]

    for _ in range(n):
        x, y = map(float, sys.stdin.readline().split())
        stars.append((x, y))

    for i in range(n-1):
        for j in range(i+1, n):
            x = stars[i][0] - stars[j][0]
            y = stars[i][1] - stars[j][1]
            dist = math.sqrt(x**2 + y**2)
            edges.append((dist, i, j))

    edges.sort() # dist에 따라 오름차순으로 정렬
    print(edges)

    ans = 0
    for dist, i, j in edges:
        print(parents)
        if getParent(parents, i) != getParent(parents, j):
            print(parents)
            unionParent(parents, i, j)
            ans += dist

    print(dist)

if __name__ == "__main__":
    main()



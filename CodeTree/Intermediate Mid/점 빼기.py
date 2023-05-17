from sortedcontainers import SortedSet

n, m = list(map(int, input().split()))
s = SortedSet()

for _ in range(n):
    s.add(tuple(map(int, input().split())))

for _ in range(m):
    k = int(input())

    idx = s.bisect_left((k, -1))

    if idx == len(s):
        print("-1 -1")
    else:
        x, y = s[idx]
        print(x, y)
        s.pop(idx)
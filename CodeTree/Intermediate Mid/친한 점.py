# 1. 주어진 x 좌표보다 큰 점(upper bound)
# 2. 주어진 x 좌표와 같고, y 좌표보다 크거나 같은 점(lower bound)
from sortedcontainers import SortedSet

s = SortedSet()

n, m = list(map(int, input().split()))

for _ in range(n):
    x = tuple(map(int, input().split()))
    s.add(x)

for _ in range(m):
    x = tuple(map(int, input().split()))

    idx = s.bisect_left(x)

    # lower bound 값이 주어진 배열읠 길이와 같다면, 값을 찾을 수 없다는 의미
    if idx == n:
        print(-1, -1)
    else:
        print(s[idx])
# 주어지는 수가 중복 없이 주어진다면 힙을 사용하면 되지만
# 이 문제에서는 수가 중복되어서 존재
# 따라서 중복을 제거해줘야 함
from sortedcontainers import SortedSet

n, m = list(map(int, input().split()))
numbers = list(map(int, input().split()))

s = SortedSet()

for num in numbers:
    s.add(-1 * num)

for i in range(m):
    print(-1 * s[i], end = " ")
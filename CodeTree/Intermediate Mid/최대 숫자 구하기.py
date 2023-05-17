from sortedcontainers import SortedSet

n, m = list(map(int, input().split()))
removes = list(map(int, input().split()))

s = SortedSet() # TreeSet은 오름차순이 기본 정렬 (like 최대힙)

for i in range(1, m + 1):
    s.add(-1 * i)

for e in removes:
    s.discard(-1 * e)
    print(-1 * s[0])
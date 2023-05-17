# 주어진 번호보다 같거나 작은 의자만 앉을 수 있음
# 최대한 많은 살마이 의자에 앉기 위해서는 자기가 앉을 수 있는 의자 중에서 가장 큰 번호를 앉아야 함
# upper bound(더 큰 원소의 인덱스)를 통해 계산
from sortedcontainers import SortedSet

n, m = list(map(int, input().split()))
numbers = list(map(int, input().split()))

s = SortedSet()

for i in range(1, m + 1):
    s.add(i)

cnt = 0
for number in numbers:
    idx = s.bisect_right(number) # number보다 큰 원소의 위치를 탐색

    if idx == 0:
        break
    else:
        s.pop(idx - 1)
        cnt += 1

print(cnt)
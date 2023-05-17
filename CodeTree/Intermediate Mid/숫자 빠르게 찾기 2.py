from sortedcontainers import SortedSet

n, m = list(map(int, input().split()))
numbers = list(map(int, input().split()))

s = SortedSet(numbers)

for _ in range(m):
    num = int(input())
    index = s.bisect_left(num) # lowerBound

    if index >= n: # 배열의 길이보다 크면 해당 원소가 없다는 의미
        print(-1)
    else:
        print(numbers[index])
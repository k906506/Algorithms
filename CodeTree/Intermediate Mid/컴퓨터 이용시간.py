# [시작 지점, +1, 학생 번호]로 저장
from heapq import heappush, heappop

n = int(input())
infos = []
cpus = []
answer = [0 for _ in range(n)]

for i in range(n):
    points = list(map(int, input().split()))

    infos.append([points[0], 1, i])
    infos.append([points[1], -1, i])

for i in range(n):
    heappush(cpus, i + 1)

infos.sort(key = lambda x: -x[0])

while len(infos) > 0:
    points = infos.pop()

    if points[1] == 1:
        cpuIndex = heappop(cpus)
        answer[points[2]] = cpuIndex # cpu 사용
    else:
        heappush(cpus, answer[points[2]]) # cpu 반환

for e in answer:
    print(e, end = " ")
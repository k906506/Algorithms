from sortedcontainers import SortedSet

n = int(input())
infos = []

s = SortedSet()
isShowed = [False for i in range(n)]

for i in range(n):
    y, x1, x2 = list(map(int, input().split()))

    infos.append([x1, 1, y, i]) # 시작 지점, y, index
    infos.append([x2, -1, y, i]) # 종료 지점, y, index

infos.sort(key = lambda x: -x[0])

# 작은 좌표부터 탐색하되, y가 가장 작은 선분들(앞쪽에 있는 선분들)
while infos:
    points = infos.pop()

    if points[1] == 1:
        s.add((points[2], points[3]))
    else:
        s.remove((points[2], points[3]))

    if not s:
        continue
    
    _, index = s[0]
    isShowed[index] = True

answer = 0

for e in isShowed:
    if e == True: answer += 1

print(answer)
def solution(lottos, win_nums):
    correct = 0 # 맞은 개수를 체크하는 변수
    cnt = lottos.count(0) # cnt는 최고 순위와 최저 순위의 차이
    for num in lottos:
        if num != 0 and num in win_nums:
            correct += 1

    # 등수 계산
    best = 7 - (correct + cnt)
    if best > 6:
        best = 6
    worst = 7 - correct
    if worst > 6:
        worst = 6
    return best, worst


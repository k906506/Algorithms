def solution(diffs, times, limit):
    start, mid, end = 1, 0, max(diffs)
    answer = 0
    
    while start <= end:
        mid = (start + end) // 2
        
        if solvePuzzle(diffs, times, limit, mid): # 해결할 수 있으면 숙련도 줄이기
            end = mid - 1
            answer = mid
            
        else: # 해결할 수 없으면 숙련도 늘리기
            start = mid + 1
            
    return answer

def solvePuzzle(diffs, times, limit, level):
    timePrev = 0
    totalTime = 0
    
    for i in range(0, len(diffs)):
        if totalTime > limit:
            return False
        
        if diffs[i] <= level: # 해결 가능
            totalTime += times[i]
            
            if totalTime > limit:
                return False
            
        else: # 해결 불가능
            cnt = diffs[i] - level
            totalTime += ((times[i] + timePrev) * cnt)
            totalTime += times[i]
                
            if totalTime > limit:
                return False
        
        timePrev = times[i]
        
    return True

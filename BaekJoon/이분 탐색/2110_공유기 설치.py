def main():
    n, c = map(int, input().split())
    
    wifi = []
    for i in range(n):
        wifi.append(int(input()))
    
    wifi.sort()

    row = 1
    high = wifi[n-1] - wifi[0]

    ans = 0
    while row <= high:
        mid = (high + row)//2 # 공유기 간 최대 거리
        cnt = 1
        
        prev = wifi[0]
        for i in range(1, n):
            distance = wifi[i] - prev
            if distance >= mid: # 두 집 간의 거리가 공유기 간 최대 거리보다 큰 경우
                cnt += 1
                prev = wifi[i]
        
        if cnt >= c: # 공유기 간 최대 거리를 늘려야 함
            ans = mid
            row = mid + 1
        else:
            high = mid - 1
    
    print(ans)

if __name__ == "__main__":
    main()

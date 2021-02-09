import heapq

def main():
    line = []
    k, n = map(int, input().split())

    for i in range(k):
        line.append(int(input()))
    
    high = max(line)
    row = 1

    while (row <= high):
        ans = 0
        mid = (high + row)//2

        for element in line:
            ans += element//mid
        
        if (ans < n): # 더 작은 수로 나눠야함
            high = mid -1
        else:
            row = mid + 1

    print(high)

if __name__ == "__main__":
    main()

import heapq

def main():
    n, m = map(int, input().split())
    wood = list(map(int, input().split()))

    high = max(wood)
    row = 0

    while (row <= high):
        ans = 0
        mid = (row + high)//2

        for element in wood:
            if element > mid:
                ans += element - mid
        
        if ans >= m: # 더 크게 잘라야함
            row = mid + 1
        else:
            high = mid - 1
    
    print(high)

if __name__ == "__main__":
    main()

def main():
    n = int(input())
    k = int(input())

    row = 1
    high = k

    while row <= high:
        ans = 0
        mid = (row + high)//2

        for i in range(1, n+1):
            ans += min(mid//i, n)
        
        if (ans < k):
            row = mid + 1
        else:
            result = mid
            high = mid - 1
    
    print(result)

if __name__ == "__main__":
    main()

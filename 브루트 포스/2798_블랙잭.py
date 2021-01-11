def main():
    n, m = map(int, input().split())
    
    card = list(map(int, input().split()))
    
    result = 0
    
    for i in range(n-2):
        for j in range(i+1, n-1):
            for k in range(j+1, n):
                three = card[i] + card[j] + card[k]
                if result < three and three <= m:
                    result = three
                    
    print(result)
    
if __name__ == "__main__":
    main()
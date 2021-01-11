def main():
    n, m = map(int, input().split())
    chess = [[0] for _ in range(n)]
    result = []
    
    for i in range(n):
        chess[i] = list(input())
        
    for i in range(n-7):
        for j in range(m-7):
            startW = 0
            startB = 0
            for k in range(i, i+8):
                for l in range(j, j+8):
                    if (k+l)%2 == 0:    # (0,0), (0,2), (2,0), ...
                        if chess[k][l] != "W":
                            startW += 1
                        if chess[k][l] != "B":
                            startB += 1
                    else:
                        if chess[k][l] != "B":
                            startW += 1
                        if chess[k][l] != "W":
                            startB += 1
                        
            result.append(startW)
            result.append(startB)
        
    print(min(result))
    
if __name__ == "__main__":
    main()
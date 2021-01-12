def fibonacci(n):
    countZero = [1, 0]
    countOne = [0, 1]
    
    if n == 0:
        print(countZero[0], countOne[0])
    elif n == 1:
        print(countZero[1], countOne[1])
    else:
        for i in range(2, n+1):
            countZero.append(countZero[i-1] + countZero[i-2])
            countOne.append(countOne[i-1] + countOne[i-2])
        print(countZero[n], countOne[n])
    
def main():
    n = int(input())
    
    for _ in range(n):
        m = int(input())
        fibonacci(m)
    
if __name__ == "__main__":
    main()

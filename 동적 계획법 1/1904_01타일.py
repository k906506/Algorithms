def main():
    n = int(input())
    
    number = [0]*1000001
    
    if n == 1:
        print(1)
    elif n == 2:
        print(2)
    else:
        number[1] = 1
        number[2] = 2
        for i in range(3, n+1):
            number[i] = (number[i-1] + number[i-2])%15746
        print(number[n])
        
if __name__ == "__main__":
    main()

def main():
    num = int(input())
    
    for i in range(1, num+1):
        sum_number = i
        divide_number = i
        while divide_number:
            sum_number += divide_number%10
            divide_number = divide_number//10
        if num == sum_number:
            print(i)
            return 0
    print(0)
    
if __name__ == "__main__":
    main()
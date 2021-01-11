def main():
    num = int(input())
    
    number = 0
    count = 0
    
    while 1:
        if "666" in str(number):
            count += 1
        if count == num:
            break
        number += 1
    
    print(number)
    
if __name__ == "__main__":
    main()
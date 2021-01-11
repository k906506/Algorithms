def main():
    num = int(input())
    input_list = []

    for i in range(num):
        input_list.append(list(map(int, input().split())))
    
    for i in range(len(input_list)):
        count = 1
        for j in range(len(input_list)):
            if input_list[i][0] < input_list[j][0] and input_list[i][1] < input_list[j][1]:
                count += 1
        print(count, end = ' ')

if __name__ == "__main__":
    main()
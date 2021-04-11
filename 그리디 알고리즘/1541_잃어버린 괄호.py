import re

def main():
    num = []
    string = input()
    p = re.split("[-]", string)
    for i in p:
        result = 0
        q = re.split("[+]", i)
        for j in q:
            result += int(j)
        num.append(result)
    answer = num[0]
    for i in range(1, len(num)):
        answer -= num[i]
    print(answer)

if __name__ == "__main__":
    main()

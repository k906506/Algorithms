import bisect

def main():
    n = int(input())
    numbers = list(map(int, input().split()))
    sortedNumbers = sorted(list(set(numbers)))
    sortedNumbers = {sortedNumbers[i] : i for i in range(len(sortedNumbers))}
    for i in numbers:
        print(sortedNumbers[i], end = " ")

if __name__ == "__main__":
    main()
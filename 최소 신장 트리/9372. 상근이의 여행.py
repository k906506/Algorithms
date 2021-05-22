import sys

def main():
    t = int(input())

    for _ in range(t):
        n, m = map(int, sys.stdin.readline().split())
        for _ in range(m):
            a, b = map(int, sys.stdin.readline().split())
        print(n-1)

if __name__ == "__main__":
    main()
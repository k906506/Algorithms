import sys

def main():
    words = dict()
    n, m = map(int, input().split())

    for i in range(n):
        word = sys.stdin.readline().rstrip()
        if len(word) >= m:
            if words.get(word) is None:
                words[word] = [-1, -len(word), word]
            else:
                words[word][0] -= 1

    ans = sorted(words.items(), key = lambda x : (x[1][0], x[1][1], x[1][2]))

    for i in range(len(ans)):
        print(ans[i][0])

if __name__ == "__main__":
    main()

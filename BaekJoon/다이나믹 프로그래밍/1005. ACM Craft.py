import sys


def main():
    t = int(input())

    for _ in range(t):
        n, k = map(int, sys.stdin.readline().split())
        times = list(map(int, sys.stdin.readline().split()))  # 건설시간

        degrees = [0 for _ in range(n + 1)]  # 진입차수
        nodes = [[] for _ in range(n + 1)]  # 간선정보
        result = [0 for _ in range(n + 1)]  # 최단 건설시간

        for i in range(k):
            src, dst = map(int, sys.stdin.readline().split())
            nodes[src].append(dst)  # 간선정보 추가
            degrees[dst] += 1  # 진입 차수 1 증가

        finish = int(input())  # 도착지역

        queue = []
        for i in range(1, n + 1):
            result[i] = times[i - 1]  # 최단 건설시간 초기화
            if degrees[i] == 0:
                queue.append(i)

        while degrees[finish] != 0:  # finish의 진입차수가 0이 되면 종료
            element = queue.pop(0)
            for next in nodes[element]:
                degrees[next] -= 1  # 진입차수 -1
                result[next] = max(result[next], result[element] + times[next - 1])
                if degrees[next] == 0:
                    queue.append(next)

        print(result[finish])


if __name__ == "__main__":
    main()

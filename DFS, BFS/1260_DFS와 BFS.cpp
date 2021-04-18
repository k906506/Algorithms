#include <iostream>
#include <queue>
using namespace std;

int number[1001][1001];
int visited[1001];
queue <int> q;
int n, m, start, src, dst;

void dfs(int start) {
	cout << start << " ";
	visited[start] = 1;
	for (int i = 1; i <= n; i++) {
		if ((number[start][i] == 1) && (visited[i] == 0)) {
			dfs(i);
		}
	}
}

void bfs(int start) {
	q.push(start);
	visited[start] = 1;
	cout << start << " ";

	while (!q.empty()) {
		start = q.front();
		q.pop();

		for (int i = 1; i <= n; i++) {
			if ((number[start][i] == 1) && (visited[i] == 0)) {
				q.push(i);
				visited[i] = 1;
				cout << i << " ";
			}
		}
}
	}

int main() {
	cin >> n >> m >> start;

	for (int i = 0; i < m; i++) {
		cin >> src >> dst;
		number[src][dst] = 1;
		number[dst][src] = 1;
	}

	for (int i = 1; i <= n; i++) {
		visited[i] = 0; // No visited로 초기화
	}

	dfs(start);
	cout << endl;

	for (int i = 1; i <= n; i++) {
		visited[i] = 0; // No visited로 초기화
	}

	bfs(start);
}

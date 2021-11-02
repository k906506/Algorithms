#include <iostream>
#define MAX 9
using namespace std;

int n, m;
int visit[MAX] = { 0, };
int input[MAX] = { 0, };

void dfs(int cnt) {
	if (cnt == m) {
		for (int i = 0; i < m; i++) {
			cout << input[i] << " ";
		}
		cout << "\n";
		return;
	}
	for (int i = 1; i <= n; i++) {
		if (!visit[i]) { // 방문하지 않은 경우
			visit[i] = true;
			input[cnt] = i;
			dfs(cnt + 1);
			visit[i] = false;
		}
	}
}

int main() {
	cin >> n >> m;
	dfs(0);
}

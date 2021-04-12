#include <iostream>
#include <queue>
#include <string>

using namespace std;

int n, m, result;
int map[1001][1001];
int visit[1001][1001][2];

int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };

int bfs(){
	int nx, ny, x, y, z;
	queue <pair <pair <int, int>, int>> Q;
	Q.push({{ 1, 1} , 1 });
	
	visit[1][1][1] = 1;

	while (Q.size() > 0) {
		x = Q.front().first.first;
		y = Q.front().first.second;
		z = Q.front().second;
		Q.pop();

		if ((x == n) && (y == m)) {
			return visit[x][y][z];
		}

		for (int i = 0; i < 4; i++) {
			nx = x + dx[i];
			ny = y + dy[i];

			if ((nx >= 1 && nx <= n) && (ny >= 1 && ny <= m)) { // 범위 이내의 좌표일 때
				if ((map[nx][ny] == 1) && (z == 1)) { // 다음 지점이 벽이고, 부실 수 있을 때
					visit[nx][ny][0] = visit[x][y][z] + 1;
					Q.push({ { nx, ny }, 0 });
				}
				else if ((map[nx][ny] == 0) && (visit[nx][ny][z] == 0)) { // 다음 지점이 길이고, 방문하지 않은 지점일때
					visit[nx][ny][z] = visit[x][y][z] + 1;
					Q.push({ {nx, ny}, z });
				}
			}
		}
	}

	return -1;
}

int main() {
	cin >> n >> m;

	for (int i = 1; i <= n; i++) {
		string temp;
		cin >> temp;
		for (int j = 1; j <= m; j++) {
			map[i][j] = temp[j - 1] - '0';
		}
	}

	result = bfs();

	if (result == -1) {
		cout << -1;
	}
	else {
		cout << result;
	}
}

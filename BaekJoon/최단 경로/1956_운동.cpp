#include <iostream>
#include <vector>
#include <queue>
using namespace std;
#define INF 2147483647 // 최대값 선언

vector <vector <pair<int, int>>> path(401);
priority_queue<pair<int, int>> pq;			//가중치 합산, 도착점
int visited[401];
int path_dist[401];

int dijkstra(int src) {
	pq.push({ 0, src });

	while (!pq.empty()) {
		int dist = -pq.top().first;
		int current = pq.top().second;
		pq.pop();
		if (visited[current] == 1) {
			continue;
		}
		for (int i = 0; i < path[current].size(); i++) {
			int next = path[current][i].first;
			int nextDist = path[current][i].second;
			if (path_dist[next] > dist + nextDist) {
				path_dist[next] = dist + nextDist;
				pq.push({ -path_dist[next], next });
			}
		}
		visited[current] = 1;
	}
	return path_dist[src];
}

int main() {
	int v, e, src, dst, dist;
	cin >> v >> e;

	for (int i = 0; i < e; i++) { // 입력값 삽입
		cin >> src >> dst >> dist;
		path[src].push_back({ dst, dist });
	}

	int ans = INF;
	for (int i = 1; i < v+1; i++) {
	    for (int j = 1; j < v+1; j++){
	        visited[j] = 0;
		    path_dist[j] = INF;
	    }
		ans = min(ans, dijkstra(i)); // 최단 경로 탐색
	}

	if (ans == INF) {
		cout << "-1" << endl;
	}
	else {
		cout << ans << endl;
	}
}
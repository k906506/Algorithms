#include <iostream>
#include <queue>
using namespace std;

int visit[300][300];
int dx[8] = {-2, -1, 1, 2, 2, 1, -1, -2};
int dy[8] = {1, 2, 2, 1, -1, -2, -2, -1};
int n, m, srt_x, srt_y, dst_x, dst_y;

int bfs(){
    int x, y, nx, ny;
    queue <pair <int, int>> Q;
    Q.push({srt_x, srt_y});

    while (Q.size() > 0){
        x = Q.front().first;
        y = Q.front().second;
        Q.pop(); // 첫 번째 원소 제거
        
        if (x == dst_x && y == dst_y){ // 도착지인 경우
            return visit[x][y];
        } 

        for (int i = 0; i < 8; i++){ // 모든 방향 탐색
            nx = x + dx[i];
            ny = y + dy[i];

            if ((nx >= 0 && nx < m) && (ny >= 0 && ny < m)){ // 이동하려고 하는 좌표가 범위 이내일 때
                if (visit[nx][ny] == 0){ // 아직 방문하지 않은 좌표일 때
                    visit[nx][ny] = visit[x][y] + 1; // 이전 좌표까지의 횟수 + 1
                    Q.push({nx, ny});
                }
            }
        }
    }
}

int main(){
    cin >> n;

    for(int i = 0; i < n; i++){
        cin >> m >> srt_x >> srt_y >> dst_x >> dst_y;
        for (int j = 0; j < m; j++){
            for (int k = 0; k < m; k++){
                visit[j][k] = 0;
            }
        }
        cout << bfs() << endl;
    }
}
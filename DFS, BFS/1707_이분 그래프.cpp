#include <iostream>
#include <vector>
#include <queue>
using namespace std;

vector <int> vertex[20001];
int visited[20001];

int bfs(int start){
    int current, next;
    queue <int> Q;
    Q.push(start);
    visited[start] = 1;

    while (Q.size() > 0){
        current = Q.front();
        Q.pop();

        for (int i = 0; i < vertex[current].size(); i++){ // 현재 정점과 연결된 모든 정점을 탐색.
            next = vertex[current][i];
            if (visited[next] == 0) { // 방문하지 않은 경우
                visited[next] = -visited[current];
                Q.push(next);
            }
            else if (visited[next] + visited[current] != 0) {
                return -1;
            }
        }
    }
    return 0;
}

int main(){
    int n, v, e, src, dst;
    int check;
    cin >> n;

    for (int i = 0; i < n; i++){
        check = 1;
        cin >> v >> e;
        for  (int j = 0; j < e; j++){
            cin >> src >> dst;
            vertex[src].push_back(dst);
            vertex[dst].push_back(src);
        }

        for (int j = 0; j < v; j++){
            visited[j+1] = 0;
        }

        for (int j = 0; j < v; j++){
            if (visited[j+1] == 0){ // 방문하지 않았을 때
                if (bfs(j+1) == -1){
                    check = -1;
                    break;
                }
            }
        }

        if (check == -1){
            cout << "NO" << endl;
        }
        else{
            cout << "YES" << endl;
        }
        
        for (int j = 0; j < v; j++){
            vertex[j+1].clear();
        }

    }
}
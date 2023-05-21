#include <iostream>
using namespace std;

int n, m, k, wstart[2001][2001], bstart[2001][2001], wdp[2001][2001], bdp[2001][2001];

int main() {
    cin.tie(NULL);
    cout.tie(NULL);
    ios_base::sync_with_stdio(false);

    cin >> n >> m >> k;

    // 1. 정상적인 보드판과의 비교
    for(int i = 0; i < n; i++) {
        string s;
        cin >> s;

        for(int j = 0; j < m; j++) {
            // (짝수, 짝수), (홀수, 홀수)
            if ((i % 2 == 0 && j % 2 == 0) || (i % 2 == 1 && j % 2 == 1)) { // 같은 색으로 채워져있어야 하는 부분
                if (s[j] != 'B') {
                    bstart[i + 1][j + 1] = 1;
                } else {
                    wstart[i + 1][j + 1] = 1;
                }
            } else { // 다른 색으로 채워져있어야 하는 부분
                if (s[j] != 'W') {
                    bstart[i + 1][j + 1] = 1;
                } else {
                    wstart[i + 1][j + 1] = 1;
                }
            }
        }
    }

    // 2. 2차원 부분합 계산
    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= m; j++) {
            bdp[i][j] = bdp[i - 1][j] + bdp[i][j - 1] - bdp[i - 1][j - 1] + bstart[i][j];
            wdp[i][j] = wdp[i - 1][j] + wdp[i][j - 1] - wdp[i - 1][j - 1] + wstart[i][j];
        }
    }
    
    int ans = 2147483647;
    // 3. 최소값 계산
    for(int i = 1; i <= n + 1 - k; i++) {
        for(int j = 1; j <= m + 1 - k; j++) {
            ans = min(ans, bdp[i - 1 + k][j - 1 + k] - bdp[i - 1][j - 1 + k] - bdp[i - 1 + k][j - 1] + bdp[i - 1][j - 1]);
            ans = min(ans, wdp[i - 1 + k][j - 1 + k] - wdp[i - 1][j - 1 + k] - wdp[i - 1 + k][j - 1] + wdp[i - 1][j - 1]);
        }
    }

    cout << ans << '\n';
}
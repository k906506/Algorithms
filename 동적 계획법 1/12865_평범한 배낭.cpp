#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int max(int a, int b){
    return a > b ? a : b;
}

int main(){
    int n, k, w, v;
    vector< pair<int, int>> bag;
    int dp[101][100001] = {0,};
    
    cin >> n >> k;
    
    for (int i = 0; i < n; i++){
        cin >> w >> v;
        bag.push_back({w, v});
    }
    
    sort(bag.begin(), bag.end());
    
    for (int i = 1; i <= n; i++){
        for (int j = 1; j <= k; j++){
            if (j >= bag[i-1].first){
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-bag[i-1].first] + bag[i-1].second);
            }
            else{
                dp[i][j] = dp[i-1][j];
            }
        }
    }
    
    cout << dp[n][k];
    
}

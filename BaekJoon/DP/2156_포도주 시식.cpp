#include <iostream>
using namespace std;

int max(int a, int b){
    return a > b ? a : b;
    }
    
int main(){
    int n;
    cin >> n;
    int grape[10001];
    int dp[10001];
    
    for(int i = 1; i <= n; i++){
        cin >> grape[i];
    }
    
    dp[0] = 0;
    dp[1] = grape[1];
    dp[2] = dp[1] + grape[2];
    
    for(int i = 3; i <= n; i++){
        dp[i] = max(dp[i-2] + grape[i], dp[i-3] + grape[i-1] + grape[i]);
        dp[i] = max(dp[i-1], dp[i]);
    }
    
    cout << dp[n];
}

#include <iostream>
using namespace std;

int min(int a, int b){
    return a < b ? a : b;
}

int main(){
    int n, a, b, c, result;
    int house[999][3];
    int dp[999][3];
    
    cin >> n;
    
    for(int i = 0; i < n; i++){
        cin >> a >> b >> c;
        house[i][0] = a;
        house[i][1] = b;
        house[i][2] = c;
    }
    
    dp[0][0] = house[0][0];
    dp[0][1] = house[0][1];
    dp[0][2] = house[0][2];
    
    for(int i = 1; i < n; i++){
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + house[i][0];
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + house[i][1];
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + house[i][2];
    }
    
    result = dp[n-1][0];
    for(int i = 1; i < 3; i++){
        if (result > dp[n-1][i]){
            result = dp[n-1][i];
        }
    }
    
    cout << result;
}

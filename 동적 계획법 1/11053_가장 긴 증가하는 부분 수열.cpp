#include <iostream>
using namespace std;

int max(int a, int b){
    return a > b ? a : b;
}

int main(){
    int n, a[1000], dp[1000];
    
    cin >> n;
    
    for(int i = 0; i < n; i++){
        cin >> a[i];
        dp[i] = 1;
    }
    
    for(int i = 0; i < n; i++){
        for(int j = 0; j < i; j++){
            if(a[i] > a[j]){
                dp[i] = max(dp[i], dp[j] + 1);
            }
        }
    }
    
    int result = 1;
    for(int i = 0; i < n; i++){
        result = max(result, dp[i]);
    }
    
    cout << result;
    return 0;
}

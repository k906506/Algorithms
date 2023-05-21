#include <iostream>
using namespace std;
int q, dp[200000][26];
string s;

int main() {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    cin >> s;
    
    for(int i = 0; i < s.length(); i++) {
        int alpha = s[i] - 'a';
        dp[i][alpha] += 1;
    }
    
    for(int i = 1; i < s.length(); i++) {
        for (int j = 0; j < 26; j++) {
            dp[i][j] += dp[i - 1][j];
        }
    }
    
    cin >> q;
    
    for(int i = 0; i < q; i++) {
        char alpha;
        int l, r;
        
        cin >> alpha >> l >> r;
        
        int p1 = l > 0 ? dp[l - 1][alpha - 'a'] : 0;
        int p2 = dp[r][alpha - 'a'];
    
        cout << p2 - p1 << '\n';
    }

    return 0;
}
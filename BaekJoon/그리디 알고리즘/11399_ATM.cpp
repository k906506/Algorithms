#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main(){
    int n, m, sum;
    vector <int> atm;
    
    cin >> n;
    
    for (int i = 0; i < n; i++){
        cin >> m;
        atm.push_back(m);
    }
    
    sort(atm.begin(), atm.end());
    
    sum = 0;
    for (int i = 0; i < n; i++){
        for (int j = 0; j <= i; j++){
            sum += atm[j];
        }
    }
    
    cout << sum;
}

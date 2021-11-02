#include <iostream>
#include <vector>

using namespace std;

int main(){
    vector<long long> p;
    p.push_back(1);
    p.push_back(1);
    p.push_back(1);
    
    int t;
    int n;
    cin >> t;
    
    int i = 0;
    while (i < t){
        cin >> n ;
        if (n <= 3) {
            cout << 1 << endl;
        }
        else {
            for(int j = p.size(); j <= n; j++){
                p.push_back(p[j-2]+p[j-3]);
            }
            cout << p[n-1] << endl;
        }
        i++;
    }
    
    return 0;
}

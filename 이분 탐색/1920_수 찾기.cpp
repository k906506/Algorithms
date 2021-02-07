#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main(){
    ios_base::sync_with_stdio(false); cin.tie(NULL);
    int n, m, input;
    vector <int> card_input;

    cin >> n;
    for (int i = 0; i < n; i++){
        cin >> input;
        card_input.push_back(input);
    }

    sort(card_input.begin(), card_input.end());

    cin >> m;
    for (int i = 0; i < m; i++){
        cin >> input;
        if (binary_search(card_input.begin(), card_input.end(), input)){
            cout << 1 << "\n";
        }
        else{
            cout << 0 << "\n";
        }
    }
}

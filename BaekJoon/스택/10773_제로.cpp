#include <iostream>
#include <vector>

using namespace std;

int main(){
    int k, number;
    vector <int> scoreBoard;
    
    int result = 0;
    
    cin >> k;
    
    for (int i = 0; i < k; i++){
        cin >> number;
        if (number == 0){
            scoreBoard.pop_back();
        }
        else{
            scoreBoard.push_back(number);
        }
    }
    
    for (int i = 0; i < scoreBoard.size(); i++){
        result += scoreBoard[i];
    }
    
    cout << result;
    
}

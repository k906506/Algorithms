#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

bool compare(pair<int, int> p1, pair<int, int> p2){
    if (p1.second == p2.second){
        return p1.first < p2.first;
    }
    return p1.second < p2.second;
}

int main(){
    int n, start, end, cnt;
    vector <pair<int, int>> room;
    
    cin >> n;
    
    for (int i = 0; i < n; i++){
        cin >> start >> end;
        room.push_back({start, end});
    }
    
    sort(room.begin(), room.end(), compare);
    
    end = 0;
    cnt = 0;
    
    for (int i = 0; i < n; i++){
        if (end <= room[i].first){
            end = room[i].second;
            cnt += 1;
        }
    }
    
    cout << cnt;
}

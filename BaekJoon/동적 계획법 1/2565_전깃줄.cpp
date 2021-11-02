#include <iostream>
#include <vector>
#include <algorithm>
#include <utility>
using namespace std;

int max(int a, int b){
	return a > b ? a : b;
}

bool comp(int> a, pair<int, int> b){
	return a.first < b.first;
}

int main(){
	int n, a, b, dp[500];
	int result = 0;
	vector <pair<int, int>> line;
	
	cin >> n;
	
	for (int i = 0; i < n; i++){
		cin >> a >> b;
		line.push_back({a, b});
		dp[i] = 1;
	}
	
	sort(line.begin(), line.end(), comp);
	
	for (int i = 0; i < n; i++){
		for (int j = 0; j < i; j++){
			if (line[i].second > line[j].second){
				dp[i] = max(dp[i], dp[j] + 1);
			}
		}
	}
	
	for (int i = 0; i< n; i++){
		result = max(result, dp[i]);
	}
	
	cout << n - result;
}

#include <iostream>
#include <vector>
using namespace std;

int main() {
	long long n, dist, amount, sum;
	cin >> n;

	vector <long long> distance, oil;
	for (int i = 0; i < n - 1; i++) {
		cin >> dist;
		distance.push_back(dist);
	}
	for (int i = 0; i < n; i++) {
		cin >> amount;
		oil.push_back(amount);
	}

	sum = distance[0] * oil[0];
	// 기본적으로 다음 목적지까지 가기 위한 최소한의 기름
	for (int i = 1; i < n; i++) {
		if (oil[i - 1] < oil[i]) {
		    oil[i] = oil[i - 1];
		}
		sum += distance[i] * oil[i];
	}
	cout << sum;
}

#include <iostream>
using namespace std;

int max(int a, int b) {
	return a > b ? a : b;
};

int main() {
	int n;
	cin >> n;

	int a[1000], dpfront[1000], dpback[1000];
	int result = 0;

	for (int i = 0; i < n; i++) {
		cin >> a[i];
		dpfront[i] = 1;
		dpback[i] = 1;
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < i; j++) {
			if (a[i] > a[j]) {
				dpfront[i] = max(dpfront[i], dpfront[j] + 1);
			}
		}
	}

	for (int i = n - 1; i >= 0; i--) {
		for (int j = n - 1; j > i; j--) {
			if (a[i] > a[j]) {
				dpback[i] = max(dpback[i], dpback[j] + 1);
			}
		}
	}

	for (int i = 0; i < n; i++) {
		dpfront[i] += dpback[i];
	}

	for (int i = 0; i < n; i++) {
		result = max(result, dpfront[i]);
	}

	cout << result - 1;
}

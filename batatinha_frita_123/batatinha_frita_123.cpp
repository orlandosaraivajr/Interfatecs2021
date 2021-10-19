#include <iostream>
#include <vector>

using namespace std;

typedef struct node {
	int r;
	int c;
	struct node *parent;
} Node;

int r1, c1, r2, c2, n;
vector<Node*> visited;
vector<string> lab;

Node* create_node(int r, int c, Node *p) {
	Node *nd = new Node(); 
	nd->r = r;
	nd->c = c;
	nd->parent = p;
	return nd;
}

bool just_visited(Node *nd) {
	for (int i = 0; i < visited.size(); i++)
		if (nd->r == visited[i]->r && nd->c == visited[i]->c)
			return true;
	return false;
}

vector<Node*> get_sucessors(Node *nd) {
	vector<Node*> s;
	int p[8] = {nd->r, nd->c-1, nd->r, nd->c+1, nd->r-1, nd->c, nd->r+1, nd->c};
	for (int i = 0; i <= 6; i += 2) 
		if (p[i] < n && p[i+1] < n && lab[p[i]][p[i+1]] == '1')
			s.push_back(create_node(p[i], p[i+1], nd));
	return s;
}

Node* find_path(Node *origin, Node *target) {
	Node *nd;
	vector<Node*> sus, fringe;
	fringe.push_back(origin);
	while(true) {
		if (fringe.empty())
			return NULL;
		nd = fringe.back();
		fringe.pop_back();
		if (nd->r == target->r && nd->c == target->c) 
			return nd;
		if (!just_visited(nd)) {
			visited.push_back(nd);
			sus = get_sucessors(nd);
			for (int i = 0; i < sus.size(); i++)
				fringe.push_back(sus[i]);
		}
	}
}

void printt(Node *nd) {
	if (!nd)
		return;
	printt(nd->parent);
	cout << nd->r+1 << " " << nd->c+1 << endl;
}

int main() {
	string aux;

	cin >> n;
	cin >> r1 >> c1;
	cin >> r2 >> c2;
	for (int i = 0; i < n; i++) {
		cin >> aux;
		lab.push_back(aux);
	}
	Node *o = create_node(r1-1, c1-1, NULL);
	Node *t = create_node(r2-1, c2-1, NULL);
	Node *end = find_path(o, t);
	printt(end);
	return 0;
}

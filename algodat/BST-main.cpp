#include <iostream>
using namespace std;
class Node;

class Node{
private:
    int value;
    Node *smaler;
    Node *greater;

public:
    Node(int v){
        value = v;

        smaler = nullptr;
        greater = nullptr;
        //cout << "Node Constructor" << endl;
    }

    int getValue(){
        return value;
    }

    bool exists(int val){
        //cout << "exists in Node: " << value << endl;
        bool ret = false;
        bool ret2 = false;
        if(value == val){
            return true;
        } else {
            if(smaler != nullptr){
                ret = smaler->exists(val);
            }
            if(greater != nullptr){
                ret2 = greater->exists(val);
            }

            return (ret||ret2);
        }
    }

    void insert(Node *n){
        //cout << "insert in Node" << endl;
        if(n->getValue() < value){
            if(smaler != nullptr){
                smaler->insert(n);
            } else {
                smaler = n;
                //cout << "insert done" << endl;
            }
        } else if(n->getValue() > value) {
            if(greater != nullptr){
                greater->insert(n);
            } else {
                greater = n;
                //cout << "insert done" << endl;
            }
        } else {
            //cout << "value already in tree" << endl;
        }
    }

    void print(){
        cout << value << ' ';
    }

    bool printNodeOrNone(){
        bool returner = false;
        if(smaler != nullptr){
            returner = smaler->printNodeOrNone();
        }
        if(greater != nullptr){
            bool gm = greater->printNodeOrNone();
            if(returner||gm){
                returner = true;
            }
        }

        if(value%5 == 0){
            if(smaler != nullptr){
                smaler->print();
                returner = true;
            }
            if(greater != nullptr){
                greater->print();
                returner = true;
            }
        }
        return returner;
    }

    void traverse_inorder(){
        if(smaler != nullptr){
            smaler->traverse_inorder();
        }
        cout << value << endl;
        if(greater != nullptr){
            greater->traverse_inorder();
        }
    }

    void traverse_preorder(){
        cout << value << endl;
        if(smaler != nullptr){
            smaler->traverse_preorder();
        }
        if(greater != nullptr){
            greater->traverse_preorder();
        }
    }

    void traverse_postorder(){
        if(smaler != nullptr){
            smaler->traverse_postorder();
        }
        if(greater != nullptr){
            greater->traverse_postorder();
        }
        cout << value << endl;
    }
};

class BinarySearchTree{
private:
    Node *root;

public:
    BinarySearchTree(){
        //cout << "BTS Constructor" << endl;
        root = nullptr;
    }

    void insert(int value){
        //cout << "insert" << endl;
        if(root != nullptr){
            Node *n = new Node(value);
            root->insert(n);
        } else {
            Node *n = new Node(value);
            root = n;
        }
    }

    void printTheNodesOrNone(){
        if(root == nullptr){
            cout << "NONE" << endl;
        } else {
            if(root->printNodeOrNone()){
                cout << endl;
            } else {
                cout << "NONE" << endl;
            }
        }
    }

    void inorder(){
        if(root != nullptr){
            cout << "Inorder:" << endl;
            root->traverse_inorder();
        } else {
            cout << "This tree is empty..." << endl;
        }
    }

    void postorder(){
        if(root != nullptr){
            cout << "Postorder:" << endl;
            root->traverse_postorder();
        } else {
            cout << "This tree is empty..." << endl;
        }
    }

    void preorder(){
        if(root != nullptr){
            cout << "Preorder:" << endl;
            root->traverse_preorder();
        } else {
            cout << "This tree is empty..." << endl;
        }
    }
};

int charToIntWithPower(char n, int p){
    int number = (int)n - 48;
    for(int i = 0; i < p; i++){
        number *= 10;
    }
    return number;
}

int charToInt(char* n){
    int size = sizeof(n)/sizeof(*n);
    int zahl = 0;
    for(int i = 0; i<size; i++){
        zahl = zahl + charToIntWithPower(n[i], i);
    }
    return zahl;
}

int main() {
    /*cout << '1' <<endl;
    BinarySearchTree *bst = new BinarySearchTree();
    //cout << '2' << endl;
    bst->insert(5);
    bst->insert(7);
    bst->insert(10);
    bst->insert(11);
    bst->insert(15);
    bst->insert(31);
    bst->insert(1);
    cout << "5 7 10 11 15 31 1 -> test binary tree" << endl;
    cout << "printTheNodesOrNone: ";
    bst->printTheNodesOrNone();
    cout << "traverse the tree:" << endl;
    bst->inorder();
    bst->postorder();
    bst->preorder();*/
    cout << "Number is 123" << endl;
    char n[] = {'1','2','3'};
    int ret = charToInt(n);
    cout << "charToInt returns: " << ret << endl;

    return 0;
}
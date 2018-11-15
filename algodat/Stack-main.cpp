#include <iostream>
#include <vector>
using namespace std;

class My_Stack{
private:
    vector<char> sta;
    int mySize;

public:
    My_Stack(){
        mySize=0;
    }

    void push(char c){
        mySize=mySize+1;
        sta.push_back(c);
    }

    int size(){
        return mySize;
    }

    char pop(){
        char ret = sta[mySize-1];
        sta.pop_back();
        mySize= mySize-1;
        return ret;
    }
};

bool parentheses(vector<char> a){
    My_Stack stack;
    stack.push('X');
    for(char x: a){
        if(x == '('){
            stack.push('o');
        }else{
            char y = stack.pop();
            if(y == 'X'){
                return false;
            }
        }
    }
    return stack.pop() == 'X';

}

int main(int argc, char** argv) {
    cout << "This program does only look at the ( and ) chars ";
    cout << "in the arguments. () returns the same as (8)" << endl;
    for(int c = 0; c < argc; c++){
        vector<char> myVector;
        char* myChars = argv[c];
        int size;
        size = sizeof(myChars) / sizeof(*myChars);
        cout << "Argument " << c << "is: ";
        for(int i = 0; i < size; i++){
            if(myChars[i] == '(' || myChars[i] == ')'){
                myVector.push_back(myChars[i]);
                cout << myChars[i];
            }
        }
        cout << "\n and returns: ";
        if(parentheses(myVector)){
            cout << "true" << endl;
        } else {
            cout << "false" << endl;
        }
    }
    return 0;
}
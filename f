#include <stdio.h>

int binarySearch(int A[], int l, int r, int item) {
    while (l <= r) {
        int mid = (l + r) / 2;
        if (A[mid] == item){
           
            return 1; 
             }
             
        else if (item < A[mid])
            r = mid - 1;
        else
            l = mid + 1;
    }
    return 0;
}

int main() {
    int n, item;
    printf("Enter the number of elements:\n ");
    scanf("%d", &n);
    int A[n];
    printf("Enter %d sorted integers:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &A[i]);
    }
    printf("Enter the item to search: \n");
    scanf("%d", &item);

if (binarySearch(A, 0, n - 1, item)){
    printf("%d found  in the array.\n", item);
}    
    else
        printf("%d  not found in the array.\n", item);
    return 0;
}








#include <stdio.h>
#include <stdlib.h>

struct node {
    int item;
    struct node* left;
    struct node* right;
};

// Inorder traversal
void inorderTraversal(struct node* root) {
    if (root == NULL) return;
    inorderTraversal(root->left);
    printf("%d ", root->item);
    inorderTraversal(root->right);
}

// Preorder traversal
void preorderTraversal(struct node* root) {
    if (root == NULL) return;
    printf("%d ", root->item);
    preorderTraversal(root->left);
    preorderTraversal(root->right);
}

// Postorder traversal
void postorderTraversal(struct node* root) {
    if (root == NULL) return;
    postorderTraversal(root->left);
    postorderTraversal(root->right);
    printf("%d ", root->item);
}

// Create a new Node
struct node* create(int value) {
    struct node* newNode = malloc(sizeof(struct node));
    newNode->item = value;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Insert on the left of the node
struct node* insertLeft(struct node* root, int value) {
    root->left = create(value);
    return root->left;
}

// Insert on the right of the node
struct node* insertRight(struct node* root, int value) {
    root->right = create(value);
    return root->right;
}

int main() {
    struct node* root = create(1);
    insertLeft(root, 4);
    insertRight(root, 6);
    insertLeft(root->left, 42);
    insertRight(root->left, 3);
    insertLeft(root->right, 2);
    insertRight(root->right, 33);

    printf("Traversal of the inserted binary tree\n");

    printf("Inorder traversal \n");
    inorderTraversal(root);

    printf("\nPreorder traversal \n");
    preorderTraversal(root);

    printf("\nPostorder traversal \n");
    postorderTraversal(root);

    return 0;
}










#include <stdio.h>

int coinChange(int A[], int coins, int amount) {
    int C[coins + 1][amount + 1];

    // Initialize base cases
    for (int i = 0; i <= coins; i++) {
        for (int j = 0; j <= amount; j++) {
            if (j == 0)
                C[i][j] = 1;  
            else if (i == 0)
                C[i][j] = 0; 
            else if (A[i - 1] <= j)
                C[i][j] = C[i - 1][j] + C[i][j - A[i - 1]];
            else
                C[i][j] = C[i - 1][j];
        }
    }

    return C[coins][amount];
}

int main() {
    int coins[] = {1,2,5};  // Example coin denominations
    int numCoins = sizeof(coins) / sizeof(coins[0]);
    int amount = 7;

    printf("Number of ways to make %d is : %d\n",amount, coinChange(coins, numCoins, amount));

    return 0;
}






#include <stdio.h>

#define MAX_N 20

int memo[MAX_N + 1];

int f(int n) {
    memo[0] = 0;
    memo[1] = 1;

    for (int i = 2; i <= n; i++) {
        memo[i] = memo[i - 1] + memo[i - 2];
    }

    
    for(int i=0;i<n;i++){
        printf("%d ",memo[i]);
    }
    printf("\n");
    return memo[n];
}

int main() {
    int n;
    scanf("%d", &n);


    int result = f(n);
    printf("Fibonacci number of %d is %d\n", n, result);

    return 0;
}





#include <stdio.h>
#include <stdlib.h>

void merge(int A[], int l, int mid, int r) {
    int n1 = mid - l + 1;
    int n2 = r - mid;

    int lArr[n1], rArr[n2];

    for (int i = 0; i < n1; i++) {
        lArr[i] = A[l + i];
    }
    for (int i = 0; i < n2; i++) {
        rArr[i] = A[mid + 1 + i];
    }

    int i = 0, j = 0, k = l;

    while (i < n1 && j < n2) {
        if (lArr[i] <= rArr[j]) {
            A[k] = lArr[i];
            i++;
        } else {
            A[k] = rArr[j];
            j++;
        }
        k++;
    }

    while (i < n1) {
        A[k] = lArr[i];
        i++;
        k++;
    }

    while (j < n2) {
        A[k] = rArr[j];
        j++;
        k++;
    }
}

void mergeSort(int A[], int l, int r) {
    if (l < r) {
        int mid = l + (r - l) / 2;
        mergeSort(A, l, mid);
        mergeSort(A, mid + 1, r);
        merge(A, l, mid, r);
    }
}

int main() {
    int A[] = {1, 0, 100, 11, 13, 13, 6, 7};
    int size = sizeof(A) / sizeof(A[0]);

    mergeSort(A, 0, size - 1);

    printf("Sorted array:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", A[i]);
    }

    return 0;
}

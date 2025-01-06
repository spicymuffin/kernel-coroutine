// delete node (unsafe - does not check if node is head)
#define DELETE_NODE(node) do {         \
    (node)->prev->next = (node)->next; \
    (node)->next->prev = (node)->prev; \
} while(0)

// insert node after insert_after
#define INSERT_NODE_AFTER(insert_after, node) do { \
    (node)->next = (insert_after)->next;           \
    (node)->prev = (insert_after);                 \
    (insert_after)->next->prev = (node);           \
    (insert_after)->next = (node);                 \
} while(0)

// insert node before insert_before
#define INSERT_NODE_BEFORE(insert_before, node) do { \
    (node)->next = (insert_before);                  \
    (node)->prev = (insert_before)->prev;            \
    (insert_before)->prev->next = (node);            \
    (insert_before)->prev = (node);                  \
} while(0)

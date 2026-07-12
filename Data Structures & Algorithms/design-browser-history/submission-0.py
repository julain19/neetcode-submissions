class HistoryNode:
    def __init__(self, page="", next=None, prev=None):
        self.page = page
        self.next = next
        self.prev = prev

class BrowserHistory:

    def __init__(self, homepage: str):
        self.head = HistoryNode(homepage)

    def visit(self, url: str) -> None:
        new = HistoryNode(page=url, next=None, prev=self.head)
        new.prev.next = new
        self.head = new

    def back(self, steps: int) -> str:
        while steps > 0 and self.head.prev is not None:
            self.head = self.head.prev
            steps -= 1
        return self.head.page

    def forward(self, steps: int) -> str:
        while steps > 0 and self.head.next is not None:
            self.head = self.head.next
            steps -= 1
        return self.head.page


# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
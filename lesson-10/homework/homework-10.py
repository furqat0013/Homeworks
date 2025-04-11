class Task:
    def __init__(self, title, description, date, status = 'Incomplete'):
        self.title = title
        self.description = description
        self.date = date
        self.status = status
    def __str__(self):
        return f"Task({self.title}, {self.description}, {self.date}, {self.status})"
class ToDoList:
    def __init__(self):
        self.tasks = []
    def add_task(self, title, description, date):
        task = Task(title, description, date)
        self.tasks.append(task)
    def complete_task(self, title):
        for task in self.tasks:
            if task.title == title:
                task.status = "Completed"
                break
    def list_all_tasks(self):
        for task in self.tasks:
            print(task) 
    def list_incomplete_tasks(self):
        for task in self.tasks:
            if task.status == 'Incomplete':
                print(task)
    def delete_task(self, title):
        for task in self.tasks:
            if task.title == title:
                self.tasks.remove(task)
                break   
if __name__ == "__main__":
    todo_list = ToDoList()
    
    while True:
        print("1. Add Task")
        print("2. Complete Task")
        print("3. List All Tasks")
        print("4. List Incomplete Tasks")
        print("5. Delete Task")
        print("6. Exit")
        
        choice = input("Enter your choice: ")
        
        if choice == '1':
            title = input("Enter task title: ")
            description = input("Enter task description: ")
            date = input("Enter task date: ")
            todo_list.add_task(title, description, date)
        elif choice == '2':
            title = input("Enter task title to complete: ")
            todo_list.complete_task(title)
        elif choice == '3':
            todo_list.list_all_tasks()
        elif choice == '4':
            todo_list.list_incomplete_tasks()
        elif choice == '5':
            title = input("Enter task title to delete: ")
            todo_list.delete_task(title)
        elif choice == '6':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice, please try again.")
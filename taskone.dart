void main(){
  TaskManager taskMan = new TaskManager();
  taskMan.addTask('task1','description1',DateTime.now(),'completed');
  taskMan.addTask('task2','description2',DateTime.now(),'pending');
  taskMan.viewTask();
  taskMan.viewCompletedTask();
}

class Tasks{
  String name;
  String description;
  DateTime dueDate;
  String status;

 
  Tasks(this.name,this.description,this.dueDate):status = 'pending';

    

}

class TaskManager{
  List<Tasks> task= [];

  void addTask(String name, String description,DateTime dueDate,String status){
    Tasks newTask = new Tasks(name,description,dueDate,status);
    task.add(newTask);
    
    print("Task Added");
  }

  void viewTask(){
    for(int i = 0; i < task.length;i++){
      print('name: ${task[i].name}');
      print('description: ${task[i].description}');
      print('dueDate: ${task[i].dueDate}');
      print('status: ${task[i].status}');
    }
  }

  void viewCompletedTask(){

    for(int i = 0; i < task.length;i++){
      if(task[i].status == 'completed'){
        print('name: ${task[i].name}');
        print('description: ${task[i].description}');
        print('dueDate; ${task[i].dueDate}');
        print('status: ${task[i].status}');
      }
    }
  }

  void viewPendingTask(){
    for(int i = 0; i < task.length; i++){
      if(task[i].status =='pending'){
        print('name: ${task[i].name}');
        print('description:${task[i].description}');
        print('dueDate: ${task[i].dueDate}');
        print('status: ${task[i].status}');
      }
    }
  }

  void editTaskName(cur,n_name){
    for(int i = 0; i < task.length; i++){
      if(task[i].name == cur){
        task[i].name = n_name;
        
      }
    }

  }

   void editTaskDescription(cur,n_description){
    for(int i = 0; i < task.length; i++){
      if(task[i].name == cur){
        task[i].description = n_description;
        
      }
    }

  }

  void editTaskDueDate(cur,n_duedate){
    for(int i = 0; i < task.length; i++){
      if(task[i].name == cur){
        task[i].dueDate = n_duedate;
        
      }
    }

  }

  void editTaskStatus(cur,n_status){
    for(int i = 0; i< task.length; i++){
      if(task[i].name == cur){
        task[i].status = n_status;
      }
    }
  }

  

  void deleteTask(name){
    for(int i = 0; i < task.length; i++){
      if(task[i].name == name){
        task.removeAt(i);
      }
    }
  }
}


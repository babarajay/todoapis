json.partial! "todo_lists/todo_list", todo_list: @todo_list
json.message @message if @message.present?
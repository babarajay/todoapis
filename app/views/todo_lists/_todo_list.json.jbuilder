json.id todo_list.id
json.title todo_list.title
json.description todo_list.description

json.list_items todo_list.todo_list_items do |item|
  json.id item.id
  json.title item.title
  json.completed item.completed
end

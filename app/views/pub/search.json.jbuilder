json.array!(@books) do |book|
  json.id    book.id
  json.value book.title
end

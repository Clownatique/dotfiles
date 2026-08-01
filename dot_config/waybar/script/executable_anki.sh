#!/bin/sh

response=$(sqlite3 -readonly .local/share/Anki2/User\ 1/collection.anki2 -- "SELECT 
  '🔵:' ||
  SUM(CASE WHEN queue = 0 THEN 1 ELSE 0 END) || '\n' ||
  '🔴:' ||
  SUM(CASE WHEN queue = 1 THEN 1 ELSE 0 END) || '\n' ||
  '🟢:' ||
  SUM(CASE WHEN queue = 2 THEN 1 ELSE 0 END)
  FROM cards;"
)

if [ $? -eq 0 -a $(echo $response | grep 🔵) ]; then
 echo "{\"text\":\"$response\"}"
else
 echo "{\"text\":\"IN USE\"}"
fi

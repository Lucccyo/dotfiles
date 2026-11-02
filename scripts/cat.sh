file=$1

meow() {
  echo '   /\_/\'
  echo '  ( o.o )'
  echo '   > ^ <'
  echo ''
}

if [[ "$file" == "cat" ]]; then
  meow
else
  meow
  cat "$file"
fi

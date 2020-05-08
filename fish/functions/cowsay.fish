function weather
  command curl -s 'http://wttr.in/?format=3' | cowsay
end
inittime=$(pwsh -c "[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()")
echo $inittime
path="$HOME/Downloads/output.txt"
echo "" >  $path

date > $path
{
  echo "U RECORD 1"
  while true; do
    echo "F 96300000"
    sleep 1
    now=$(( $(pwsh -c "[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()") - inittime ))
    echo "$now" >> $path
    echo "F 95800000"
    sleep 1
    now=$(( $(pwsh -c "[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()") - inittime ))
    echo "$now" >> $path
  done
} | nc localhost 7356 >> $path

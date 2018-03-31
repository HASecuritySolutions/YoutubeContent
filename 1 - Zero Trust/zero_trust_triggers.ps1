# Example of risky/odd behavior number 1
Clear-EventLog -LogName Security

# Example of risky/odd behavior number 2
Resolve-DnsName -Name 1abmeinc.com

# Example of risky/odd behavior number 3
$port = 445
$systems = @("192.168.2.101","192.168.2.102","192.168.2.108","192.168.2.21","192.168.2.199")
$repeat = 100
$count = 0
while($count -ne $repeat){
    foreach($system in $systems){
        $socket = new-object System.Net.Sockets.TcpClient($system, $port)
        if($socket.Connected){
            Write-Host "Port $port is open on $system" -ForegroundColor Cyan
            $socket.Close()
        } else {
            Write-Host "Port $port is closed on $system" -ForegroundColor Red
        }
    }
    $count++
}
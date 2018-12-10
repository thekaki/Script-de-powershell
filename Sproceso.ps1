
function get-menu 
{
  Write-Host "1-.visualizar procesos"
  Write-Host "2-.parar proceso"
  Write-Host "3-.iniciar proceso" 
  Write-Host "4-.-salir"
}


function verproceso 
{
Get-Process -Name *$nombre* |ft -AutoSize
}


function pararproceso 
{
$nombre=Read-Host 'inroduzca el nombre del proceso'
#nos da el id y el nombre de los procesos mas sencillo para localizar el proceso que queremos
Get-Process -Name *$nombre* |ft name,id -AutoSize
[int]$id=Read-Host 'intoduzca el id del proceso para detenerlo'
#paramos el proceso con su id
Stop-Process -Id $id -Confirm:$false    
}


function iniciarproceso
{

$name=read-host 'nombre del proceso ejemplo (chrome.exe)'
#iniciamos un proceso
start-process $name    
}

do
{
 get-menu
 $opcion= Read-Host "eliga una opcion"
 switch ($opcion)
 {
     '1' {verproceso}
     '2' {pararproceso}
     '3'{iniciarproceso} 
     '4'{exit}
     Default {write-host "no ha elegido la opción correcta"}
 }

 $respuesta=Read-Host "¿desea ejecutar el programa de nuevo s/n?" 
}
while ($respuesta -eq 's')





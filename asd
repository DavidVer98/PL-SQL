#!/bin/sh
#hecho por Martin Aponte
#definimos el abcdario
ABCDARIO="ABCDEFGHIKLMNOPQRSTUVWXYZ"

## Producimos la cuadricula, key seria nuestr clave
prodCuad(){
  key=$1

  ## Convertimos la semilla a mayusculas
  key=${key^^}
  
  ## key es vacio al empezar
  Cuad=""
  
  ## añadimos cada caracter de nuestra key que no está en la cuadricula, car es caracter
  for (( i=0; i<${#key}; i++ )); do
    car="${key:$i:1}"
    
    inc $Cuad $car
    
    if [ $? -eq 0 ]; then
      Cuad="$Cuad$car"
    fi
  
  done

  ## Agregamos cada caracter del ABCDARIO que no se encuentra dentro de en la cuadricula
  for (( i=0; i<${#ABCDARIO}; i++ )); do
    car="${ABCDARIO:$i:1}"

    inc $Cuad $car
  
    if [ $? -eq 0 ]; then
      Cuad="$Cuad$car"
    fi

  done

  ## cuadricula por filas
  FilaCuad[1]=${Cuad:0:5}
  FilaCuad[2]=${Cuad:5:5}
  FilaCuad[3]=${Cuad:10:5}
  FilaCuad[4]=${Cuad:15:5}
  FilaCuad[5]=${Cuad:20:5}

  ## cuadricula por columnas
  for (( i=1; i<=5; i++ )); do
    ColCuad[i]="" 
    for (( j=1; j<=5; j++ )); do
      k=`expr $i - 1`
      ColCuad[i]="${ColCuad[i]}${FilaCuad[j]:$k:1}"
    done
  done

  
}


## como salida lanzamos la posicion de un caracter en la cadena
ubi() {
  str="$1" 
  str2="$2"

  pos=`expr index "$str" "$str2"`
  
  return $pos
}
## funcion para señalar si una cadena incluye un caracter
inc() {
    str="$1" 
    str2="$2"

    if test "${str#*$str2}" != "$str"
    then
    # 1 si es que incluye un caracter
        return 1    
    else
     # 0 si no incluye ningun caracter
        return 0   
    fi
}


## chequeamos el caso 1 y si es correcto lanzamos la fila que cumple
check1() {
  fila=1;
  for i in "${FilaCuad[@]}"; do
    inc $i $1
    if [ $? -eq 1 ]; then
      inc $i $2
      if [ $? -eq 1 ]; then
        return $fila ## cumple
      fi
    fi
    fila=`expr $fila + 1`
  done
  return 0 ## no cumple
}

## chequeamos el caso 2 y si es correcto lanzamos la columna que cumple
check2() {
  col=1;
  for i in "${ColCuad[@]}"; do
    inc $i $1
    if [ $? -eq 1 ]; then
      inc $i $2
      if [ $? -eq 1 ]; then
        return $col ## cumple
      fi
    fi
    col=`expr $col + 1`
  done
  return 0 ## no cumple
}

## ciframos ahora el caso 1
cif1() {
  fila=$1
  char=$2
  fila=${FilaCuad[$fila]}

  ubi $fila $char
  x=`expr $? % 5`

  new="${fila:$x:1}"
}

## descifra el caso 1
desci1() {
  fila=$1
  char=$2
  fila=${FilaCuad[$fila]}

  ubi $fila $char
  x=`expr $? - 2`
  
  if [ $x -lt 0 ]; then
    x=4;
  fi

  new="${fila:$x:1}"
}

## cifra el caso 2
cif2() {
  col=$1
  char=$2
  col=${ColCuad[$col]}

  ubi $col $char
  x=`expr $? % 5`

  new="${col:$x:1}"
}

## descifra el caso 2
desci2() {
  col=$1
  char=$2
  col=${ColCuad[$col]}

  ubi $col $char
  x=`expr $? - 2`
  
  if [ $x -lt 0 ]; then
    x=4;
  fi

  new="${col:$x:1}"
}

## Filext usamos para extraer la fila de una letra en la cuadricula
FilaExt() {
  fila=1;
  for i in "${FilaCuad[@]}"; do
    inc $i $1
    if [ $? -eq 1 ]; then
      return $fila 
    fi
    fila=`expr $fila + 1`
  done
  return 0 
}

## Colext usamos para extraer la columna de una letra en la cuadricula
Colext() {
  col=1;
  for i in "${ColCuad[@]}"; do
    inc $i $1
    if [ $? -eq 1 ]; then
      return $col 
    fi
    col=`expr $col + 1`
  done
  return 0 
}

## cifra el caso 3
## se cruzan filas y columnas 
cif3() {
  char1=$1
  char2=$2

  FilaExt $char1
  fila1=$?
  
  Colext $char1
  col1=`expr $? - 1` 

  FilaExt $char2
  fila2=$?
  
  Colext $char2
  col2=`expr $? - 1` 

  # Fila 1 x Columna 2
  new1=${FilaCuad[$fila1]:col2:1}
  
  # Fila 2 x Columna 1
  new2=${FilaCuad[$fila2]:col1:1}
}

desci3() {
  cif3 $1 $2
}

## imprimimos la cuadricula con CuadImp
CuadImp() {
  echo ${FilaCuad[1]}
  echo ${FilaCuad[2]}
  echo ${FilaCuad[3]}
  echo ${FilaCuad[4]}
  echo ${FilaCuad[5]}
}

## usamos double para borrar caracteres contiguos iguales
double() {
  inf=$1
  new=${inf:0:1}
  
  for (( i=0, j=1; j<${#inf}; i++, j++ )); do
    caracteri="${inf:$i:1}"
    caracterj="${inf:$j:1}"

    if [ $caracteri != $caracterj ]; then
      new="$new$caracterj"
    fi

  done
}


## cifra un mensaje
cifrado() {
  echo "Generando el cifrado, tomara unos segundos"
  mensaje=$1
  
  # se convierte a mayusculas
  mensaje=${mensaje^^}
  
  # se acomoda el mensaje 
  # cambiando la J por la I
  mensaje=`echo "$mensaje" | tr J I`
  # cambiando la Ñ por la N
  mensaje=`echo "$mensaje" | tr Ñ N`
  
  # se eliminan los espacios
  mensaje=${mensaje// }

  # seeliminan los caracteres contiguos que son duplicados
  double $mensaje
  mensaje=$new

  # se complementa el mensaje si tiene longitud impar
  if [ `expr ${#mensaje} % 2` -ne 0 ]; then
    mensaje="${mensaje}X"
  fi

  # para guardar el cifrado
  mcifrado=""

  for((m=0, n=m+1; m<${#mensaje}; m=m+2, n=m+1)) do
    
    # caracteres del digrama
    char1=${mensaje:$m:1}
    char2=${mensaje:$n:1}

    #verificar si es el caso 1
    check1 $char1 $char2
    f=$?
    if [ $f -gt 0 ]; then
      #cifrar caso 1 caracter 1 
      cif1 $f $char1
      mcifrado="$mcifrado$new"
      
      #cifrar caso 1 caracter 2 
      cif1 $f $char2
      mcifrado="$mcifrado$new"
      
      #continuar con el siguiente digrama
      continue
    fi

    check2 $char1 $char2
    c=$?
    if [ $c -gt 0 ]; then 
      
      #cifrar caso 2 caracter 1 
      cif2 $c $char1
      mcifrado="$mcifrado$new"
      
      #cifrar caso 2 caracter 2 
      cif2 $c $char2
      mcifrado="$mcifrado$new"
  
      #continuar con el siguiente digrama
      continue
    fi

    # cifrar el caso 3
    cif3 $char1 $char2
    mcifrado="$mcifrado$new1$new2"

    
  done

  #retornar el cifrado
  new="$mcifrado"
}

## descifra el mensaje... 
## es practicamente el mismo algoritmo que cifrar
## solo que no tiene que acomodar el texto
descifrado() {
  echo "Generando el descifrado ,tomara unos segundos"
  mcifrado=$1
  
  # guardamos el text descifrado
  textdescifrado="" 

  for((m=0, n=m+1; m<${#mcifrado}; m=m+2, n=m+1)) do
    
    # caracteres del digrama
    char1=${mcifrado:$m:1}
    char2=${mcifrado:$n:1}

    # verificar el caso 1
    check1 $char1 $char2
    f=$?
    if [ $f -gt 0 ]; then
      
      # descifrar caso 1 caracter 1 
      desci1 $f $char1
      textdescifrado="$textdescifrado$new"
      
      # descifrar caso 1 caracter 2 
      desci1 $f $char2
      textdescifrado="$textdescifrado$new"
      
      # continuar con el siguiente digrama 
      continue
    fi

    check2 $char1 $char2
    c=$?
    if [ $c -gt 0 ]; then 
      
      # descifrar caso 2 caracter 1 
      desci2 $c $char1
      textdescifrado="$textdescifrado$new"
      
      # descifrar caso 2 caracter 2 
      desci2 $c $char2
      textdescifrado="$textdescifrado$new"
      
      # continuar con el siguiente digrama 
      continue
    fi

    # cifrar el caso 3
    desci3 $char1 $char2
    textdescifrado="$textdescifrado$new1$new2"
    
  done

  # retornar el descifrado
  new="$textdescifrado"
}

key="MARTI"
echo "Key: $key"
echo

echo "La Cuadricula generada es:"
echo
prodCuad "$key"
CuadImp 
echo

text="THIS IS A TOP SECRET MESSAGE"
echo "El Mensaje es: '$text'"
echo

cifrado "$text"
echo "$new"

echo 

descifrado "$new"
echo "$new"

echo
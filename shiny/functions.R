
# Vida laboral --------------
change_vida_laboral <- function(input){
  
  strings <- c('1-2 años', '2-4 años', '4-8 años', '+8 años')
  
  integers <- c(550, 1095, 2190, 3000)
  
  for (i in 1:length(strings)){
    if (input == strings[i]){
      return(integers[i])
    }
  } 
}

# Tipo de interes ---------
interes <- function(input){
  if (input <= 80000){
    return(0.06)
  }
  
  else if (input > 80000 && input <= 150000){
    return(0.04)
  }
  
  else if (input > 150000 && input <= 650000){
    return(0.025)
  }
  
  else{
    return(0.0175)
  }
}

# Validez DNI -------------
dni <- function(edad, validez){
  if (edad < 30){
    aux  = difftime(validez, lubridate::years(5), 'days')
    return(lubridate::time_lenght(difftime(Sys.Date(), aux), 'days'))
  }
  
  else if(edad >= 30 & edad < 70){
    aux = difftime(validez, lubridate::years(10), 'days')
    return(lubridate::time_lenght(difftime(Sys.Date(), aux), 'days'))
  }
  
  else{
    return(7197) # si tiene mas de 70 imputo el maximo
  }
}

# Anualidad --------------
annuity <- function(c, y){
  return((c * interes(c)) / (1 - (1 + interes(c)) ^ (-y)))
}


  
  
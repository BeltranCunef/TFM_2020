# Cuestionario Principal ---------------------------------------

cuestionario1 <- function() {
  
  appendTab(
    inputId = 'mainPanel',
    tab = tabPanel(
      title = 'SOLICITUD',
      value = 'cuestionario1',
      
      # Pagina del cuestionario ----------------------
      fluidPage(
        
        # Separacion de texto --------------------------
        fluidRow(
          
          style = "height:50px;"),
        
        # Primera linea de preguntas -----------------
        fluidRow(
          
          br(), # espacio en blanco
          
          # Edad -------------------------------------
          column(
            2,
            dateInput(
              inputId = 'edad',
              label = 'Fecha de nacimiento',
              value = Sys.Date() - lubridate::dyears(18),
              min = Sys.Date() - lubridate::dyears(100),
              max = Sys.Date() - lubridate::dyears(18)
            )
          ), 
          
          # Cuantia ----------------------------------
          column(
            2,
            numericInput(
              inputId = 'cuantia',
              label = 'Cantidad solicitada',
              value = 20000,
              min = 1000,
              max = 45000000,
              step = 500
            )
          ),
          
          # Ingresos ----------------------------------
          column(
            2,
            numericInput(
              inputId = 'ingresos',
              label = 'Ingresos Anuales',
              value = 20000,
              min = 1000,
              max = 45000000,
              step = 500
            )
          ),
          
          # Trabajo -----------------------------------
          column(
            2,
            selectInput(
              inputId = 'fuente_ingresos', 
              label = 'Fuente de ingresos',
              choices = c('Asalariado', 'Asociado', 'Desempleado', 'Autónomo', 'Otros')
            )
          ),
          
          # Educacion ----------------------------------
          column(
            2,
            selectInput(
              inputId = 'educacion', 
              label = 'Nivel educativo',
              choices = c('Bachillerato', 'Graduado universitario', 'Secundaria', 'Primaria', 'Máster/Doctorado')
            )
          ),
          
          # Precio de los bienes ---------------------
          column(
            2,
            numericInput(
              inputId = 'coste_bien',
              label = 'Coste aproximado del bien',
              value = 50000,
              min = 1000,
              max = 45000000,
              step = 500
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Segunda linea de preguntas -----------------
        fluidRow(
          
          br(), # espacio en blanco
          
          # Vida laboral -----------------------------
          column(
            2,
            selectInput(
              inputId = 'vida_laboral', 
              label = 'Tiempo empleado/ocupado',
              choices = c('1-2 años', '2-4 años', '4-8 años', '+8 años')
            )
          ), 
          
          # Cuantia ----------------------------------
          column(
            2,
            numericInput(
              inputId = 'duracion_prestamo',
              label = 'Duración del préstamo',
              value = 10,
              min = 1,
              max = 25,
              step = 1
            )
          ),
          
          # Ingresos ----------------------------------
          column(
            2,
            numericInput(
              inputId = 'es_cliente',
              label = 'Años como cliente',
              value = 0,
              min = 0,
              max = 10,
              step = 1
            )
          ),
          
          # NIF/DNI -----------------------------------
          column(
            2,
            textInput(
              inputId = 'dni', 
              label = 'NIF/DNI'
            )
          ),
          
          # Estado civil --------------------------------
          column(
            2,
            selectInput(
              inputId = 'estado_civil', 
              label = 'Estado civil',
              choices =  c('Soltero/a', 'Casado/a', 'Pareja de hecho', 'Divorciado/a', 'Otros')
            )
          ),
          
          # Fecha DNI -----------------------------------
          column(
            2,
            dateInput(
              inputId = 'fecha_dni',
              label = 'Fecha de validez DNI',
              value = Sys.Date(),
              min = Sys.Date(),
              max = Sys.Date() + lubridate::dyears(10000)
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Tercera linea de preguntas --------------------
        fluidRow(
          
          br(), # Espacio en blanco
          
          # Tipo prestamo -------------------------------
          column(
            2,
            selectInput(
              inputId = 'tipo_prestamo', 
              label = 'Tipo de préstamo',
              choices =  c('Revolving', 'Cash')
            )
          ),
          
          # Tipo puesto  --------------------------------
          column(
            2,
            selectInput(
              inputId = 'tipo_puesto', 
              label = 'Tipo de cargo',
              choices =  c('Transportista', 'Peón', 'Director/a', 'Secretario/a', 'Personal de apoyo', 'Empleado de hostelería', 'Personal de
                           apoyo cuallificado', 'Experto en tecnología', 'Encargado de IT', 'Personal de ventas', 'Sanitario', 'Otros')
            )
          ),
          
          # Telefono ------------------------------------
          column(2,
                 textInput(
                  inputId = 'telefono',
                  label = 'Nº de teléfono',
              )
            ),
          
          # Sector empresa  -----------------------------
          column(
            2,
            selectInput(
              inputId = 'sector_empresa', 
              label = 'Sector',
              choices =  c('Marketing', 'Agricultura', 'Banca', 'Negocios tipo 1', 'Negocios tipo 2', 'Electricidad', 
                           'Salud', 'Gubernamental', 'Turismo', 'Industria tipo 10', 'Industria tipo 12',
                           'Industria tipo 2', 'Industria tipo 3', 'Industria tipo 4', 'Industria tipo 7', 
                           'Seguros', 'Telefonía', 'Otros', 'Religión', 'Cuerpos de seguridad', 
                           'Seguridad privada', 'ETT', 'Servicios', 'Comercio tipo 1', 'Comercio tipo 4',
                           'Comercio tipo7', 'No sabe/No contesta')
            )
          ),
          
          # Email ---------------------------------------
          column(2,
                 textInput(
                   inputId = 'email',
                   label = 'Correo electrónico',
                 )
          ),
          
          # Region nacimiento ---------------------------
          column(
            2,
            selectInput(
              inputId = 'region_nacimiento', 
              label = 'Comunidad Autónoma de nacimiento',
              choices =  c('Andalucía', 'Aragón', 'Canarias', 'Cantabria', 'Castilla-La Mancha', 'Castilla y León',
                           'Cataluña', 'Ceuta', 'Comunidad de Madrid', 'Comunidad Valenciana', 'Extremadura', 'Galicia', 
                           'Islas Baleares', 'La Rioja', 'Melilla', 'Murcia', 'Navarra', 'País Vasco', 'Principado de Asturias')
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Cuarta linea de preguntas --------------------
        fluidRow(
          
          br(), # Espacio en blanco
          
          # Region residencia --------------------------
          column(
            2,
            selectInput(
              inputId = 'region_residencia', 
              label = 'Comunidad Autónoma en la que reside',
              choices =  c('Andalucía', 'Aragón', 'Canarias', 'Cantabria', 'Castilla-La Mancha', 'Castilla y León',
                           'Cataluña', 'Ceuta', 'Comunidad de Madrid', 'Comunidad Valenciana', 'Extremadura', 'Galicia', 
                           'Islas Baleares', 'La Rioja', 'Melilla', 'Murcia', 'Navarra', 'País Vasco', 'Principado de Asturias')
            )
          ),
          
          # Region trabajo --------------------------
          column(
            2,
            selectInput(
              inputId = 'region_trabajo', 
              label = 'Comunidad Autónoma en la que trabaja',
              choices =  c('Andalucía', 'Aragón', 'Canarias', 'Cantabria', 'Castilla-La Mancha', 'Castilla y León',
                           'Cataluña', 'Ceuta', 'Comunidad de Madrid', 'Comunidad Valenciana', 'Extremadura', 'Galicia', 
                           'Islas Baleares', 'La Rioja', 'Melilla', 'Murcia', 'Navarra', 'País Vasco', 'Principado de Asturias')
            )
          ),
          
          # Ciudad trabajo/residencia ----------------
          column(
            2,
            selectInput(
              inputId = 'ciudad_trabajo_residencia', 
              label = '¿Coinciden sus localidades de trabajo y residencia?',
              choices =  c('Sí', 'No')
            )
          ),
          
          # Ciudad nacimiento/trabajo -------------
          column(
            2,
            selectInput(
              inputId = 'ciudad_nacimiento_trabajo', 
              label = '¿Coinciden sus localidades de trabajo y nacimiento?',
              choices =  c('Sí', 'No')
            )
          ),
          
          # Ciudad nacimiento/residencia -------------
          column(
            2,
            selectInput(
              inputId = 'ciudad_nacimiento_residencia', 
              label = '¿Coinciden sus localidades de residencia y nacimiento?',
              choices =  c('Sí', 'No')
            )
          ),
          
          # Vivienda en propiedad -------------------
          column(
            2,
            selectInput(
              inputId = 'vivienda_propiedad', 
              label = '¿Posee usted una vivienda en propiedad?',
              choices =  c('Sí', 'No')
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Quinta linea de preguntas -----------------
        fluidRow(
          
          br(), # Espacio en blanco -----------------
          
          column(2),
          
          column(2),
          
          # Tipo de vivienda ------------------------
          column(
            2,
            selectInput(
              inputId = 'tipo_vivienda', 
              label = '¿Cuál es el tipo de vivienda en la que reside?',
              choices =  c('Apartamento', 'Chalet unifamiliar', 'Chalet adosado', 'Ático', 'Dúplex', 'Piso', 'Estudio')
            )
          ),
          
          # M2 --------------------------------------
          column(
            2,
            selectInput(
              inputId = 'm2', 
              label = 'Indique la superficie en metros cuadrados',
              choices =  c('50-100', '100-150', '150-300', '+300')
            )
          ),
          
          column(2),
          
          column(2)
        ),
        
        # Boton para leer los datos ---------------------
        fluidRow(
          
          br(),
          
          column(3),
          column(6,
                 actionButton(inputId = 'volver', label = 'VOLVER'),
                 actionButton(inputId = 'enviar', label = 'ENVIAR SOLICITUD'),
                 align = 'center',
                 tags$style(type = 'text/css', "#volver { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;
                            background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;}"),
                 tags$style(type = 'text/css', "#enviar { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;
                            background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;}")
          ),
          column(3)
        )
      )
    )
  )
}
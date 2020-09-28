# Cuestionario mal cliente ----------------------------

options(encoding = 'UTF-8')

cuestionario2 <- function() {
  
  appendTab(
    inputId = 'mainPanel',
    tab = tabPanel(
      title = 'DOCUMENTACION',
      value = 'cuestionario2',
      
      # Pagina del cuestionario ----------------------
      fluidPage(
        
        # Separacion de texto --------------------------
        fluidRow(
          
          style = "height:50px;"),
        
        # Primera linea de preguntas -----------------
        fluidRow(
          
          br(), # espacio en blanco
          
          # Libro de familia -------------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'libro_familia',
              label = 'Adjunte libro de familia',
              accept = c('.pdf')
            )
          ), 
          
          # Declaracion de la renta ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'renta',
              label = 'Adjunte declaración de la renta',
              accept = c('.pdf')
            )
          ),
          
          # Padron ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'padron',
              label = 'Adjunte carta de empadronamiento',
              accept = c('.pdf')
            )
          ),
        ),
        
        # Separador
        tags$hr(),
        
        # Segunda linea de preguntas -----------------
        fluidRow(
          
          br(), # Espacio en blanco
          
          # Copia dni ---------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'copia_dni',
              label = 'Adjunte copia del DNI',
              accept = c('.pdf')
            )
          ),
          
          # Certificado estudios ----
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'certificado_estudios',
              label = 'Adjunte certificado de estudios',
              accept = c('.pdf')
            )
          ),
          
          # Nomina ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'nomina',
              label = 'Adjunte última nómina',
              accept = c('.pdf')
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Tercera linea de preguntas -----------------
        fluidRow(
          
          br(), # espacio en blanco
          
          # Libro de familia -------------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'escritura',
              label = 'Adjunte escritura en propiedad o contrato de alquiler',
              accept = c('.pdf')
            )
          ), 
          
          # Contrato ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'contrato',
              label = 'Adjunte contrato de trabajo disponible más reciente',
              accept = c('.pdf')
            )
          ),
          
          # Extracto ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'extracto',
              label = 'Adjunte extracto de los últimos 25 movimientos en cuenta bancaria',
              accept = c('.pdf')
            )
          )
        ),
        
        # Separador
        tags$hr(),
        
        # Cuarta linea de preguntas -------
        fluidRow(
          
          br(),
          
          # Cuenta Bancaria ---------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'cuenta_bancaria',
              label = 'Adjunte certificado de titularidad de cuenta bancaria',
              accept = c('.pdf')
            )
          ),
          
          # Nómina aval ----------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'nomina_aval',
              label = 'Adjunte última nómina disponible del avalista',
              accept = c('.pdf')
            )
          ),
          
          # IRPF avalista ------------------
          column(
            4,
            align = 'center',
            fileInput(
              inputId = 'nomina',
              label = 'Adjunte última declaración de la renta del avalista',
              accept = c('.pdf')
            )
          )
        ),
        
        # Boton para leer los datos ---------------------
        fluidRow(
          
          br(),
          
          column(3),
          column(6,
                 actionButton(inputId = 'enviar_doc', label = 'ENVIAR DOCUMENTACION'),
                 align = 'center',
                 tags$style(type = 'text/css', "#enviar_doc { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;
                            background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;}")
          ),
          column(3)
        )
      )
    )
  )
}
# Aceptacion prestamo --------------------------------

options(encoding = 'UTF-8')

aceptacion <- function() {
  
  appendTab(
    inputId = 'mainPanel',
    tab = tabPanel(
      title = 'ACEPTACIÓN',
      value = 'aceptacion',
      
      # Pagina de aceptacion -------------------------
      fluidPage(
        
        # Enhorabuena --------------------------------
        fluidRow(
          
          br(), # espacio en blanco
          
          column(12,
                 div(class = "panel panel-danger", 
                     div(class = "panel-body",  width = "600px",
                         align = "center",
                         tags$style(type = 'text/css', HTML(
                           '.panel-body {background:#FFFFF0; font-family: Arial Black, Gadget, sans-serif;}'
                         )
                                    ),
                         div(
                           h1('¡ENHORABUENA!')
                         ),
                         
                         br(), # Espacio
                         
                         div(
                           tags$img(src = "acept.svg", 
                                    width = "125px", height = "125px")
                         ),
                         
                         br(), # Espacio
                         
                         div(
                           h2(
                             "Tras revisar su solicitud, nos complace comunicarle que su préstamo ha sido aceptado"
                           )
                         )
                     )
                 )
          )
        ),
        
        # Comunicacion --------------------------------
        fluidRow(
          
          br(), # espacio en blanco
          
          column(12,
                 div(class = "panel panel-danger", 
                     div(class = "panel-body",  width = "600px",
                         align = "center",
                         tags$style(type = 'text/css', HTML(
                           '.panel-body {background:#FFFFF0; font-family: Arial Black, Gadget, sans-serif;}'
                         )
                                ),
                         
                         br(), # Espacio
                         
                         div(
                           tags$img(src = "phone.svg", 
                                    width = "125px", height = "125px")
                         ),
                         
                         br(), # Espacio
                         
                         div(
                           h2(
                             "A continuación, nuestros responsables se pondrán en contacto para indicarle la formalización del préstamo"
                           )
                         )
                     )
                 )
          )
        ),
        
        # Boton para leer los datos ---------------------
        fluidRow(
          
          br(),
          
          column(3),
          column(6,
                 actionButton(inputId = 'finalizar', label = 'FINALIZAR'),
                 align = 'center',
                 tags$style(type = 'text/css', "#finalizar { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;
                            background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;}")
          ),
          column(3)
        )
      )
    )
  )
}
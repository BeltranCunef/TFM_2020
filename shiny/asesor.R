# Vista del asesor -------------------------------------
library(shinydashboard)

options(encoding = 'UTF-8')

asesor <- function(){
  
  appendTab(
    inputId = 'mainPanel',
    tab = tabPanel(
      title = 'VISTA ASESOR',
      value = 'vista_asesor',
      
      # Página del asesor ------------------------------
      fluidPage(
        
        # Separacion de texto --------------------------
        fluidRow(
          
          style = "height:50px;"),
        
        # Valores de variables importantes 1 -------------
        fluidRow(
          
          tags$style(".small-box.bg-yellow { background-color: #F5F5F5 !important; color: #000000 !important; border: 1px solid black;}"),
          
          align = 'center',
          
          # ext source 1
          valueBoxOutput('ext_source_1'),
          
          # ext source 2
          valueBoxOutput('ext_source_2'),
          
          # ext source 3
          valueBoxOutput('ext_source_3')
        ),
        
        # Separador -----------------------------------
        tags$hr(),
        
        # Valores de variables importantes 2 -------------
        fluidRow(
          
          tags$style(".small-box.bg-yellow { background-color: #F5F5F5 !important; color: #000000 !important; border: 1px solid black;}"),
          
          align = 'center',
          
          # payment rate
          valueBoxOutput('payment_rate'),
          
          # approved cnt payment mean
          valueBoxOutput('cnt_payment'),
          
          # amt annuity
          valueBoxOutput('amt_annuity')
        ),
        
        # Separador
        tags$hr(),
        
        # Graficos de los shap values
        fluidRow(
  
          # imagen 1
          column(
            12,
            align = 'center',
            tags$img(src = 'summary_plot1.png', width = '1000px',height = '1500px', class = "img-responsive center-block"),
          ),
        ),
        
        fluidRow(
          
          # imagen 2
          column(
            12,
            align = 'center',
            tags$img(src = 'summary_plot2.png', width = '1000px',height = '1500px', class = "img-responsive center-block"),
          )
        ),
        
        # Boton para cerrar ---------------------
        fluidRow(
          
          br(),
          
          column(3),
          column(6,
                 actionButton(inputId = 'cerrar_asesor', label = 'CERRAR'),
                 align = 'center',
                 tags$style(type = 'text/css', "#cerrar_asesor { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;
                            background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;}")
          ),
          column(3)
        ),
        
        # Separacion de texto --------------------------
        fluidRow(
          
          style = "height:50px;"),
      )
    )
  )
}
library(shiny)
library(readr)
source('carouselPanel.R')
options(encoding = 'UTF-8')

shinyUI(
  
  # Página base  -------------------------------------
  navbarPage(
    id = 'mainPanel',
    selected = 'home',
    position = 'static-top',
    title = div(span("CUNEF", style = 'color: white')),
    tags$style(type = 'text/css', HTML(
               ".navbar { background-color: #ec7301;}
                .navbar-brand { width: 250px; font-size:40px; text-align:center;}
                .navbar-default .navbar-nav > li > a {color:white; font-family: Arial Black, Gadget, sans-serif;}
                .navbar-default .navbar-nav > .active > a, 
                .navbar-default .navbar-nav > .active > a:focus,
                .navbar-default .navbar-nav > .active > a:hover {color: black;background-color: white;}
                .navbar-default .navbar-nav > li > a:hover {color: white;background-color:black;text-decoration:underline;}
                ")),
      
    # Sub Panel 1 ------------------------------------
    tabPanel(
      title = 'HOME',
      value = 'home',
      
      # # Titulo ---------------------------------------
      # fluidRow(
      #   column(3),
      #   column(6,
      #          shiny::HTML("<br><br><center><i><b><u><font size=40>Análisis de sensibilidad al precio</font></u></b></i></center><br>")
      #   ),
      #   column(3)
      # ),
      # 
      # # Autores y Director --------------------------
      # fluidRow(
      #   
      #   column(3),
      #   
      #   column(3,
      #          align = 'center',
      #          shiny::HTML("<h3><center>Alumnos<center></h3>"),
      #          shiny::HTML("<h4><center>Beltrán Aller López<center></h4>"),
      #          shiny::HTML("<h4><center>Juan Guerrero Villasante<center></h4>"),
      #          shiny::HTML("<h4><center>Miguel López Garralón<center></h4>")
      #          ),
      #   
      #   column(3,
      #          align = 'center',
      #          shiny::HTML("<h3><center>Director<center></h3>"),
      #          shiny::HTML("<h4><center>Gabriel Antonio Valverde Castilla<center></h4>")
      #          ),
      #   
      #   column(3)
      # ),
      # 
      # Separacion de texto --------------------------
      fluidRow(
        
        style = "height:50px;"),
        
      # Slides ----------------------------------------
      fluidRow(
        
        br(), # espacio en blanco entre el margen superior y la imagen
          
        carouselPanel(
          auto.advance = T,
          tags$img(src = 'img1.jpg', width = '1000px',height = '1500px', class = "img-responsive center-block"),
          tags$img(src = 'img3.jpg', width = '1000px',height = '1500px',class = "img-responsive center-block")
        )
        #HTML('<center><img src="https://img.freepik.com/vector-gratis/fondo-acuarela_220290-34.jpg?size=626&ext=jpg"></center>')
      ),
        
      # Separacion de texto --------------------------
      fluidRow(
        
        style = "height:50px;"),
        
      # Separador ------------------------------------
      tags$hr(),
        
      
      # Resumen / Claves TFM -----------------------------------
      fluidRow(
        shiny::HTML("<br><br><center> <h1>Las claves de nuestro TFM</h1> </center><br>")
      ),
      
      fluidRow(
        column(3),
        
        column(2,
               div(class = "panel panel-default", 
                   div(class = "panel-body",  width = "600px",
                       align = "center",
                       div(
                         tags$img(src = "uno.svg", 
                                  width = "50px", height = "50px")
                       ),
                       div(
                         h5(
                           "Shiny."
                         )
                       )
                   )
               )
        ),
        column(2,
               div(class = "panel panel-default",
                   div(class = "panel-body",  width = "600px", 
                       align = "center",
                       div(
                         tags$img(src = "dos.svg", 
                                  width = "50px", height = "50px")
                       ),
                       div(
                         h5(
                           "Investigación e ingeniería de variables."
                         )
                       )
                   )
               )
        ),
        column(2,
               div(class = "panel panel-default",
                   div(class = "panel-body",  width = "600px", 
                       align = "center",
                       div(
                         tags$img(src = "tres.svg", 
                                  width = "50px", height = "50px")),
                       div(
                         h5(
                           "Realización de un muy buen modelo."
                         )
                       )
                   )
               )
        ),
        column(3)
        
      ),
      
      # Separacion de texto --------------------------
      fluidRow(
        
        style = "height:50px;"),
      
      # Separador
      tags$hr(),
      
      # Boton para comenzar --------------------------
      fluidRow(
        column(3),
        column(6,
               shiny::HTML("<br><br><center> <h1>¿Preparados para comenzar?</h1> </center><br>"),
               actionButton(inputId = 'comenzar', label = 'COMENZAR'),
               align = 'center',
               tags$style(type = 'text/css', "#comenzar { vertical-align- middle; height- 100px; width- 150%; font-size- 50px;
                          background-color: #ec7301; border: 1px solid black; color: white; 
                          font-family: Arial Black, Gadget, sans-serif;")
               ),
        column(3)
      ),
        
      br(), # espacio en blanco entre el margen inferior y el boton
      
    )
  )
)
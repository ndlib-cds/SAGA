library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(
      title = "SAGA",
      tags$li(class = "dropdown", downloadLink("btn_export", span(icon("download"), " Export Responses"))),
    ),
    dashboardSidebar(
      disable = TRUE
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Is the alignment correct?", #this tab will be able about whether the gene detection is correct
          includeScript("www/img_size.js"),
          includeCSS("www/taipan.css"),
          column(6,
                 box(
            title = textOutput("out_img_info"),
            div(class = "taipan_image_div",
                imageOutput("out_img_overlay",
                            click = clickOpts(id = "img_click"),
                            dblclick = dblclickOpts(id = "img_dblclick"),
                            brush = brushOpts(id = "img_brush", stroke = "#00A65A", fill = "transparent", opacity = 1),
                            inline=TRUE),
                imageOutput("out_img",
                            inline = TRUE)
            ),
            width = 12,
            status = "primary",
            collapsible = TRUE
          ),
          uiOutput("ui_instructions")),

          column(6,
                 uiOutput("ui_questions"),
                 uiOutput("ui_btn_prev"),
                 uiOutput("ui_deleteSelection"),
                 uiOutput("ui_save"),
                 uiOutput("ui_btn_next")
          )
        ),
        tabItem(tabName = "Can this Gene be found in other species?", #this tab will be all about Blast hits
                h2("Other species content")
        ),
        tabItem(tabName = "What is this Genes function in other species?", #this tab will be about taking Accension numbers of similar genes and turning them into functions
                h2("function content")
        )
      )
    )
  )
)

data(mtcars)
lmfit <-lm(mpg~cyl+disp+hp+wt+am, data=mtcars)

shinyServer(
        function(input, output) {
                
                output$hp <- renderPrint({input$hp})
                output$cyl <- renderPrint({input$cyl})
                output$disp <- renderPrint({input$disp})
                output$wt <- renderPrint({input$wt})
                output$am <- renderPrint({input$am})
                output$pred <- renderPrint({
                        new_data <-data.frame(
                                "cyl"=input$cyl,
                                "disp"=input$disp, 
                                "hp"=input$hp, 
                                "wt"=input$wt, 
                                "am"=0)
                        predict(lmfit, new_data)})
        }
)
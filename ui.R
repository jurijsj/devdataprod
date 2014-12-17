library(shiny)
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Fuel consumption prediction (miles per galon)"),
                
                sidebarPanel(
                        helpText("Please input your car parameters here:"),
                        sliderInput('cyl', 'Number of cylinders:', value=4, min = 4, max = 8, step = 2),
                        sliderInput('disp', 'Displacement (cu.in.):', value=196.3, min = 71, max = 472, step=1),
                        numericInput('hp', 'Gross horsepower:', 123, min = 52, max = 335, step = 1),
                        sliderInput('wt', 'Weight (lb/1000):', value=3.325, min = 1.513, max = 5.424, step=0.001),
                        radioButtons('am', 'Transmission:', 
                                     list("Automatic" = "0",
                                          "Manual" = "1")),
                        submitButton('Submit')
                ),
                mainPanel(
                        
                        helpText("Note: prediction is based on mtcars datasets(Motor Trend Car Road Tests).",
                                 "Original dataset contains 10 predictors but",
                                 "after ANOVA test, 4 of them was used: cyl, wt, disp and am.",
                                 "For more information, please check",
                                ""),
                        helpText("Description: The data was extracted from the 1974 Motor Trend US magazine,",
                                " and comprises fuel consumption and 10 aspects of automobile design and", 
                                " performance for 32 automobiles (1973-74 models)."),
                        helpText("Original dataset contains 10 predictors but",
                                 "after ANOVA test, 4 of them was used: cyl, wt, disp and am.",
                                 "For more information, please check",
                                 ""),
                        h3('You entered'),
                        h5('Number of cylinders:'),
                        verbatimTextOutput("cyl"),
                        h5('Displacement (cu.in.):'),
                        verbatimTextOutput("disp"),
                        h5('Gross horsepower:'),
                        verbatimTextOutput("hp"),
                        h5('Weight (lb/1000):'),
                        verbatimTextOutput("wt"),
                        h3('Prediction'),
                        h4('Predicted fuel consumtion (ml/g):'),
                        verbatimTextOutput("pred")
                        
                )
        )
)
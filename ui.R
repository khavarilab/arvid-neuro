# This file defines the dashboard UI for the app

dash <-  dashboardPage(
    dashboardHeader(title = 'ARVID-Neuropsychiatry'),
    
    # Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem('Neuropsychiatry SNPs', tabName = 'data', icon = icon('database')),
        menuItem('Metadata', tabName = 'metadata', icon = icon('book-open')),
        menuItem('Additional Info', tabName = 'about', icon = icon('circle-info'))
    )),
    
    # Body content
    dashboardBody(
      tabItems(
      
        tabItem(
          tabName = 'arvid',
          tags$div(
            style = 'width:800px',
            tags$img(src = 'arvid_dna.jpeg', width = '800px', height = '300px'),
            tags$h3('Atlas of Regulatory Variants in Disease'),
            tags$p('Advancements in our ability to sequence the human genome, with its vast 3.2 billion nucleotide base pairs have shaped the modern era of medicine.
                    A major insight from these efforts is that the variations in our DNA sequence that confer unique traits also mediate the risk of developing common diseases, including cancer, neuropsychiatric disease, heart disease, stroke, dementia, diabetes, and autoimmunity.'),
            tags$p('Leveraging this insight to improve human health now represents the major challenge facing biomedicine. 
                    That is because studies linking DNA sequence-disease relationships only identify large regions of the genome correlated with disease risk, but they are too low resolution to illuminate the underlying pathologic mechanisms needed to identify therapeutic targets.'),
            tags$p('Additionally, multiple lines of data suggest that at least half of inherited disease risk occurs through DNA variants that alter the function of regulatory DNA.
                    The atlas of regulatory variants in disease (ARVID) aims to produce a resource of altered regulatory genomic variants in disease risk and putative target genes.
                    An atlas of functionally validated disease variants, the genes they control, and the proteins whose binding they alter will help understand, predict, and prevent common diseases.')
          )
          ),
        
        tabItem(
          tabName = 'data',
          h3('Neuropsychiatry CRE SNPs'),
          tags$br(),
          fluidRow(
            column(4,
                   selectInput('disease',
                               'Associated Disease:',
                               c('All',
                                 unique(as.character(df_studydata$`Associated Disease`))))
            ),
            column(4,
                   selectInput('atac',
                               'ATAC Activity:',
                               c('All',
                                 unique(as.character(df_studydata$`ATAC Activity`))))
            ),
            column(4,
                   selectInput('hichip',
                               'HiChIP Activity:',
                               c('All',
                                 unique(as.character(df_studydata$`HiChIP Activity`))))
            )
          ),
          # Create a new row for the table.
          dataTableOutput('studydata')
        ),
        
        tabItem(
          tabName = 'metadata',
          tags$div(
            tags$h3('Neuropsychiatry Study'),
            tags$p('This study performed MPRA on 2,221 noncoding variants in genomic regions linked to risk for 10 of the most common neuropsychiatric disorders in developing human neural cells.'),
            tags$p('A single-nucleotide resolution compendium of 892 functional, differentially-active SNVs (daSNVs) in regulatory DNA associated with neuropsychiatric disease were identified.'),
            tags$br(),
            tags$h4('Neuropsychiatric disorders studied'),    
            tableOutput('studymeta'),
            tags$h4('Data description'),
            tableOutput('columnmeta')
          )
        ),
        
        tabItem(
          tabName = 'about',
          tags$div(
            tags$h3('Additional Information'),
            tags$br(),
            tags$h4('Suggested Citation'),
            tags$p('Guo, Margaret G., et al. "Integrative analyses highlight functional regulatory variants associated with neuropsychiatric diseases." Nature Genetics 55.11 (2023): 1876-1891.'),
            tags$a(href = 'https://www.nature.com/articles/s41588-023-01533-5', 'Link to article'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$h4('Data Download'),
            tags$a(href = 'complete_data.csv', 'Download complete MPRA data', download = NA, target = '_blank'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$a(href = 'https://arvid-data.shinyapps.io/home/', 'Back to ARVID Home'),
            tags$br()
          )
        )
        
      )
    )
  )
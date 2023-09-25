Business Intelligence Lab Submission Markdown
================
<Shire>
\<9/21/2023\>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
  - [readr - Load datasets from CSV files
    —-](#readr---load-datasets-from-csv-files--)
- [Loading the Student Performance
  Dataset](#loading-the-student-performance-dataset)
  - [Description of the Dataset](#description-of-the-dataset)
- [\<You can Provide Another Appropriate Title Here if you
  wish\>](#you-can-provide-another-appropriate-title-here-if-you-wish)
  - [\<You Can Have a Sub-Title Here if you
    wish\>](#you-can-have-a-sub-title-here-if-you-wish)
  - [\<You Can Have Another Sub-Title Here if you
    wish\>](#you-can-have-another-sub-title-here-if-you-wish)
- [Computes the standard deviation for specific columns of the
  dataset](#computes-the-standard-deviation-for-specific-columns-of-the-dataset)
- [Computes the variance for specific columns of the
  dataset](#computes-the-variance-for-specific-columns-of-the-dataset)
- [Computes skewness for specific columns of the
  dataset](#computes-skewness-for-specific-columns-of-the-dataset)
- [Computes the covariance matrix for specific columns of the
  dataset](#computes-the-covariance-matrix-for-specific-columns-of-the-dataset)
- [Computes the correlation matrix for specific columns of the
  dataset](#computes-the-correlation-matrix-for-specific-columns-of-the-dataset)
- [Performs a one-way ANOVA analysis on the “TOTAL” variable based on
  the “Coursework” variable in the dataset and displays a summary of the
  analysis.](#performs-a-one-way-anova-analysis-on-the-total-variable-based-on-the-coursework-variable-in-the-dataset-and-displays-a-summary-of-the-analysis)
- [Creates a histogram of a specific variable
  (“student_performance_dataset_yield”) in the
  dataset.](#creates-a-histogram-of-a-specific-variable-student_performance_dataset_yield-in-the-dataset)
- [Creates a boxplot for selected variables in the
  dataset](#creates-a-boxplot-for-selected-variables-in-the-dataset)
- [Creates a barplot for one of the variables in the
  dataset](#creates-a-barplot-for-one-of-the-variables-in-the-dataset)
- [Checks if the “Amelia” package is installed and installs it if not.
  Then, it creates a missing data map (missmap) for the
  dataset](#checks-if-the-amelia-package-is-installed-and-installs-it-if-not-then-it-creates-a-missing-data-map-missmap-for-the-dataset)
- [Checks if the “corrplot” package is installed and installs it if
  not](#checks-if-the-corrplot-package-is-installed-and-installs-it-if-not)
- [Utilizes ggplot2 to create a scatter plot with a linear regression
  line](#utilizes-ggplot2-to-create-a-scatter-plot-with-a-linear-regression-line)
- [Checks if the “caret” package is installed and installs it if not.
  Then, it generates boxplots for specific columns against a target
  variable using the `featurePlot` function from the `caret`
  package.](#checks-if-the-caret-package-is-installed-and-installs-it-if-not-then-it-generates-boxplots-for-specific-columns-against-a-target-variable-using-the-featureplot-function-from-the-caret-package)

# Student Details

|                                                                                                                                                                                                                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Student ID Numbers and Names of Group Members \| \<136657 - C - Shirleen Murugi\> \| \| \| \| 1. ID - Class Group - Name \|Shirleen Murugi \| 136657 - C - \| \| 2. ID - Class Group - Name \|Rehema jemutai \| 135791 - C - \| 3. ID - Class Group - Name \| \| \| \| 4. ID - Class Group - Name \| \| \| \| 5. ID - Class Group - Name \| |
| GitHub Classroom Group Name \| \<Shire\> \|                                                                                                                                                                                                                                                                                                 |
| Course Code \| BBT4206 \|                                                                                                                                                                                                                                                                                                                   |
| Course Name \| Business Intelligence II \|                                                                                                                                                                                                                                                                                                  |
| Program \| Bachelor of Business Information Technology \|                                                                                                                                                                                                                                                                                   |
| Semester Duration \| 21<sup>st</sup> August 2023 to 28<sup>th</sup> November 2023 \|                                                                                                                                                                                                                                                        |

# Setup Chunk

We start by installing all the required packages

{r Install Packages, echo=TRUE, message=FALSE, warning=FALSE} \##
formatR - Required to format R code in the markdown —- if
(!is.element(“formatR”, installed.packages()\[, 1\])) {
install.packages(“formatR”, dependencies = TRUE,
repos=“<https://cloud.r-project.org>”) } require(“formatR”)

## readr - Load datasets from CSV files —-

if (!is.element(“readr”, installed.packages()\[, 1\])) {
install.packages(“readr”, dependencies = TRUE,
repos=“<https://cloud.r-project.org>”) } require(“readr”)

------------------------------------------------------------------------

Note: the following “KnitR” options have been set as the defaults in
this markdown:  
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy.opts = list(width.cutoff = 80), tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

{r setup, echo=TRUE, message=FALSE, warning=FALSE}
knitr::opts_chunk\$set( eval = TRUE, echo = TRUE, warning = FALSE,
collapse = FALSE, tidy = TRUE )

------------------------------------------------------------------------

Note: the following “R Markdown” options have been set as the defaults
in this markdown:

> output:  
>   
> github_document:  
> toc: yes  
> toc_depth: 4  
> fig_width: 6  
> fig_height: 4  
> df_print: default  
>   
> editor_options:  
> chunk_output_type: console

# Loading the Student Performance Dataset

The 20230412-20230719-BI1-BBIT4-1-StudentPerformanceDataset is then
loaded. The dataset and its metadata are available here:
<https://drive.google.com/drive/folders/1-BGEhfOwquXF6KKXwcvrx7WuZXuqmW9q?usp=sharing>

{r Load Dataset} student_performance_dataset \<- readr::read_csv(
“../data/20230412-20230719-BI1-BBIT4-1-StudentPerformanceDataset.CSV”,
col_types = readr::cols( class_group = readr::col_factor(levels = c(“A”,
“B”, “C”)), gender = readr::col_factor(levels = c(“1”, “0”)), YOB =
readr::col_date(format = “%Y”), regret_choosing_bi =
readr::col_factor(levels = c(“1”, “0”)), drop_bi_now =
readr::col_factor(levels = c(“1”, “0”)), motivator =
readr::col_factor(levels = c(“1”, “0”)), read_content_before_lecture =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)),
anticipate_test_questions = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”, “5”)), answer_rhetorical_questions = readr::col_factor(levels =
c(“1”, “2”, “3”, “4”, “5”)), find_terms_I_do_not_know =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)),
copy_new_terms_in_reading_notebook = readr::col_factor(levels = c(“1”,
“2”, “3”, “4”, “5”)), take_quizzes_and_use_results =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)),
reorganise_course_outline = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”, “5”)), write_down_important_points = readr::col_factor(levels =
c(“1”, “2”, “3”, “4”, “5”)), space_out_revision =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)),
studying_in_study_group = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”, “5”)), schedule_appointments = readr::col_factor(levels = c(“1”,
“2”, “3”, “4”, “5”)), goal_oriented = readr::col_factor(levels = c(“1”,
“0”)), spaced_repetition = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”)), testing_and_active_recall = readr::col_factor(levels = c(“1”,
“2”, “3”, “4”)), interleaving = readr::col_factor(levels = c(“1”, “2”,
“3”, “4”)), categorizing = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”)), retrospective_timetable = readr::col_factor(levels = c(“1”, “2”,
“3”, “4”)), cornell_notes = readr::col_factor(levels = c(“1”, “2”, “3”,
“4”)), sq3r = readr::col_factor(levels = c(“1”, “2”, “3”, “4”)), commute
= readr::col_factor(levels = c(“1”, “2”, “3”, “4”)), study_time =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”)), repeats_since_Y1 =
readr::col_integer(), paid_tuition = readr::col_factor(levels = c(“0”,
“1”)), free_tuition = readr::col_factor(levels = c(“0”, “1”)),
extra_curricular = readr::col_factor(levels = c(“0”, “1”)),
sports_extra_curricular = readr::col_factor(levels = c(“0”, “1”)),
exercise_per_week = readr::col_factor(levels = c(“0”, “1”, “2”, “3”)),
meditate = readr::col_factor(levels = c(“0”, “1”, “2”, “3”)), pray =
readr::col_factor(levels = c(“0”, “1”, “2”, “3”)), internet =
readr::col_factor(levels = c(“0”, “1”)), laptop =
readr::col_factor(levels = c(“0”, “1”)), family_relationships =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)), friendships =
readr::col_factor(levels = c(“1”, “2”, “3”, “4”, “5”)),
romantic_relationships = readr::col_factor(levels = c(“0”, “1”, “2”,
“3”, “4”)), spiritual_wellnes = readr::col_factor(levels = c(“1”, “2”,
“3”, “4”, “5”)), financial_wellness = readr::col_factor(levels = c(“1”,
“2”, “3”, “4”, “5”)), health = readr::col_factor(levels = c(“1”, “2”,
“3”, “4”, “5”)), day_out = readr::col_factor(levels = c(“0”, “1”, “2”,
“3”)), night_out = readr::col_factor(levels = c(“0”, “1”, “2”, “3”)),
alcohol_or_narcotics = readr::col_factor(levels = c(“0”, “1”, “2”,
“3”)), mentor = readr::col_factor(levels = c(“0”, “1”)), mentor_meetings
= readr::col_factor(levels = c(“0”, “1”, “2”, “3”)),
`Attendance Waiver Granted: 1 = Yes, 0 = No` = readr::col_factor(levels
= c(“0”, “1”)), GRADE = readr::col_factor(levels = c(“A”, “B”, “C”, “D”,
“E”))), locale = readr::locale())

## Description of the Dataset

We then display the number of observations and number of variables. We
have 101 observations and 100 variables to work with.

{r Your Fourth Code Chunk} dim(student_performance_dataset)

Next, we display the quartiles for each numeric
variable<span id="highlight" style="color: blue">… think of this process
as “storytelling using the data.” Tell us what is happening; tell us
what you are discovering as you proceed with the markdown; walk us
through your code step-by-step (a code walkthrough).</span>

{r Your Fifth Code Chunk} summary(student_performance_dataset)

# \<You can Provide Another Appropriate Title Here if you wish\>

Describe the code chunk here:

{r Your Sixth Code Chunk} sapply(student_performance_dataset, class)

## \<You Can Have a Sub-Title Here if you wish\>

{r Your Seventh Code Chunk} student_performance_dataset_freq \<-
student_performance_dataset\$GRADE cbind(frequency =
table(student_performance_dataset_freq), percentage =
prop.table(table(student_performance_dataset_freq)) \* 100)

## \<You Can Have Another Sub-Title Here if you wish\>

{r Your Eighth Code Chunk} student_performance_dataset_GRADE_mode \<-
names(table(student_performance_dataset$GRADE))[  which(table(student_performance_dataset$GRADE)
== max(table(student_performance_dataset\$GRADE))) \]
print(student_performance_dataset_GRADE_mode)

{r Your nineth Code Chunk} summary(student_performance_dataset)

# Computes the standard deviation for specific columns of the dataset

{r Your Tenth Code Chunk} sapply(student_performance_dataset\[, 1\], sd)
sapply(student_performance_dataset\[, 96:99\], var)

# Computes the variance for specific columns of the dataset

{r Your Eleventh Code Chunk} sapply(student_performance_dataset\[,
96:99\], var) \# It calculates kurtosis for specific columns of the
dataset {r Your 12th Code Chunk} if (!is.element(“e1071”,
installed.packages()\[, 1\])) { install.packages(“e1071”, dependencies =
TRUE) } require(“e1071”) sapply(student_performance_dataset\[, 96:99\],
kurtosis, type = 2)

# Computes skewness for specific columns of the dataset

{r Your 13th Code Chunk} sapply(student_performance_dataset\[, 96:99\],
skewness, type = 2)

# Computes the covariance matrix for specific columns of the dataset

{r Your 14th Code Chunk} student_performance_dataset_cov \<-
cov(student_performance_dataset\[, 96:99\])
View(student_performance_dataset_cov)

# Computes the correlation matrix for specific columns of the dataset

{r Your 15th Code Chunk} student_performance_dataset_cor \<-
cor(student_performance_dataset\[, 96:99\])
View(student_performance_dataset_cor)

# Performs a one-way ANOVA analysis on the “TOTAL” variable based on the “Coursework” variable in the dataset and displays a summary of the analysis.

{r Your 16th Code Chunk} student_performance_dataset_one_way_anova \<-
aov(TOTAL ~ Coursework , EXAM = student_performance_dataset)
summary(student_performance_dataset_one_way_anova)

# Creates a histogram of a specific variable (“student_performance_dataset_yield”) in the dataset.

{r Your 17th Code Chunk} student_performance_dataset_yield \<-
as.numeric(unlist(student_performance_dataset\[, 4\]))
hist(student_performance_dataset_yield, main =
names(student_performance_dataset)\[4\])

# Creates a boxplot for selected variables in the dataset

{r Your 18th Code Chunk} par(mfrow = c(1, 3)) for (i in 1:3) {
boxplot(student_performance_dataset\[, i\], main =
names(student_performance_dataset)\[i\]) }
boxplot(student_performance_dataset\[, 96\], main =
names(student_performance_dataset)\[96\])
boxplot(student_performance_dataset\[, 97\], main =
names(student_performance_dataset)\[97\])
boxplot(student_performance_dataset\[, 98\], main =
names(student_performance_dataset)\[98\])

# Creates a barplot for one of the variables in the dataset

{r Your 19th Code Chunk} barplot(table(student_performance_dataset\[,
96\]), main = names(student_performance_dataset)\[96\])

# Checks if the “Amelia” package is installed and installs it if not. Then, it creates a missing data map (missmap) for the dataset

{r Your 20th Code Chunk} if (!is.element(“Amelia”,
installed.packages()\[, 1\])) { install.packages(“Amelia”, dependencies
= TRUE) } require(“Amelia”)

missmap(student_performance_dataset, col = c(“red”, “grey”), legend =
TRUE)

# Checks if the “corrplot” package is installed and installs it if not

{r Your 21st Code Chunk} if (!is.element(“corrplot”,
installed.packages()\[, 1\])) { install.packages(“corrplot”,
dependencies = TRUE) } require(“corrplot”)
corrplot(cor(student_performance_dataset\[, 96\]), method = “circle”)

# Utilizes ggplot2 to create a scatter plot with a linear regression line

{r Your 22nd Code Chunk} ggplot(student_performance_dataset, aes(x =
health, y = mentor,color = mentor_meetings)) + geom_point() +
geom_smooth(method = lm)

# Checks if the “caret” package is installed and installs it if not. Then, it generates boxplots for specific columns against a target variable using the `featurePlot` function from the `caret` package.

{r Your 23rd Code Chunk} if (!is.element(“caret”,
installed.packages()\[, 3\])) { install.packages(“caret”, dependencies =
TRUE) } require(“caret”) featurePlot(x = student_performance_dataset\[,
43:47\], y = student_performance_dataset\[, 5\], plot = “box”)

etc. as per the lab submission requirements. Be neat and communicate in
a clear and logical manner.

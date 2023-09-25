if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")
renv::init()
renv::restore()
if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

library(readr)
student_performance_dataset <-
  readr::read_csv(
    "data/20230412-20230719-BI1-BBIT4-1-StudentPerformanceDataset.CSV", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance Waiver Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())


## Description of the Dataset

#We then display the number of observations and number of variables. We have 101 observations and 100 variables to work with.

#{r Your Fourth Code Chunk}
dim(student_performance_dataset)


#Next, we display the quartiles for each numeric variable[*... think of this process as **"storytelling using the data."** Tell us what is happening; tell us what you are discovering as you proceed with the markdown; walk us through your code step-by-step (a code walkthrough).*]{#highlight style="color: blue"}
  
  #```{r Your Fifth Code Chunk}
  summary(student_performance_dataset)
  #```
  
  # \<You can Provide Another Appropriate Title Here if you wish\>
  
  #Describe the code chunk here:
    
   # ```{r Your Sixth Code Chunk}
  # Fill this with R related code that will be executed when the R markdown file
  #```
  sapply(student_performance_dataset, class)
  
  ## \<You Can Have a Sub-Title Here if you wish\>
  
  #```{r Your Seventh Code Chunk}
  # Fill this with other R related code that will be executed when the R markdown
  #```
  
  student_performance_dataset_freq <- student_performance_dataset$GRADE 
  cbind(frequency = table(student_performance_dataset_freq),
        percentage = prop.table(table(student_performance_dataset_freq)) * 100)
  
  
  ## \<You Can Have Another Sub-Title Here if you wish\>
  
  #```{r Your Eighth Code Chunk}
  # Fill this with other R related code that will be executed when the R markdown
  #```
  student_performance_dataset_GRADE_mode <- names(table(student_performance_dataset$GRADE))[
    which(table(student_performance_dataset$GRADE) == max(table(student_performance_dataset$GRADE)))
  ]
  print(student_performance_dataset_GRADE_mode)
  
  #step 9
  
  summary(student_performance_dataset)
  
  #step 10
  sapply(student_performance_dataset[, 1], sd)
  #sapply(student_performance_dataset[, c(2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50)], sd)
  sapply(student_performance_dataset[, c(97, 96, 99)], sd)
  #step 11
  sapply(student_performance_dataset[, 96:99], var)
  #step 12
  if (!is.element("e1071", installed.packages()[, 1])) {
    install.packages("e1071", dependencies = TRUE)
  }
  require("e1071")
  sapply(student_performance_dataset[, 96:99],  kurtosis, type = 2)
  #step 13
  sapply(student_performance_dataset[, 96:99],  skewness, type = 2)
  #step 14
  student_performance_dataset_cov <- cov(student_performance_dataset[, 96:99])
  View(student_performance_dataset_cov)
  #step 15
  student_performance_dataset_cor <- cor(student_performance_dataset[, 96:99])
  View(student_performance_dataset_cor)
  #step 16
  #student_performance_dataset_one_way_anova <- aov(TOTAL ~ Coursework , EXAM = student_performance_dataset)
  #summary(student_performance_dataset_one_way_anova)
  
  #step 17
  #par(mfrow = c(96, 99))
  #for (i in 96:99) {
   #hist(student_performance_dataset[, i], main = names(student_performance_dataset)[i])
  #}
  #hist(student_performance_dataset[, 96], main = names(student_performance_dataset)[96])
  #hist(student_performance_dataset[, 97], main = names(student_performance_dataset)[97])
  #hist(student_performance_dataset[, 99], main = names(student_performance_dataset)[99])
  
  student_performance_dataset_yield <- as.numeric(unlist(student_performance_dataset[, 4]))
  hist(student_performance_dataset_yield, main = names(student_performance_dataset)[4])
  
  #step 18
  par(mfrow = c(1, 3))
  for (i in 1:3) {
    boxplot(student_performance_dataset[, i], main = names(student_performance_dataset)[i])
  }
  boxplot(student_performance_dataset[, 96], main = names(student_performance_dataset)[96])
  boxplot(student_performance_dataset[, 97], main = names(student_performance_dataset)[97])
  boxplot(student_performance_dataset[, 98], main = names(student_performance_dataset)[98])
  
  #step 19
  barplot(table(student_performance_dataset[, 96]), main = names(student_performance_dataset)[96])
  
  #step 20
  if (!is.element("Amelia", installed.packages()[, 1])) {
    install.packages("Amelia", dependencies = TRUE)
  }
  require("Amelia")
  
  missmap(student_performance_dataset, col = c("red", "grey"), legend = TRUE)
  
  #step 21
  if (!is.element("corrplot", installed.packages()[, 1])) {
    install.packages("corrplot", dependencies = TRUE)
  }
  require("corrplot")
  corrplot(cor(student_performance_dataset[, 96]), method = "circle")
  
  #step 22
  ggplot(student_performance_dataset,
         aes(x = health
, y = mentor,color = mentor_meetings)) #shape = interleaving, #color = exam)) +
    geom_point() +
    geom_smooth(method = lm)
  
  #step 23
  if (!is.element("caret", installed.packages()[, 3])) {
    install.packages("caret", dependencies = TRUE)
  }
  require("caret")
  featurePlot(x = student_performance_dataset[, 43:47], y = student_performance_dataset[, 5], plot = "box")
  
  #**etc.** as per the lab submission requirements. Be neat and communicate in a clear and logical manner.
  
  
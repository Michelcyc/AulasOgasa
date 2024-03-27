source("https://raw.githubusercontent.com/cefet-rj-dal/harbinger-examples/main/jupyter.R")
load_library("daltoolbox")
load_library("harbinger")

print_Eval <- function(softEval) {
  cat("TPs:", softEval$TPs, "\n")
  cat("FPs:", softEval$FPs, "\n")
  cat("FNs:", softEval$FNs, "\n")
  cat("TNs:", softEval$TNs, "\n")
  cat("Accuracy:", softEval$accuracy, "\n")
  cat("Sensitivity:", softEval$sensitivity, "\n")
  cat("Specificity:", softEval$specificity, "\n")
  cat("Prevalence:", softEval$prevalence, "\n")
  cat("PPV:", softEval$PPV, "\n")
  cat("NPV:", softEval$NPV, "\n")
  cat("Detection Rate:", softEval$detection_rate, "\n")
  cat("Detection Prevalence:", softEval$detection_prevalence, "\n")
  cat("Balanced Accuracy:", softEval$balanced_accuracy, "\n")
  cat("Precision:", softEval$precision, "\n")
  cat("Recall:", softEval$recall, "\n")
  cat("F1 Score:", softEval$F1, "\n")
}

print_Eval_Comparison <- function(eval1, eval2) {
  cat("Accuracy difference:", eval1$accuracy - eval2$accuracy, "\n")
  cat("Sensitivity difference:", eval1$sensitivity - eval2$sensitivity, "\n")
  cat("Specificity difference:", eval1$specificity - eval2$specificity, "\n")
  cat("Prevalence difference:", eval1$prevalence - eval2$prevalence, "\n")
  cat("PPV difference:", eval1$PPV - eval2$PPV, "\n")
  cat("NPV difference:", eval1$NPV - eval2$NPV, "\n")
  cat("Detection Rate difference:", eval1$detection_rate - eval2$detection_rate, "\n")
  cat("Detection Prevalence difference:", eval1$detection_prevalence - eval2$detection_prevalence, "\n")
  cat("Balanced Accuracy difference:", eval1$balanced_accuracy - eval2$balanced_accuracy, "\n")
  cat("Precision difference:", eval1$precision - eval2$precision, "\n")
  cat("Recall difference:", eval1$recall - eval2$recall, "\n")
  cat("F1 Score difference:", eval1$F1 - eval2$F1, "\n")
}

data("har_examples")
dataset <- har_examples[[3]]

indexDaSerie <- 1:length(dataset$serie)
plot_ts(x=indexDaSerie, y=dataset$serie)

#dal_model <- ts_mlp(preprocess = ts_norm_gminmax(), input_size = 5, size = 3, decay = 0)
har_model <- hanr_arima()
har_fitted_model <- fit(har_model, dataset$serie)
fitted_detection_model <- detect(obj = har_fitted_model, dataset$serie)
grf <- har_plot(har_fitted_model, dataset$serie, fitted_detection_model, dataset$event)
plot(grf)

hardEval <- evaluate(har_eval(), fitted_detection_model$event, dataset$event)
print_Eval(hardEval)

softEval <- evaluate(har_eval_soft(), fitted_detection_model$event, dataset$event)
print_Eval(softEval)

print_Eval_Comparison(softEval, hardEval)

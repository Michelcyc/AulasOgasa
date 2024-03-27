source("https://raw.githubusercontent.com/cefet-rj-dal/harbinger-examples/main/jupyter.R")
load_library("daltoolbox")
load_library("harbinger")

source("my_utils.R")
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

election <- data.frame(
  Name = c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Berine"),
  ABC = c(4, 62, 51, 21, 2, 14, 15),
  CBS = c(12, 75, 43, 19, 1, 21, 19) 
)
print(summary(election))

#fetching only abc polldata into vector from dataframe
abc_poll = election$ABC
print(abc_poll)

#fetching only cbs polldata into vector from dataframe
cbs_poll = election$CBS
print(cbs_poll)

c(4, 62, 51, 21, 2, 14, 15)

#processing abc poll data
abc_poll_percent=c()
for(result in abc_poll) {
  percentResult = result/sum(abc_poll)*100
  percentResult = round(percentResult,digits = 2)
  abc_poll_percent=append(abc_poll_percent,percentResult)
}
print(abc_poll_percent)


#processing cbs poll data
cbs_poll_percent=c()
for (result in cbs_poll) {
  percentResult = result/sum(cbs_poll)*100
  percentResult = round(percentResult,digits = 2)
  cbs_poll_percent=append(cbs_poll_percent,percentResult)
}
print(cbs_poll_percent)

#Calculating avg poll results
it = 1
avg_poll_result = c()
avg_poll_result_numeric = c()
for(x in cbs_poll_percent){
  abc_percent = abc_poll_percent[it]
  cbs_percent = cbs_poll_percent[it]
  avg_percent = (abc_percent+cbs_percent)/2
  num = round(avg_percent)
  avg_poll_result = append(avg_poll_result,avg_percent)
  avg_poll_result_numeric = append(avg_poll_result_numeric,num)
  it = it + 1;
}
print(avg_poll_result)

#creating new dataframe with final results
election_prediction = election
#election_prediction$ABC_PollPrediction <- abc_poll_percent
#election_prediction$CBS_PollPrediction <- cbs_poll_percent
election_prediction$Final_PollPrediction <- avg_poll_result
election_prediction$Final_PollPrediction_num <- avg_poll_result_numeric
print(election_prediction)

#plotting into Pie Chart for the visual representation
pie(election_prediction$Final_PollPrediction_num,labels=as.character(election_prediction$Name))



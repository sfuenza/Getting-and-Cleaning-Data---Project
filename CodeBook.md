#CodeBook

##Steps taken

* First, we read the test and train files and with merge them using rbind
* Then we just get the columns that have "mean" and "data" in their name and we update the column names
* We update the Y data with the activities set (includind column name)
* We update the Subject data with Subject name
* Finally, we generate the whole data set merging the datas and we write calling it "mean_data_project.txt"

##Variables used

* Data downloaded: train_x, train_y, train_sub and test_x, test_y, test_sub
* Merged train and test: X_data, Y_data, sub_data
* feat is the names of the X_data obtained of the downloaded file
* activ is the names of the Y_data obtained of the downloaded file
* Full_data is the merge of "X_data", "Y_data" and "sub_data" after the changes and updates of the names
* mean_data is the data set that includes the mean of every data column of Full_data (except the ones that doesnt have numbers)

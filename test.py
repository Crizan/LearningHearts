import csv
import random
import math
import sys

def loadcsv(filename):
    lines = csv.reader(open(filename, "r"))
    dataset = list(lines)
    for i in range(len(dataset)):
        dataset[i] = [float(x) for x in dataset[i]]
    return dataset

def splitdataset(dataset, splitratio):
    trainsize = int(len(dataset) * splitratio)
    trainset = []
    copy = list(dataset)
    while len(trainset) < trainsize:
        index = random.randrange(len(copy))
        trainset.append(copy.pop(index))
    return [trainset, copy]

def separatebyclass(dataset):
    separated = {}
    for i in range(len(dataset)):
        vector = dataset[i]
        if vector[-1] not in separated:
            separated[vector[-1]] = []
        separated[vector[-1]].append(vector)
    return separated


def mean(numbers):
    mean = sum(numbers) / float(len(numbers))
    return mean


def stdev(numbers):
    avg = mean(numbers)
    variance = sum([pow(x-avg,2) for x in numbers])/float(len(numbers)-1)
    return math.sqrt(variance)


def summarize(dataset):
    summaries = [(mean(attribute), stdev(attribute)) for attribute in zip(*dataset)]
    del summaries[-1]
    return summaries


def summarizebyclass(dataset):
    separated = separatebyclass(dataset)
    summaries = {}
    for classValue, instances in separated.items():
        summaries[classValue] = summarize(instances)
    return summaries


def calculateProbablity(x, mean, stdev):
    exponent = math.exp(-(math.pow(x - mean, 2) / (2 * math.pow(stdev, 2))))
    probablity = (1 / (math.sqrt(2 * math.pi) * stdev)) * exponent
    return probablity


def calculateClassProbablities(summaries, inputVector):
    probablities = {}
    for classValue, classSummaries in summaries.items():
        probablities[classValue] = 1
        for i in range(len(classSummaries)):
            mean, stdev = classSummaries[i]
            x = inputVector[i]
            probablities[classValue] *= calculateProbablity(x, mean, stdev)
    return probablities


def predict(summaries, inputVector):
    probablities = calculateClassProbablities(summaries,inputVector)
    bestLabel, bestProb = None, -1
    for classValue, probablity in probablities.items():
        if bestLabel is None or probablity > bestProb:
            bestProb = probablity
            bestLabel = classValue           
    return bestLabel


def getpredictions(summaries, testSet):
    predictions = []
    for i in range(len(testSet)):
        result = predict(summaries,testSet[i])
        predictions.append(result)
    return predictions


def getaccuracy(testSet, predictions):
    correct = 0
    for x in range(len(testSet)):
        if testSet[x][-1] == predictions[x]:
            correct += 1
    return (correct / float(len(testSet))) * 100.0


def main():
    dataset = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\MedicalData.csv")
    testset = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\testset.csv")
    summaries = summarizebyclass(dataset)
    predictions = getpredictions(summaries, testset)
    print(predictions)
    accuracy = getaccuracy(testset,predictions)
    ageset= loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\age.csv")
    print(ageset)
    sbpset = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\sbp.csv")
    print(sbpset)
    dbpset = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\dbp.csv")
    print(dbpset)
    cholset = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\chol.csv")
    print(cholset)
    hao = loadcsv("C:\\Users\\krijan\\Documents\\Eclispes\\LearningHeart\\hao.csv")
    print(hao)   

main()

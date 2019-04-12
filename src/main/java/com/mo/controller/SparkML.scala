package com.mo.controller

import org.apache.spark.mllib.classification.{LogisticRegressionWithLBFGS, LogisticRegressionModel}
import org.apache.spark.mllib.regression.LabeledPoint
import org.apache.spark.mllib.linalg.{Vector, Vectors}
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.log4j.{Level, Logger}
import org.apache.spark.mllib.evaluation.MulticlassMetrics
import org.apache.spark.mllib.regression.LinearRegressionModel
import org.apache.spark.mllib.regression.LinearRegressionWithSGD

class SparkML {


  def sparkML(Pregnancies: Double, Glucose: Double, BloodPressure: Double, SkinThickness: Double, Insulin: Double, BMI: Double, DiabetesPedigreeFunction: Double, Age: Double): Double = {
    //屏蔽不必要的日志显示在终端上
    Logger.getLogger("org.apache.spark").setLevel(Level.WARN)
    Logger.getLogger("org.apache.eclipse.jetty.server").setLevel(Level.OFF)

    val conf = new SparkConf().setMaster("local").setAppName("Mo") //设置环境变变量
    val sc = new SparkContext(conf)
    val data = sc.textFile("G://txt_Test_dir//MoD.txt") //设置数据集
    println(data.count())
    val parseData = data.map { line =>
      val parts = line.split(',')
      LabeledPoint(parts(8).toInt, Vectors.dense(Array(parts(0).toDouble, parts(1).toDouble, parts(2).toDouble, parts(3).toDouble, parts(4).toDouble, parts(5).toDouble, parts(6).toDouble, parts(7).toDouble)))
    }.cache()
    val splits = parseData.randomSplit(Array(0.6, 0.4), seed = 11L) //把测试集分为两部分一部分用来做训练集一部分做校验集

    val trainingData = splits(0)
    //训练集
    val testData = splits(1) //测试集
    println(trainingData.count, testData.count)
    testData.foreach(println)
    val model = new LogisticRegressionWithLBFGS().setNumClasses(2).run(trainingData) //创建训练模型LBFGS梯度法

    //计算测试值，
    val labelAndPreds = testData.map { point =>
      val prediction = model.predict(point.features)
      (point.label, prediction) //存储测试值和预计值
    }
    println(model.weights)
    labelAndPreds.foreach(println)
    val trainErr = labelAndPreds.filter(r => r._1 != r._2).count.toDouble / testData.count
    println("容错率为trainErr： " + trainErr)

    val predictionAndLabels = testData.map { //计算测试值
      case LabeledPoint(label, features) =>
        val prediction = model.predict(features)
        (prediction, label) //存储测试值和预测值
    }
    val metrics = new MulticlassMetrics(predictionAndLabels) //创建验证类
    val precision = metrics.accuracy //计算验证值
    println("Precision1= " + precision)

    val patient = Vectors.dense(Array(Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age)) //计算患者可能性
    println(patient)
    val pro = model.predict(patient) //患病概率

    return pro
  }
}

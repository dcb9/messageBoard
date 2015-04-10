<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class BobtestController extends Controller
{
    public function actionIndex()
    {
	$sql = "select * from bobtest limit 9999999";        
	$data = Yii::$app->db->createCommand($sql)->all();
	var_dump($sql);
	var_dump($data);
    }

    public function actionI()
    {
	    $sql = "insert into bobtest (name) values ('aaaa')";
	    $data = Yii::$app->db->createCommand($sql)->execute();
	    var_dump($sql);
	var_dump($data);
    }
}

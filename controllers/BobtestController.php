<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
    public function actionIndex()
    {
	$sql = "select * from bobtest limit 9999999";        
	// $data = Yii::$app->db->createCommand($sql)->execute();
	var_dump($sql);
    }

    public function actionI()
    {
	    $sql = "insert into bobtest (name) values ('aaaa'. date('Y-m-d H:i:s'))";
	    // $data = Yii::$app->db->createCommand($sql)->execute();
	    var_dump($sql);
    }
}

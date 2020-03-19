<?php 

$is_auth = rand(0, 1);

$user_name = 'Vladislav'; // укажите здесь ваше имя

$categori_mass = array("boards"=>"Доски и лыжи", "attachment"=>"Крепления", "boots"=>"Ботинки", 
"clothing"=>"Одежда", "tools"=>"Инструменты", "other"=>"Разное");

$items_massive = array(
    array("LotName" => "2014 Rossignol District Snowboard", "LotCategori" => "Доски и лыжи", "LoTPrice" => 10999, "LotImage" => "img/lot-1.jpg"), 
    array("LotName" => "DC Ply Mens 2016/2017 Snowboard", "LotCategori" => "Доски и лыжи", "LoTPrice" => 159999, "LotImage" => "img/lot-2.jpg"),
    array("LotName" => "Крепления Union Contact Pro 2015 года размер L/XL", "LotCategori" => "Крепления", "LoTPrice" => 8000, "LotImage" => "img/lot-3.jpg"),
    array("LotName" => "Ботинки для сноуборда DC Mutiny Charocal", "LotCategori" =>  "Ботинки", "LoTPrice" => 10999, "LotImage" => "img/lot-4.jpg"),
    array("LotName" => "Куртка для сноуборда DC Mutiny Charocal", "LotCategori" =>   "Одежда", "LoTPrice" => 7500, "LotImage" => "img/lot-5.jpg"),
    array("LotName" => "Маска Oakley Canopy", "LotCategori" =>"Разное", "LoTPrice" => 5400, "LotImage" => "img/lot-6.jpg")
);

$name_of_title = "YetiCave";

function num_formation($number, $ruble_mark)
{
    $number = ceil($number);
    
    if($number<1000)
        $first = $number;
    else
        $first = number_format($number,0,""," ");

    if($ruble_mark==true)
        $first .='<b class="rub">р</b>';
        
        return $first;
}  

function include_template($file_name, $file_data) 
{
    $file_name = "C:/OSPanel/domains/yeticave/templates/$file_name";

    $result = 'ddsdsd';

    

    ob_start();
    extract($file_data);
    require($file_name);
    $result = ob_get_clean();
    return $result;
}
?>
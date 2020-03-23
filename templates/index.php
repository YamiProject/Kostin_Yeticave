<section class="promo">


        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <!--заполните этот список из массива категорий-->
            <?php
            foreach($categori_mass as $key => $cathegori)
            {
            ?>
            <li class="promo__item promo__item--<?=$key?>">
                <a a class="promo__link" href="pages/all-lots.html"><?= $cathegori ?></a>
            </li>
            <?php
            }
            ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <!--заполните этот список из массива с товарами-->
            <?php
            foreach($items_massive as $lot_info)
            {
            ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?= $lot_info["LotImage"]?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?= $lot_info["LotCategori"] ?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= $lot_info["LotName"] ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?= num_formation($lot_info["LoTPrice"],true) ?></span>
                        </div>
                        <div class="lot__timer timer">
                            <?= GetTimeFromFunction()?>
                        </div>
                    </div>
                </div>
            </li>
            <?php
            }
            ?>
        </ul>
    </section>
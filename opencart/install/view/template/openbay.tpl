<?php echo $header; ?>
<div class="container" xmlns="http://www.w3.org/1999/html">
  <header>
    <div class="row">
      <div class="col-sm-6" style="direction: rtl;">
        <h3><?php echo $heading_openbay; ?><br><small><?php echo $heading_openbay_small; ?></small></h3>
      </div>
      <div class="col-sm-6" style="direction: rtl;">
        <div id="logo" class="pull-right hidden-xs">
          <img src="view/image/logo.png" alt="OpenCart" title="OpenCart" />
        </div>
      </div>
    </div>
  </header>
  <div class="row">
    <div class="col-sm-12">
      <form>
        <fieldset class="core-modules">
            <div class="row">
              <div class="col-sm-6 text-center">
                <img src="view/image/ebay.png">
                <p style="direction: rtl;"><?php echo $text_ebay_about; ?></p>
                <a href="https://account.openbaypro.com/ebay/apiRegister" class="btn btn-primary" target="_blank"><?php echo $button_register; ?></a>
              </div>
              <div class="col-sm-6 text-center">
                <img src="view/image/amazon.png">
                <p style="direction: rtl;"><?php echo $text_amazon_about; ?></p>
                <a href="https://account.openbaypro.com/amazon/apiRegister" class="btn btn-primary" target="_blank"><?php echo $button_register_eu; ?></a>
                <a href="https://account.openbaypro.com/amazonus/apiRegister" class="btn btn-primary" target="_blank"><?php echo $button_register_us; ?></a>
              </div>
            </div>
        </fieldset>
        <div class="buttons">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        </div>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>
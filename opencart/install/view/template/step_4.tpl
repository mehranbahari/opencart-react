<?php echo $header; ?>
<div class="container" style="direction:rtl;">
  <header>
    <div class="row">
      <div class="col-sm-6" style="direction:rtl;">
        <h1 class="pull-left">4<small>/4</small></h1>
        <h3><?php echo $heading_step_4; ?><br>
          <small><?php echo $heading_step_4_small; ?></small></h3>
      </div>
      <div class="col-sm-6" style="direction:rtl;">
        <div id="logo" class="pull-right hidden-xs"> <img src="view/image/logo.png" alt="OpenCart" title="OpenCart" /> </div>
      </div>
    </div>
  </header>
  <?php if ($success) { ?>
  <div class="alert alert-success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="alert alert-danger" style="direction:rtl;"><?php echo $text_forget; ?></div>
  <div class="visit">
    <div class="row">
      <div class="col-sm-5 col-sm-offset-1 text-center"> <img src="view/image/icon-store.png"> <a class="btn btn-secondary" href="../"><?php echo $text_shop; ?></a> </div>
      <div class="col-sm-5 text-center"> <img src="view/image/icon-admin.png"> <a class="btn btn-secondary" href="../admin/"><?php echo $text_login; ?></a> </div>
    </div>
  </div>
  <div class="language" id="module-language" style="display:none;"></div>
  <div class="modules" style="display:none;">
    <div class="row" id="modules-loading">
      <div class="col-sm-12">
        <h2 class="text-center"><i class="fa fa-circle-o-notch fa-spin"></i> <?php echo $text_loading; ?></h2>
      </div>
    </div>
    <div class="row" id="modules" style="display:none;"></div>
    <div class="row">
      <div class="col-sm-12 text-center"> <a class="btn btn-default" href="http://www.opencart.com/index.php?route=extension/extension" target="_BLANK"><?php echo $text_store; ?></a> </div>
    </div>
  </div>
  <div class="mailing-list" style="display:none;">
    <div class="row">
      <div class="col-sm-12"> <img src="view/image/icon-mail.png">
        <h3><?php echo $text_mail_list; ?><br>
          <small><?php echo $text_mail_list_small; ?></small></h3>
        <a class="btn btn-secondary" href="http://newsletter.opencart.com/h/r/B660EBBE4980C85C" target="_BLANK"><?php echo $button_join; ?></a> </div>
    </div>
  </div>
  <div class="core-modules">
    <div class="row">
      <div class="col-sm-6 text-center"> <img src="view/image/openbay_pro.gif">
        <p><?php echo $text_openbay; ?> <a href="http://www.openbaypro.com"><?php echo $text_more_info; ?></a></p>
        <a class="btn btn-primary" href="<?php echo $link_openbay; ?>"><?php echo $button_setup; ?></a> </div>
      <div class="col-sm-6 text-center"> <img src="view/image/maxmind.gif">
        <p><?php echo $text_maxmind; ?> <a href="http://www.maxmind.com"><?php echo $text_more_info; ?></a><br><br></p>
        <a class="btn btn-primary" href="<?php echo $link_maxmind; ?>"><?php echo $button_setup; ?></a> </div>
    </div>
  </div>
  <div class="support text-center">
    <div class="row">
      <div class="col-sm-4"> <a href="https://www.facebook.com/opencart.ir" class="icon transition"> <i class="fa fa-facebook fa-4x"></i> </a>
        <h3><?php echo $text_facebook; ?></h3>
        <p><?php echo $text_facebook_info; ?></p>
        <a href="https://www.facebook.com/opencart.ir"><?php echo $text_facebook_link; ?></a> </div>
      <div class="col-sm-4"> <a href="http://forum.opencart.ir" class="icon transition"> <i class="fa fa-comments fa-4x"></i> </a>
        <h3><?php echo $text_forum; ?></h3>
        <p><?php echo $text_forum_info; ?></p>
        <a href="http://forum.opencart.ir"><?php echo $text_forum_link; ?></a> </div>
      <div class="col-sm-4"> <a href="http://opencart.ir/dashboard" class="icon transition"> <i class="fa fa-user fa-4x"></i> </a>
        <h3><?php echo $text_commercial; ?></h3>
        <p><?php echo $text_commercial_info; ?></p>
        <a href="http://opencart.ir/dashboard" target="_BLANK"><?php echo $text_commercial_link; ?></a> </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 

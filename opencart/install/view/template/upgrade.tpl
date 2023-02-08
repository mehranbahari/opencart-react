<?php echo $header; ?>
<div class="container">
  <header>
    <div class="row">
      <div class="col-sm-6" style="direction:rtl;">
        <h1 class="pull-left">1<small>/2</small></h1>
        <h3>آپگرید<br><small>فروشگاه خود را  به نسخه جدید آپگرید نمایید.</small></h3>
      </div>
      <div class="col-sm-6" style="direction:rtl;">
        <div id="logo" class="pull-right hidden-xs">
          <img src="view/image/logo.png" alt="OpenCart" title="OpenCart" />
        </div>
      </div>
    </div>
  </header>
  <div class="row">
    <div class="col-sm-9">
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset style="direction: rtl; text-align:right;">
          <p><b>مراحل زیر را با دقت دنبال نمایید!</b><br>فراموش نکنید قبل از هر کاری یکبار از فروشگاه خود جهت اطمینان خاطر یک فول بکاپ تهییه نمایید و سپس اقدام به آپگرید کنید. اپن کارت فارسی هیچ گونه مسئولیتی در صورتی که موارد زیر را رعایت نکنید، بر عهده نخواهد گرفت.</p>
          <ol>
            <li>هرگونه ارور و مشکل آپگرید اسکریپت را در انجمن پشتیبانی اپن کارت فارسی گزارش نمایید.</li>
            <li>بعد از آپگرید، کوکی های مرورگر خود را  برای جلوگیری از دریافت ارور پاک سازی نمایید.</li>
            <li>صفحه مدیریت را لود کرده و Ctrl+F5 را دو بار فشار داده تا مرورگر تغییرات css را به روز رسانی نماید.</li>
            <li>به قسمت سیستم->کاربران->گروه های کاربری (System->Users->User Groups) رفته و مدیر کل (Top Adminstrator) را ویرایش نموده و همه ی گزینه ها را انتخاب نمایید.</li>
            <li>به پنل مدیریت رفته و تنظیمات اصلی سیستم را ویرایش نمایید. همه ی فیلد ها را به روز رسانی کرده و بر روی ذخیره کلیک نمایید. حتی اگر هیچ چیز تغییر نکرده باشد.</li>
            <li>صفحه اصلی فروشگاه را لود کرده و Ctrl+F5 را دو بار فشار داده تا مرورگر تغییرات css را به روز رسانی نماید.</li>
          </ol>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="ادامه" class="btn btn-primary" />
          </div>		  
        </div>
      </form>
    </div>
    <div class="col-sm-3">
      <ul class="list-group">
        <li class="list-group-item" style="direction:rtl; text-align:right;"><b>آپگرید</b></li>
        <li class="list-group-item" style="direction:rtl; text-align:right;">پایان</li>
      </ul>
    </div>
  </div>
</div>
<?php echo $footer; ?>
import "./CardProducts.css";

import imgS3 from "../assets/images/slider03.jpg";

const CardProducts = () => {
  return (
    <div className="container">
      <h1 className="wrappert-card-products-title">برجسته ترین ها</h1>
      <div className="wrappert-card-products ">
        <div className="card-products">
          <div className="card-products-img">
            <img src={imgS3} alt="" />
          </div>
          <div className="card-products-content">
            <h2>لب تاپ وایو </h2>
            <p>
              از ویژگی‌های مهم نوت‌بوک‌های سری CW تنوع رنگ، زیبایی، کیفیت ساخت و
              قیمت مناسب در مقابل ارایه‌ی امکان{" "}
            </p>
          </div>
          <div className="card-products-price">
            <p>1,202تومان</p>
            <p>قیمت بدون مالیات: 1,000تومان</p>
          </div>
          <div className="card-products-footer">
            <button>
              <i class="fa-solid fa-cart-arrow-down"></i>
              اضاف به سبد خرید
            </button>
            <i class="fa-solid fa-heart"></i>
            <i class="fa-solid fa-arrows-left-right"></i>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CardProducts;

import "./Header.css";

import flagIR from "../assets/images/fa-ir.png";
import flagEN from "../assets/images/en-gb.png";

const header = () => {
  return (
    <div className="header">
      <div className="wrapper-header-nav container">
        <div className="right">
          <ul className="header-list">
            <li>
              <span> واحد پول</span>
              <i class="fa-sharp fa-solid fa-sort-down"></i>
              <div className="subitem-money">
                <li>تومان</li>
                <li>ریال</li>
              </div>
            </li>
            <li>
              <img src={flagIR} alt="" className="flag" />
              <span>زبان</span>
              <i class="fa-sharp fa-solid fa-sort-down"></i>
              <div className="subitem-languge">
                <li>
                  <img src={flagIR} alt="" className="flag" />
                  <span>فارسی</span>
                </li>
                <li>
                  <img src={flagEN} alt="" className="flag" />
                  <span>English</span>
                </li>
              </div>
            </li>
          </ul>
        </div>
        <div className="left">
          <ul className="header-list">
            <li>
              <i class="fa-solid fa-share"></i>
              <span>تسویه حساب</span>
            </li>
            <li>
              <i class="fa-solid fa-cart-arrow-down"></i>
              <span>سبد خرید</span>
            </li>
            <li>
              <i class="fa-solid fa-heart"></i>
              <span>لیست دلخواه</span>
            </li>
            <li>
              <i class="fa-solid fa-user"></i>
              <span>حساب کاربری</span>
              <i class="fa-sharp fa-solid fa-sort-down"></i>
              <div className="subitem-Account">
                <li>عضویت</li>
                <li>ورود</li>
              </div>
            </li>
            <li>
              <i class="fa-solid fa-phone"></i>
              <span>123456789</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default header;

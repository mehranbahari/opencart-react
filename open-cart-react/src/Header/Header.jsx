import "./Header.css";

const header = () => {
  return (
    <div className="header">
      <div className="wrapper-header-nav container">
        <div className="right">
          <ul className="header-list">
            <li>
              <span> واحد پول</span>
              <i> &dArr;</i>
              <div className="subitem-money">
                <li>تومان</li>
                <li>ریال</li>
              </div>
            </li>
            <li>
              <span>زبان</span>
              <i> &dArr;</i>
              <div className="subitem-languge">
                <li>
                  <i>&dArr;</i>
                  <span>فارسی</span>
                </li>
                <li>
                  <i>&dArr;</i>
                  <span>English</span>
                </li>
              </div>
            </li>
          </ul>
        </div>
        <div className="left">
          <ul className="header-list">
            <li>
              <i>&times;</i>
              <span>تسویه حساب</span>
            </li>
            <li>
              <i>&spades;</i>
              <span>سبد خرید</span>
            </li>
            <li>
              <i>&clubs;</i>
              <span>لیست دلخواه</span>
            </li>
            <li>
              <i>&hearts;</i>
              <span>حساب کاربری</span>
              <i> &dArr;</i>
              <div className="subitem-Account">
                <li>تومان</li>
                <li>ریال</li>
              </div>
            </li>
            <li>
              <i>&clubs;</i>
              <span>123456789</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default header;

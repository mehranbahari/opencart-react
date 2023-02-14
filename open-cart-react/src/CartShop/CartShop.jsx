import "./CartShop.css";

const CartShop = () => {
  return (
    <div className="wrapper-btn-cardshop">
      <button className="btn-cardshop">
        <div className="btn-product">
          <i>&times;</i>
          <span>0</span>
          محصول
        </div>
        <div className="btn-money">
          <span>0</span>
          تومان
        </div>
      </button>
    </div>
  );
};

export default CartShop;

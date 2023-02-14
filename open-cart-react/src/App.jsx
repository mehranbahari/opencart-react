import CardProducts from "./CardProducts/CardProducts";
import Header from "./Header/Header";
import Search from "./Search/search";
import SliderTop from "./SliderTop/SliderTop";

const App = () => {
  return (
    <div className="app">
      <Header />
        <Search />
        <SliderTop />
      <CardProducts />
    </div>
  );
};

export default App;

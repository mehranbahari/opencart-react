import { useState } from "react";
import "./Search.css";
import logo from '../assets/images/logo.png'

const search = () => {
  const [textSearch, setTextSearch] = useState("");

  const submitHanldler = (e) => {
    e.preventDefault();
    console.log(textSearch);
    setTextSearch("");
  };

  return (
    <div className="search-wrapper">
      <div className="logo">
        <img src={logo} alt="" />
      </div>
      <div className="search">
      <form onSubmit={submitHanldler}>
        <input
          value={textSearch}
          onChange={(e) => setTextSearch(e.target.value)}
          type="text"
          placeholder="جستجو"
        />
        <button onSubmit={submitHanldler}> &otimes;</button>
      </form>
      </div>
     
    </div>
  );
};

export default search;

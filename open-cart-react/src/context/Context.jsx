import { createContext } from "react";

const Context = createContext();

export const ContextProvide = ({ children }) => {
  return <Context.Provider>{children}</Context.Provider>;
};

export default Context;

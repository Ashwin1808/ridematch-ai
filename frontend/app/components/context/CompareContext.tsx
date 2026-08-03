"use client";

import { createContext, useContext, useState, useEffect } from "react";

const CompareContext = createContext<any>(null);

export function CompareProvider({
  children,
}: {
  children: React.ReactNode;
}) {

  const [compareList, setCompareList] = useState<number[]>([]);

  useEffect(() => {

    const saved = localStorage.getItem("compareGarage");

    if (saved) {

      setCompareList(JSON.parse(saved));

    }

  }, []);

  useEffect(() => {

    localStorage.setItem(

      "compareGarage",

      JSON.stringify(compareList)

    );

  }, [compareList]);

  //---------------------------------

  const addVehicle = (id:number)=>{

    if(compareList.includes(id)) return;

    if(compareList.length>=5){

      alert("Maximum 5 vehicles");

      return;

    }

    setCompareList([...compareList,id]);

  };

  //---------------------------------

  const removeVehicle=(id:number)=>{

    setCompareList(

      compareList.filter(v=>v!==id)

    );

  };

  //---------------------------------

  const clearCompare=()=>{

    setCompareList([]);

  };

  return(

    <CompareContext.Provider

      value={{

        compareList,

        addVehicle,

        removeVehicle,

        clearCompare

      }}

    >

      {children}

    </CompareContext.Provider>

  );

}

export const useCompare=()=>useContext(CompareContext);
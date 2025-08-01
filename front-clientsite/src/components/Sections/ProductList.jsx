// src/components/ProductList.jsx
import Product from '../Elements/Product';
import { useEffect, useState } from 'react';

const productos = [
  { id: 1, nombre: "Pan Francés", precio: 1.2, imagen: "https://via.placeholder.com/150" },
  { id: 2, nombre: "Croissant", precio: 2.5, imagen: "https://via.placeholder.com/150" },
  { id: 3, nombre: "Torta de Chocolate", precio: 15, imagen: "https://via.placeholder.com/150" },
  { id: 1, nombre: "Pan Francés", precio: 1.2, imagen: "https://via.placeholder.com/150" },
  { id: 2, nombre: "Croissant", precio: 2.5, imagen: "https://via.placeholder.com/150" },
  { id: 3, nombre: "Torta de Chocolate", precio: 15, imagen: "https://via.placeholder.com/150" },
];

export default function ProductList() {

const [products, setProducts] = useState();


var varsita = useEffect(() => {
  fetch('https://backend-763457621296.us-central1.run.app/productos')
    .then(res => res.json())
    .then(setProducts)
    .then(data => {
      console.log('Productos:', data);
      
    })
    .catch(err => console.error('Error al obtener productos:', err));
}, []);


  return (
    <section className="p-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
      {Array.isArray(varsita) ? 
      
      varsita.map((producto) => (
       <Product producto = {producto}/>
      ))
    : (
        <p>Cargando productos...</p>
      )
  }
    </section>
  );
}
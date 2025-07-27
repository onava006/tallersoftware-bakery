// src/components/ProductList.jsx
import Product from '../Elements/Product';

const productos = [
  { id: 1, nombre: "Pan Francés", precio: 1.2, imagen: "https://via.placeholder.com/150" },
  { id: 2, nombre: "Croissant", precio: 2.5, imagen: "https://via.placeholder.com/150" },
  { id: 3, nombre: "Torta de Chocolate", precio: 15, imagen: "https://via.placeholder.com/150" },
  { id: 1, nombre: "Pan Francés", precio: 1.2, imagen: "https://via.placeholder.com/150" },
  { id: 2, nombre: "Croissant", precio: 2.5, imagen: "https://via.placeholder.com/150" },
  { id: 3, nombre: "Torta de Chocolate", precio: 15, imagen: "https://via.placeholder.com/150" },
];

export default function ProductList() {
  return (
    <section className="p-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
      {productos.map((producto) => (
       <Product producto = {producto}/>
      ))
    }
    </section>
  );
}
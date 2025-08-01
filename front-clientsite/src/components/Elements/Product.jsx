import { Button } from 'react-bootstrap';

export default function Product({producto}) {
  return (
<Button>   
<div key={producto.id} className="border rounded-lg p-4 shadow hover:shadow-lg">
          <img src={producto.imagen} alt={producto.nombre} className="w-full h-40 object-cover rounded" />
          <h2 className="text-xl font-semibold mt-2">{producto.nombre}</h2>
          <p className="text-gray-700">${producto.precio}</p>
           <p className="text-gray-700">${producto.descripcion}</p>
        </div>
        </Button> 
       ); 
    }
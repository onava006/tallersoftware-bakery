// src/App.jsx
import PageBar from './components/Sections/PageBar';
import ProductList from './components/Sections/ProductList';


function App() {
  return (
    
      <div>
        <PageBar />
        <h2 className="text-3xl text-center font-bold mb-6">Nuestros Productos</h2>
        <ProductList />
      </div>

  );
}

export default App;